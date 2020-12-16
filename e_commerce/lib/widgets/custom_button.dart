import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final Function function;
  CustomButton({this.text, this.color, this.function});
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        color: color,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        onPressed: function);
  }
}
