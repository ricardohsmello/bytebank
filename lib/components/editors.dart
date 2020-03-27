import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController controller;
  final String lblText;
  final String lblHint;
  final IconData icon;
  final TextInputType keyBoardType;

  Editor({
    this.controller,
    this.lblText,
    this.lblHint,
    this.icon,
    this.keyBoardType,
  });

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
