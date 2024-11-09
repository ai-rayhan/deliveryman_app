
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
              color: Color(0xff007d78),
              title: 'Today\'s Orders',
              value: '3',
            ),
            ),
            SizedBox(width: 16),
            Expanded(
              child:  OrderCountCard(
              color: Color(0xff006c78),
              title: 'This Week Orders',
              value: '3',
            ),
            ),
          ],
        ),
        SizedBox(height: 16),
        OrderCountCard(
              color: Color(0xff008e6c),
              title: 'Total Orders',
              value: '3',
            ),
          SizedBox(height: 16),
      ],
    );
  }
}
