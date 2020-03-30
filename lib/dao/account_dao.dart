import 'package:bytebank/database/app_database.dart';
import 'package:bytebank/models/account.dart';
import 'package:sqflite/sqflite.dart';

class AccountDAO {
  static const String tableSql = 'CREATE TABLE $_accountTable('
      '$_id INTEGER PRIMARY KEY, '
      '$_name TEXT, '
      '$_value DOUBLE) ';

  static const String _accountTable = 'accounts';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _value = 'value';

  Future<int> save(Account account) async {
    final Database db = await getDatabase();
    Map<String, dynamic> values = _toMap(account);
    return db.insert(_accountTable, values);
  }

  Map<String, dynamic> _toMap(Account account) {
    Map<String, dynamic> values = Map();
    values[_name] = account.accountName;
    values[_value] = account.accountValue;
    return values;
  }

  Future<List<Account>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_accountTable);
    List<Account> accounts = _toList(result);
    return accounts;
  }

  List<Account> _toList(List<Map<String, dynamic>> result) {
    final List<Account> accounts = List();
    for (Map<String, dynamic> row in result) {
      final Account account = Account(
        row[_id],
        row[_name],
        row[_value],
      );

      accounts.add(account);
    }
    return accounts;
  }

  Future<int> update(Account account) async {
    final Database db = await getDatabase();
    final Map<String, dynamic> contactMap = _toMap(account);
    return db.update(
      _accountTable,
      contactMap,
      where: 'id = ?',
      whereArgs: [account.id],
    );
  }

  Future<int> delete(int id) async {
    final Database db = await getDatabase();
    return db.delete(
      _accountTable,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
