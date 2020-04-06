import 'package:bytebank/screens/dashboard/dashboard.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(ByteBankApp());

//  save(Transaction(3000, Account(0, 'Devinha', 323))).then((transaction) => print(transaction));

//  findAll().then((transactions) => print('new Transactions $transactions'));
//  save(Account(0, 'Caixinha', 4232)).then((id) {
//    findAll().then((accounts) {
//      debugPrint(accounts.toString());
//    });
//  });
}

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      theme: ThemeData.dark(),
      theme: ThemeData(
        primaryColor: Colors.green[900],
        accentColor: Colors.blueAccent[700],
        buttonTheme: ButtonThemeData(
            buttonColor: Colors.blueAccent[700],
            textTheme: ButtonTextTheme.primary),
      ),
      home: Dashboard(),
    );
  }
}

