import 'package:bytebank/models/transfer.dart';
import 'package:bytebank/screens/transfers/form.dart';
import 'package:flutter/material.dart';

class TransferList extends StatefulWidget {
  final List<Transfer> _transferList = List();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TransferListState();
  }
}

class TransferListState extends State<TransferList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Transfer List')),
      body: ListView.builder(
        itemCount: widget._transferList.length,
        itemBuilder: (context, index) {
          final transfer = widget._transferList[index];
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
              addList(transferReceived);
           });
        },
      ),
    );
  }

  void addList(Transfer transferReceived) {
      setState(() {
      if (transferReceived != null) {
        widget._transferList.add(transferReceived);
      }
    });
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