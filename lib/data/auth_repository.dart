import 'dart:async';
import 'dart:convert';
import 'package:fresh_graphql/fresh_graphql.dart';
import 'package:preferences_repository/preferences_repository.dart';
import 'package:authentication_repository/authentication_repository.dart';

import 'package:tentura/consts.dart';
import 'package:tentura/ui/utils/ferry_utils.dart';

class AuthRepository {
  late final freshLink = FreshLink.oAuth2(
    tokenStorage: InMemoryTokenStorage(),
    tokenHeader: (token) => {
      'Authorization': 'Bearer ${token?.accessToken}',
    },
    refreshToken: (_, __) async {
      final jwt = await _authenticationRepository?.signIn();
      return jwt == null
          ? null
          : OAuth2Token(
              accessToken: jwt.accessToken,
              expiresIn: jwt.expiresIn,
            );
    },
    shouldRefresh: (response) => response.errors != null,
  );

  final _accounts = <String, String>{};

  final _preferences = GetIt.I<PreferencesRepository>();

  AuthenticationRepository? _authenticationRepository;

  String get myId => _authenticationRepository?.jwt?.id ?? '';

  bool get isAuthenticated => _authenticationRepository?.jwt != null;

  Iterable<String> get accounts => _accounts.keys;

  String? getSeed(String id) => _accounts[id];

  Future<AuthRepository> init() async {
    final accounts = await _preferences.get<String>(keyAccounts);
    if (accounts != null && accounts.isNotEmpty) {
      (jsonDecode(accounts) as Map<String, dynamic>)
          .forEach((key, value) => _accounts[key] = value as String);
    }
    try {
      final id = await _preferences.get<String>(keyCurrentId);
      if (id != null) await signIn(id);
    } catch (_) {}
    return this;
  }

  Future<void> dispose() async {
    await freshLink.dispose();
  }

  Future<void> addAccount(String seed) async {
    if (_accounts.values.contains(seed)) throw const SeedExistsException();
    final jwt = await AuthenticationRepository(
      serverName: appLinkBase,
      seed: base64Decode(seed),
    ).signIn();
    _accounts[jwt.id] = seed;
    await _saveAccounts();
  }

  Future<void> createAccount() async {
    try {
      _authenticationRepository = AuthenticationRepository.seed(
        serverName: appLinkBase,
      );
      await _authenticationRepository?.signUp();
      _accounts[_authenticationRepository!.jwt!.id] =
          base64UrlEncode(_authenticationRepository!.seed);
      await _saveAccounts();
      await _saveCurrentId();
    } catch (e) {
      _authenticationRepository = null;
      rethrow;
    } finally {
      await _setToken();
    }
  }

  Future<void> signIn(String id) async {
    try {
      _authenticationRepository = AuthenticationRepository(
        serverName: appLinkBase,
        seed: base64Decode(_accounts[id]!),
      );
      await _authenticationRepository?.signIn();
    } catch (e) {
      _authenticationRepository = null;
      rethrow;
    } finally {
      await _setToken();
      await _saveCurrentId();
    }
  }

  Future<void> deleteAccount(String id) async {
    await _authenticationRepository?.delete();
    _accounts.remove(id);
    await _saveAccounts();
    await signOut();
  }

  Future<void> signOut() async {
    _authenticationRepository = null;
    await _saveCurrentId();
    await _setToken();
  }

  Future<void> removeAccount(String id) async {
    _accounts.remove(id);
    await _saveAccounts();
  }

  Future<void> _saveAccounts() => _preferences.set<String>(
        keyAccounts,
        jsonEncode(_accounts),
      );

  Future<void> _saveCurrentId() => _preferences.set<String>(
        keyCurrentId,
        _authenticationRepository?.jwt?.id,
      );

  Future<void> _setToken() => _authenticationRepository?.jwt == null
      ? freshLink.clearToken()
      : freshLink.setToken(OAuth2Token(
          accessToken: _authenticationRepository!.jwt!.accessToken,
          expiresIn: _authenticationRepository?.jwt?.expiresIn,
        ));
}

class SeedExistsException implements Exception {
  const SeedExistsException();
}
