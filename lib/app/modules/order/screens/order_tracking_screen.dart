import 'package:deliveryman_app/common/global_widgets/appbar.dart';
import 'package:deliveryman_app/helper/translated_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderTrackingScreen extends StatelessWidget {
  const OrderTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int orderStatus = Get.arguments;
    return Scaffold(
      appBar: showAppBar(context: context, text: 'order_tracking'.translate),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Column(
              children: [
                 OrderStepWidget(
                  title: 'order_placed'.translate,
                  subtitle: "order_placed_message".translate,
                  icon: Icons.receipt_long,
                  isActive: true,
                ),
                if (orderStatus != 4)
                  OrderStepWidget(
                    title: "order_confirmed".translate,
                    subtitle: "order_confirmed_message".translate,
                    icon: Icons.verified_user,
                    isActive: orderStatus == 2 || orderStatus == 1,
                  ),
                if (orderStatus != 4)
                  OrderStepWidget(
                    title: "order_preparing".translate,
                    subtitle: 'order_preparing_message'.translate,
                    icon: Icons.wifi_protected_setup_rounded,
                    isActive: orderStatus == 2 || orderStatus == 1,
                  ),
                if (orderStatus != 4)
                  OrderStepWidget(
                    title: "order_completed".translate,
                    subtitle: 'order_completed_message'.translate,
                    icon: Icons.check_circle_rounded,
                    isActive: orderStatus == 1,
                    isLast: true,
                  ),
                if (orderStatus == 4)
                   OrderStepWidget(
                    title: "order_cancelled".translate,
                    subtitle: 'order_cancelled_message'.translate,
                    icon: Icons.cancel,
                    color: Colors.red,
                    isActive: true,
                    isLast: true,
                  ),
              ],
            ),
            const SizedBox(height: 20),
            if (orderStatus == 1)
              ElevatedButton(
                onPressed: () {},
                child:  Text('order_completed'.translate),
              ),
          ],
        ),
      ),
    );
  }
}

class OrderStepWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color? color;
  final bool isActive;
  final bool? isLast;

  const OrderStepWidget({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.isActive,
    this.color,
    this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Icon(icon,
                size: 30,
                color: isActive ? color ?? Colors.green : Colors.grey),
            if (isLast != true)
              Container(
                width: 2,
                height: 60,
                color: isActive ? color ?? Colors.green : Colors.grey,
              ),
          ],
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: isActive ? color ?? Colors.green : Colors.grey,
                ),
              ),
              Text(
                subtitle,
                style: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }
}

// Map <int,List<String>> orderStatus = {
//   3: ['Order Placed',"We have received your order."],
//   2: ['Order Processed',"We are preparing your order."],
//   1: ['Order Completed',"Your order is completed."],
//   4: ['Order Cancelled',"Your order has been cancelled."],
// };
