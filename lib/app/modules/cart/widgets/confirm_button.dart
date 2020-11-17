import 'package:flutter/material.dart';

//TODO: Delete
class ConfirmButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
            onPressed: () {},
            child: Container(
              height: 50,
              alignment: Alignment.center,
              child: Text(
                'Confirmar pedido',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          );
  }
}
