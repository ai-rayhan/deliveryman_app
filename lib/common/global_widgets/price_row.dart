import 'package:deliveryman_app/helper/translated_text.dart';
import 'package:flutter/material.dart';

class PriceRow extends StatelessWidget {
  final String labelKey;
  final String amount;

  const PriceRow({
    Key? key,
    required this.labelKey,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(labelKey.translate),
        Text(
          amount,
          style: const TextStyle(fontWeight: FontWeight.normal),
        ),
      ],
    );
  }
}
