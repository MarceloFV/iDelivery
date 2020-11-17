import 'package:flutter/material.dart';

class FinalValueSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('Valor Frete: \$4',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Custo total:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  Text('\$40',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Colors.blue)),
                ],
              ),
            ],
          );
  }
}
