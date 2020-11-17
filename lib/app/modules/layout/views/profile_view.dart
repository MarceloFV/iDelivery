import 'package:delivery_app/app/modules/layout/controllers/layout_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  final LayoutController controller = Get.find<LayoutController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          children: [
            Card(
              child: Container(
                height: 300,
                color: Colors.blue,
              ),
            ),
            Card(
              // color: Colors.grey,
              child: ListTile(
                title: Text("Historico"),
                trailing: Icon(Icons.exit_to_app),
                onTap: () => {},
              ),
            ),
            Card(
              // color: Colors.grey,
              child: ListTile(
                title: Text("Sair"),
                trailing: Icon(Icons.exit_to_app),
                onTap: controller.onLogoutPressed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
