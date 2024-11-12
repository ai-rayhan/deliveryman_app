
import 'package:deliveryman_app/app/modules/order/controllers/order_controller.dart';
import 'package:deliveryman_app/app/routes/app_routes.dart';
import 'package:deliveryman_app/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActiveOrderCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Order ID: #100021', style: robotoBold),
                Text('COD', style: robotoMedium),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.store, color:Theme.of(context).hintColor),
                SizedBox(width: 8),
                Text('Store Location'),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Icon(Icons.arrow_downward_sharp,color: Theme.of(context).hintColor,size: 15,),
            ),
            
            Row(
              children: [
                Icon(Icons.location_on, color: Colors.grey),
                SizedBox(width: 8),
                Text('House: 00, Road: 00, City-000, Country', style: TextStyle(color: Colors.grey)),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Get.toNamed(Routes.orderDetails,arguments: Get.find<OrderController>().orderResponse!.data[0]);
                    },
                    child: Text('Details'),
                   
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Get.toNamed(Routes.location);
                    },
                    icon: Icon(Icons.directions),
                    label: Text('Direction'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
