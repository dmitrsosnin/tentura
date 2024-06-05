import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:hive/hive.dart';
import 'package:ferry/ferry.dart';
import 'package:path_provider/path_provider.dart';
import 'package:gql_http_link/gql_http_link.dart';
import 'package:fresh_graphql/fresh_graphql.dart';
import 'package:ferry_hive_store/ferry_hive_store.dart';

import 'package:http/http.dart' as http;
import 'package:ed25519_edwards/ed25519_edwards.dart' as ed;

import 'package:tentura/consts.dart';
import 'package:tentura/domain/exception.dart';

export 'package:ferry/ferry.dart' show DataSource, FetchPolicy, Client;

class RemoteApiService {
  static const _jwtHeader = 'eyJhbGciOiJFZERTQSIsInR5cCI6IkpXVCJ9.';

  RemoteApiService({
    this.serverName = appLinkBase,
  });

  final String serverName;

  late final Client gqlClient;

  late final _authLink = FreshLink.oAuth2(
    tokenStorage: InMemoryTokenStorage(),
    tokenHeader: (token) => {
      'Authorization': 'Bearer ${token!.accessToken}',
    },
    refreshToken: (token, client) async {
      final jwt = await _fetchJWT('user/login');
      return OAuth2Token(
        accessToken: jwt.accessToken,
        expiresIn: jwt.expiresIn,
      );
    },
    shouldRefresh: (response) => response.errors != null,
  );

  late ed.KeyPair _keyPair;

  Future<String?> get token => _authLink.token.then((e) => e?.accessToken);

  Future<RemoteApiService> init({Directory? storageDirectory}) async {
    gqlClient = await _buildGqlClient(
      serverName: serverName,
      storageDirectory:
          storageDirectory ?? await getApplicationDocumentsDirectory(),
    );
    return this;
  }

  Future<void> dispose() async {
    await gqlClient.dispose();
    await _authLink.dispose();
  }

  Future<void> putAvatar({
    required String userId,
    required Uint8List image,
  }) async {
    await http.put(
      Uri.https(
        serverName,
        '/images/$userId/avatar.jpg',
      ),
      headers: {
        'Content-Type': 'image/jpeg',
        'Authorization': 'Bearer ${await token}',
      },
      body: image,
    );
  }

  Future<void> putBeacon({
    required String userId,
    required String beaconId,
    required Uint8List image,
  }) async {
    await http.put(
      Uri.https(
        serverName,
        '/images/$userId/$beaconId.jpg',
      ),
      headers: {
        'Content-Type': 'image/jpeg',
        'Authorization': 'Bearer ${await token}',
      },
      body: image,
    );
  }

  Future<Client> _buildGqlClient({
    String serverName = appLinkBase,
    Directory? storageDirectory,
  }) async {
    final link = Link.from([
      _authLink,
      HttpLink('https://$serverName/v1/graphql'),
    ]);
    if (storageDirectory == null) return Client(link: link);
    Hive.init(storageDirectory.path);
    final box = await Hive.openBox<Map<dynamic, dynamic>>('graphql_cache');
    return Client(
      link: link,
      cache: Cache(
        store: HiveStore(box),
      ),
      defaultFetchPolicies: {
        OperationType.query: FetchPolicy.NoCache,
      },
    );
  }

  Future<String> signIn(String seed) async {
    final privateKey = ed.newKeyFromSeed(base64Decode(seed));
    _keyPair = ed.KeyPair(privateKey, ed.public(privateKey));

    final jwt = await _fetchJWT('user/login');
    await _authLink.setToken(OAuth2Token(
      accessToken: jwt.accessToken,
      expiresIn: jwt.expiresIn,
    ));
    return jwt.id;
  }

  Future<({String id, String seed})> signUp() async {
    _keyPair = ed.generateKey();
    final jwt = await _fetchJWT('user/register');
    await _authLink.setToken(OAuth2Token(
      accessToken: jwt.accessToken,
      expiresIn: jwt.expiresIn,
    ));
    return (
      id: jwt.id,
      seed: base64UrlEncode(ed.seed(_keyPair.privateKey)),
    );
  }

  // TBD: invalidate jwt on remote server also
  Future<void> signOut() async {
    await _authLink.clearToken();
  }

  // TBD: remove account on remote server
  Future<void> delete() async {
    await _authLink.clearToken();
  }

  Future<({String id, String accessToken, int expiresIn})> _fetchJWT(
    String path,
  ) async {
    final response = await http.post(
      Uri.https(serverName, path),
      headers: {
        'Authorization': 'Bearer ${_createAuthRequestToken()}',
      },
    );
    switch (response.statusCode) {
      case 200:
        final body = jsonDecode(response.body) as Map;
        return (
          id: body['subject'] as String,
          expiresIn: body['expires_in'] as int,
          accessToken: body['access_token'] as String,
        );
      case 401:
        throw const AuthenticationFailedException();
      case 404:
        throw const AuthenticationNotFoundException();
      case 409:
        throw const AuthenticationDuplicatedException();
      case 502:
        throw const AuthenticationServerException();
      default:
        throw AuthenticationHttpException(response.reasonPhrase);
    }
  }

  String _createAuthRequestToken() {
    final now = DateTime.timestamp().millisecondsSinceEpoch ~/ 1000;
    final body = base64UrlEncode(utf8.encode(jsonEncode({
      'pk': base64UrlEncode(_keyPair.publicKey.bytes).replaceAll('=', ''),
      'iat': now,
      'exp': now + jwtExpiresIn.inSeconds,
      // TBD: uuid for jwt invalidation on logout
      'jti': '',
    }))).replaceAll('=', '');
    final signature = base64UrlEncode(ed.sign(
      _keyPair.privateKey,
      Uint8List.fromList(utf8.encode(_jwtHeader + body)),
    )).replaceAll('=', '');
    return '$_jwtHeader$body.$signature';
  }
}

extension ErrorHandler<TData, TVars> on OperationResponse<TData, TVars> {
  bool get hasNoErrors => !hasErrors;

  OperationResponse<TData, TVars> throwIfError({
    bool failOnNull = true,
    String? label,
  }) {
    if (hasErrors) {
      throw GraphQLException(
        error: linkException ?? graphqlErrors,
        label: label,
      );
    }
    if (failOnNull && data == null) {
      throw GraphQLNoDataException(label: label);
    }
    return this;
  }

  TData dataOrThrow({String? label}) => throwIfError(label: label).data!;
}

class GraphQLException implements Exception {
  const GraphQLException({
    this.label = 'No label',
    this.error = 'Unknown error on OperationRequest',
  });

  final Object? error;
  final String? label;

  @override
  String toString() => '$label: $error';
}

class GraphQLNoDataException implements Exception {
  const GraphQLNoDataException({
    this.label = 'No label',
  });

  final String? label;

  @override
  String toString() => '$label: OperationResponse has no data';
}
