import 'package:deliveryman_app/app/modules/order/screens/running_order.dart';
import 'package:deliveryman_app/helper/translated_text.dart';
import 'package:flutter/material.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Text(
            'my_orders'.translate,
          ),
          bottom: TabBar(
            indicatorColor: Colors.green,
            tabs: [
              Tab(text: 'running'.translate),
              Tab(text: 'history'.translate),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            RunningOrdersScreen(type: 'running'),
            RunningOrdersScreen(type: 'history'),
          ],
        ),
      ),
    );
  }
}
