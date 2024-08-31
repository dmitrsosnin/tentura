import 'dart:math';
import 'dart:convert';
import 'package:hive_ce/hive.dart';
import 'package:flutter/foundation.dart';
import 'package:synchronized/synchronized.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class HydratedStorage implements Storage {
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

  static final _lock = Lock();

  late final Box<Object?> _box;

  Future<void> init() async {
    if (!kIsWeb) Hive.init((await getApplicationDocumentsDirectory()).path);
    _box = await Hive.openBox<Object?>(
      'hydrated_box',
      encryptionCipher: HiveAesCipher(await _getCipherKey()),
    );
    HydratedBloc.storage = HydratedStorage();
  }

  @override
  Object? read(String key) => _box.get(key);

  @override
  Future<void> write(String key, Object? value) =>
      _lock.synchronized(() => _box.put(key, value));

  @override
  Future<void> delete(String key) => _lock.synchronized(() => _box.delete(key));

  @override
  Future<void> clear() => _lock.synchronized(_box.clear);

  @override
  Future<void> close() async {
    if (_box.isOpen) {
      HydratedBloc.storage = null;
      return _lock.synchronized(_box.close);
    }
  }

  Future<Uint8List> _getCipherKey() async {
    const keyCipherKey = 'kCipherKey';
    final encodedKey = await _secureStorage.read(key: keyCipherKey);
    late final rnd = Random.secure();
    final key = encodedKey == null
        ? Uint8List.fromList(List<int>.generate(32, (i) => rnd.nextInt(255)))
        : base64Decode(encodedKey);
    if (encodedKey == null) {
      await _secureStorage.write(
        key: keyCipherKey,
        value: base64UrlEncode(key),
      );
    }
    return key;
  }
}
