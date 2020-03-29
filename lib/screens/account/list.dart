import 'package:bytebank/models/account.dart';
import 'package:bytebank/screens/account/form.dart';
 import 'package:flutter/material.dart';

class AccountList extends StatefulWidget {
  final List<Account> _accountList = List();

  @override
  State<StatefulWidget> createState() {
     return AccountListState();
  }
}

class AccountListState extends State<AccountList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Accounts')),
      body: ListView.builder(
        itemCount: widget._accountList.length,
        itemBuilder: (context, index) {
          final account = widget._accountList[index];
          return AccountItem(account);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final Future<Account> future =
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AccountForm();
          }));

          future.then((accountReceived) {
              addList(accountReceived);
           });
        },
      ),
    );
  }

  void addList(Account accountReceived) {
      setState(() {
      if (accountReceived != null) {
        widget._accountList.add(accountReceived);
      }
    });
  }
}

class AccountItem extends StatelessWidget {
  final Account _account;

  AccountItem(this._account);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_account.accountName),
        subtitle: Text(_account.accountValue.toString()),
        trailing: Text('25/03/2020'),
      ),
    );
  }
}