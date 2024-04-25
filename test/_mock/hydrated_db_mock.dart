// ignore_for_file: avoid_print

import 'package:hydrated_bloc/hydrated_bloc.dart';

class HydratedStorageMock implements Storage {
  final _storage = <String, Object?>{};

  @override
  Future<void> close() async {
    print('HydratedStorageMock: close');
  }

  @override
  Future<void> clear() async {
    print('HydratedStorageMock: clear');
    _storage.clear();
  }

  @override
  Future<Object?> read(String key) async {
    final value = _storage[key];
    print('HydratedStorageMock: read {$key: $value}');
    return value;
  }

  @override
  Future<void> write(String key, Object? value) async {
    print('HydratedStorageMock: write {$key: $value}');
    _storage[key] = value;
  }

  @override
  Future<void> delete(String key) async {
    final value = _storage.remove(key);
    print('HydratedStorageMock: delete {$key: $value}');
  }
}
