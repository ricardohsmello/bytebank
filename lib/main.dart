import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: const Text('Bytebank')),
      body: ListaTransferencia(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      ),
    )));

class ListaTransferencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ItemTransferencia(Transferencia('Caixa', 120, '01-20-2020')),
        ItemTransferencia(Transferencia('Santander', 3120, '01-20-2020')),
        ItemTransferencia(Transferencia('Nubank', 120, '01-20-2020')),

      ],
    );
  }
}

class ItemTransferencia extends StatelessWidget {

  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.nomeConta),
        subtitle: Text(_transferencia.valorConta.toString()),
        trailing: Text(_transferencia.data),
      ),
    );
  }
}

class Transferencia {
  String nomeConta;
  double valorConta;
  String data;

  Transferencia(this.nomeConta, this.valorConta, this.data);
}