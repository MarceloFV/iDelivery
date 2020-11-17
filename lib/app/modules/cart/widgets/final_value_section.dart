import 'package:flutter/material.dart';

class FinalValueSection extends StatelessWidget {
  final String frete;
  final String total;

  const FinalValueSection({Key key, this.frete, this.total}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'Valor Frete: $frete',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Custo total:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            Text(total,
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
