import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delivery_app/app/modules/splash/controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlutterLogo(
          size: 64,
        ),
      ),
    );
  }
}
