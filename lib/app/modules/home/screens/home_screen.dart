import 'package:deliveryman_app/app/modules/home/widgets/active_order_card.dart';
import 'package:deliveryman_app/app/modules/home/widgets/earning_card.dart';
import 'package:deliveryman_app/app/modules/home/widgets/order_section.dart';
import 'package:deliveryman_app/common/global_widgets/section_header.dart';
import 'package:deliveryman_app/util/styles.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('6amMart Delivery'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
          Switch(value: true, onChanged: (value) {}), // Online/Offline Toggle
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EarningsSection(),
            const SizedBox(height: 16),
            const SectionHeader(name: "Orders"),
            const OrdersSection(),
            const SizedBox(height: 16),
            SectionHeader(name: "Active Orders",leading: Text("View All",style: robotoMedium.copyWith(color: Theme.of(context).primaryColor),),leadingOntap: (){},),
            ActiveOrderCard(),
          ],
        ),
      ),
    );
  }
}
