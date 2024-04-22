import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class HydratedDbService {
  static const _iOptions = IOSOptions(
    accessibility: KeychainAccessibility.first_unlock_this_device,
  );
  static const _aOptions = AndroidOptions(
    encryptedSharedPreferences: true,
    storageCipherAlgorithm: StorageCipherAlgorithm.AES_GCM_NoPadding,
    keyCipherAlgorithm:
        KeyCipherAlgorithm.RSA_ECB_OAEPwithSHA_256andMGF1Padding,
  );
  static const _key = 'kSeed';

  static Future<void> init() async {
    const secureStorage = FlutterSecureStorage();
    final encodedKey = await secureStorage.read(
      key: _key,
      iOptions: _iOptions,
      aOptions: _aOptions,
    );
    final key = encodedKey == null
        ? Hive.generateSecureKey()
        : base64Decode(encodedKey);
    if (encodedKey == null) {
      await secureStorage.write(
        key: _key,
        value: base64UrlEncode(key),
        iOptions: _iOptions,
        aOptions: _aOptions,
      );
    }
    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory(),
      encryptionCipher: HydratedAesCipher(key),
    );
  }
}
