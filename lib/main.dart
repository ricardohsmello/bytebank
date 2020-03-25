import 'package:flutter/material.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: TransferForm(),
      ),
    );
  }
}

class TransferForm extends StatelessWidget {
  final TextEditingController _controllerAccountName = TextEditingController();
  final TextEditingController _controllerAccountValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New account bank'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controllerAccountName,
              style: TextStyle(fontSize: 24.0),
              decoration: InputDecoration(
                  labelText: 'Account name', hintText: 'CitiBank'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controllerAccountValue,
              style: TextStyle(fontSize: 24.0),
              decoration: InputDecoration(
                  icon: Icon(Icons.monetization_on),
                  labelText: 'Opening balance',
                  hintText: '2000'),
              keyboardType: TextInputType.number,
            ),
          ),
          RaisedButton(
            child: Text('Salvar'),
            onPressed: () {
              final String accountName = _controllerAccountName.text;
              final double accountValue =
                  double.tryParse(_controllerAccountValue.text);

              if (accountName != null && accountValue != null) {
                final transfCreated = Transfer(accountName, accountValue);
                debugPrint('$transfCreated');

                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text('Record saved successfully!'),
                ));
              }
            },
          ),
        ],
      ),
    );
  }
}

class TransferList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Transfer List')),
      body: Column(
        children: <Widget>[
          TransferItem(Transfer('CitiBank', 2120)),
          TransferItem(Transfer('Santander', 312)),
          TransferItem(Transfer('Nubank', 720)),
        ],
      ),
    );
  }
}

class TransferItem extends StatelessWidget {
  final Transfer _transfer;

  TransferItem(this._transfer);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transfer.accountName),
        subtitle: Text(_transfer.accountValue.toString()),
        trailing: Text('25/03/2020'),
      ),
    );
  }
}

class Transfer {
  String accountName;
  double accountValue;

  Transfer(this.accountName, this.accountValue);

  @override
  String toString() {
    return 'Transfer{accountName: $accountName, accountValue: $accountValue}';
  }
}
