import 'package:delivery_app/app/data/models/user.dart';
import 'package:delivery_app/app/modules/cart/controllers/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdressSection extends StatelessWidget {
  final String adress;

  AdressSection({Key key, this.adress}) : super(key: key);

  final CartController controller = Get.find<CartController>();
  
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(
          Icons.location_on,
          size: 42,
          color: Colors.redAccent,
        ),
        title: Text(
          adress,
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
        subtitle: Text(
          'Enviar para',
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
        ),
        onTap: controller.onAdressPressed,
      ),
    );
  }
}
