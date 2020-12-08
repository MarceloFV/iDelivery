import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delivery_app/app/modules/store/controllers/store_controller.dart';

class StoreView extends GetView<StoreController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () => Get.back(),
        ),
        elevation: 0,
      ),
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Container(
                color: Colors.red,
                child: controller.store.imgUrl != null
                    ? Image.network(
                        //TODO: Efeito caroulsel sera implementado aqui
                        controller.store.imgUrl,
                        height: 310.0,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        'assets/images/not-found.jpg',
                        height: 310.0,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            Text(controller.store.title),
          ],
        ),
      ),
    );
  }
}
