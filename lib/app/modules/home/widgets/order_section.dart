
import 'package:deliveryman_app/app/modules/home/widgets/dashboard_card.dart';
import 'package:flutter/material.dart';

class OrdersSection extends StatelessWidget {
  const OrdersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(
              child: OrderCountCard(
              color: Color.fromARGB(195, 21, 187, 26),
              title: 'Today\'s Orders',
              value: '3',
            ),
            ),
            SizedBox(width: 16),
            Expanded(
              child:  OrderCountCard(
              color: Color.fromARGB(201, 40, 128, 42),
              title: 'This Week Orders',
              value: '3',
            ),
            ),
          ],
        ),
        SizedBox(height: 16),
        OrderCountCard(
              color: Color.fromARGB(173, 40, 136, 91),
              title: 'Total Orders',
              value: '3',
            ),
          SizedBox(height: 16),
      ],
    );
  }
}
