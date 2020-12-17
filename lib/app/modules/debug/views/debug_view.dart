import 'package:flutter/material.dart';
import 'package:get/get.dart'; 
import 'package:delivery_app/app/modules/debug/controllers/debug_controller.dart';

class DebugView extends GetView<DebugController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 200, bottom: 10),
          child: Container(
            height: 200,
            width: 200,
/*decoration: BoxDecoration(
image: DecorationImage(
image: AssetImage('images/img_splash.png'),
fit: BoxFit.fill)),*/
          ),
        ),
        Text(
          'CONNECT',
          style: TextStyle(
            color: Colors.greenAccent,
            fontSize: 20,
            decoration: TextDecoration.none,
          ),
        ),
      ]),
    );
  }
}