import 'dart:convert';
import 'package:injectable/injectable.dart';

import 'package:tentura/data/service/local_secure_storage.dart';

import '../../domain/entity/account.dart';
import '../model/account_model.dart';

@singleton
class AuthRepository {
  static const _repositoryKey = 'Auth:';
  static const _accountKey = '${_repositoryKey}Id:';
  static const _accountIdAllKey = '${_repositoryKey}All:';
  static const _currentAccountKey = '${_repositoryKey}currentAccountId';

  AuthRepository(this._localStorage);

  final LocalSecureStorage _localStorage;

  Future<String> getCurrentAccountId() =>
      _localStorage.read(_currentAccountKey).then((v) => v ?? '');

  Future<String> setCurrentAccountId(String? id) =>
      _localStorage.write(_currentAccountKey, id).then((_) => id ?? '');

  Future<Account?> getAccountById(String id) => _localStorage
      .read('$_accountKey$id')
      .then((v) => switch (jsonDecode(v ?? 'null')) {
            final Map<String, dynamic> j => AccountModel.fromJson(j).toEntity,
            _ => null,
          });

  Future<Set<Account>> getAccountAll() async {
    final result = <Account>{};
    for (final id in await _getIdAll()) {
      final account = await getAccountById(id);
      if (account != null) result.add(account);
    }
    return result;
  }

  Future<Account> addAccount(Account account) async {
    await _setIdAll((await _getIdAll())..add(account.id));
    await _localStorage.write(
      '$_accountKey${account.id}',
      jsonEncode(AccountModel.fromEntity(account).toJson()),
    );
    return account;
  }

  Future<void> removeAccountById(String id) async {
    await _setIdAll((await _getIdAll())..removeWhere((e) => e == id));
    await _localStorage.write('$_accountKey$id', null);
  }

  Future<Set<String>> _getIdAll() => _localStorage.read(_accountIdAllKey).then(
        (v) => (jsonDecode(v ?? '[]') as List).map((e) => e as String).toSet(),
      );

  Future<void> _setIdAll(Set<String> idAll) => _localStorage.write(
        _accountIdAllKey,
        jsonEncode(idAll.toList()),
      );
}
