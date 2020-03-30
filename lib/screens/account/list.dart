import 'package:bytebank/dao/account_dao.dart';
import 'package:bytebank/models/account.dart';
import 'package:bytebank/screens/account/form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AccountListState();
  }
}

class AccountListState extends State<AccountList> {
  final AccountDAO _accountDAO = AccountDAO();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Accounts')),
      body: FutureBuilder<List<Account>>(
        initialData: List(),
        future: Future.delayed(Duration(seconds: 1))
            .then((value) => _accountDAO.findAll()),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              // TODO: Handle this case.
              break;
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Text('Loading')
                  ],
                ),
              );
              break;
            case ConnectionState.active:
              // TODO: Handle this case.
              break;
            case ConnectionState.done:
              final List<Account> accountList = snapshot.data;
              return ListView.builder(
                itemCount: accountList?.length ?? 0,
                itemBuilder: (context, index) {
                  final account = accountList[index];
                  return AccountItem(account);
                },
              );

              break;
          }
          return Text('Unknown Error');
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AccountForm();
          }));
        },
      ),
    );
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
