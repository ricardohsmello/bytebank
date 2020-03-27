import 'package:bytebank/components/editors.dart';
import 'package:bytebank/models/transfer.dart';
import 'package:flutter/material.dart';

const _titleAppBar = 'New account bank';

class TransferForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TransferFormState();
  }
}

class TransferFormState extends State<TransferForm> {
  final TextEditingController _controllerAccountName = TextEditingController();
  final TextEditingController _controllerAccountValue = TextEditingController();

  void _addTransf(BuildContext context) {
    final String accountName = _controllerAccountName.text;
    final double accountValue = double.tryParse(_controllerAccountValue.text);

    if (accountName != null && accountValue != null) {
      final transfCreated = Transfer(accountName, accountValue);
      Navigator.pop(context, transfCreated);
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('Record saved successfully!'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
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
      ),
    );
  }
}