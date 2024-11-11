import 'package:deliveryman_app/app/modules/home/widgets/active_order_card.dart';
import 'package:deliveryman_app/app/modules/home/widgets/earning_card.dart';
import 'package:deliveryman_app/app/modules/home/widgets/order_section.dart';
import 'package:deliveryman_app/common/global_widgets/section_header.dart';
import 'package:deliveryman_app/util/appconstants.dart';
import 'package:deliveryman_app/util/styles.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(AppConstants.appName,style: robotoBold.copyWith(fontSize: 20),),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
               Text("Online",style: robotoBold),
               const SizedBox(width: 10,),
               Switch(
                value: true, onChanged: (value) {}
                ),
            ],
          ),
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
