import 'package:delivery_app/app/global_widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; 
import 'package:delivery_app/app/modules/adress/controllers/adress_controller.dart';

class AdressView extends GetView<AdressController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Adicionar endereço', onBackPressed: controller.onBackPressed,),
      body: Center(
        child: Text(
          'AdressView is working', 
          style: TextStyle(fontSize:20),
        ),
      ),
    );
  }
}
  