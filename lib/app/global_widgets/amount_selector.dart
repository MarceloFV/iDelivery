import 'package:flutter/material.dart';

class AmountSelector extends StatelessWidget {
  final Function onRemove;
  final Function onAdd;
  final int amount;

  const AmountSelector({Key key, this.onRemove, this.onAdd, this.amount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          child: IconButton(
            icon: Icon(Icons.remove),
            onPressed: onRemove,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.red.withOpacity(0.1),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child:  Text(
              amount.toString(),
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
        ),
        Container(
          child: IconButton(
            icon: Icon(Icons.add),
            onPressed: onAdd,
          ),
          decoration: BoxDecoration(
            color: Colors.green.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }
}
