import 'package:flutter/material.dart';

class MessageSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        decoration: InputDecoration(
            hintText: "Nota para o restaurante",
            border: OutlineInputBorder(),
            fillColor: Colors.grey),
      ),
    );
  }
}
