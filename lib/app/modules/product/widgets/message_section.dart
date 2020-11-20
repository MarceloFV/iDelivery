import 'package:flutter/material.dart';

class MessageSection extends StatelessWidget {
  final TextEditingController controller;

  const MessageSection({Key key, this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            hintText: "Nota para o restaurante",
            border: OutlineInputBorder(),
            fillColor: Colors.grey),
      ),
    );
  }
}
