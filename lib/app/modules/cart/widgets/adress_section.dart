import 'package:flutter/material.dart';

class AdressSection extends StatelessWidget {
  final String adress;
  final Function onAdressPressed;

  AdressSection({Key key, this.adress, this.onAdressPressed}) : super(key: key);

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
        onTap: onAdressPressed,
      ),
    );
  }
}
