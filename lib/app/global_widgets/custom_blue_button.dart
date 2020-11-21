
import 'package:flutter/material.dart';

class CustomBlueButton extends StatelessWidget {
  final Function function;
  final String text;
  final Color color;
  final Color textColor;
  final Color splashColor;
  final double fontSize;

  CustomBlueButton({
    @required this.function,
    @required this.text,
    this.splashColor = Colors.blueGrey,
    this.fontSize = 16,
    this.color = Colors.blue,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        splashColor: this.splashColor,
        onPressed: () => this.function(),
        color: this.color,
        child: Container(
          height: 50,
          alignment: Alignment.center,
          child: Text(
            this.text,
            style: TextStyle(
              color: this.textColor,
              fontSize: this.fontSize,
            ),
          ),
        ),
    );
  }
}

