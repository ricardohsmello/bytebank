import 'package:flutter/material.dart';

class Progress extends StatelessWidget {
  final String title;

  Progress({this.title = 'Loading'});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[CircularProgressIndicator(), Text(title)],
      ),
    );
  }
}
