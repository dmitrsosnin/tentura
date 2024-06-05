import 'dart:io';
import 'dart:math';
import 'dart:convert';
import 'dart:typed_data';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class HydratedBlocStorage {
  static const _secureStorage = FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
      storageCipherAlgorithm: StorageCipherAlgorithm.AES_GCM_NoPadding,
      keyCipherAlgorithm:
          KeyCipherAlgorithm.RSA_ECB_OAEPwithSHA_256andMGF1Padding,
    ),
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock_this_device,
    ),
  );

  static const _keyCipherKey = 'kCipherKey';

  static Future<void> init(Directory storageDirectory) async {
    HydratedBloc.storage = await HydratedStorage.build(
      encryptionCipher: HydratedAesCipher(await _getCipherKey()),
      storageDirectory: storageDirectory,
    );
  }

  static Future<Uint8List> _getCipherKey() async {
    final encodedKey = await _secureStorage.read(key: _keyCipherKey);
    late final rnd = Random.secure();
    final key = encodedKey == null
        ? Uint8List.fromList(List<int>.generate(32, (i) => rnd.nextInt(255)))
        : base64Decode(encodedKey);
    if (encodedKey == null) {
      await _secureStorage.write(
        key: _keyCipherKey,
        value: base64UrlEncode(key),
      );
    }
    return key;
  }
}
