import 'package:flutter/material.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: TransferList(),
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
          Editor(
            controller: _controllerAccountName,
            icon: null,
            keyBoardType: TextInputType.text,
            lblHint: 'CitiBank',
            lblText: 'Account Name',
          ),
          Editor(
            icon: Icons.monetization_on,
            keyBoardType: TextInputType.number,
            lblHint: '2000',
            lblText: 'Opening balance',
            controller: _controllerAccountValue,
          ),
          Builder(
            builder: (BuildContext context) {
              return RaisedButton(
                child: Text('Salvar'),
                onPressed: () {
                  _addTransf(context);
                },
              );
            },
          ),
        ],
      ),
    );
  }

  void _addTransf(BuildContext context) {
    final String accountName = _controllerAccountName.text;
    final double accountValue = double.tryParse(_controllerAccountValue.text);

    if (accountName != null && accountValue != null) {
      final transfCreated = Transfer(accountName, accountValue);
      debugPrint('$transfCreated');

      Navigator.pop(context, transfCreated);

      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('Record saved successfully!'),
      ));
    }
  }
}

class Editor extends StatelessWidget {
  final TextEditingController controller;
  final String lblText;
  final String lblHint;
  final IconData icon;
  final TextInputType keyBoardType;

  Editor(
      {this.controller,
      this.lblText,
      this.lblHint,
      this.icon,
      this.keyBoardType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        style: TextStyle(fontSize: 24.0),
        decoration: InputDecoration(
            icon: icon != null ? Icon(icon) : null,
            labelText: lblText,
            hintText: lblHint),
        keyboardType: keyBoardType,
      ),
    );
  }
}

class TransferList extends StatelessWidget {
  final List<Transfer> _transferList = List();

  @override
  Widget build(BuildContext context) {
    _transferList.add(Transfer('Santander', 1000));
    _transferList.add(Transfer('Caixa', 1000));
    _transferList.add(Transfer('Caixa', 1000));

    return Scaffold(
      appBar: AppBar(title: Text('Transfer List')),
      body: ListView.builder(
        itemCount: _transferList.length,
        itemBuilder: (context, index) {
          final transfer = _transferList[index];
          return TransferItem(transfer);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final Future<Transfer> future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return TransferForm();
          }));

          future.then((transferReceived) {
            debugPrint('chegou no then');
            debugPrint('$transferReceived');
            _transferList.add(transferReceived);
          });
        },
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
