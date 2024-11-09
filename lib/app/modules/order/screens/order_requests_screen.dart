import 'package:deliveryman_app/common/global_widgets/custom_card.dart';
import 'package:deliveryman_app/util/styles.dart';
import 'package:flutter/material.dart';


class OrderRequestsScreen extends StatelessWidget {
  const OrderRequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(title: const Text('Order Request')),
        body: ListView(
          padding: const EdgeInsets.all(8.0),
          children: [
            OrderCard(
              storeName: 'Family Supermarket',
              distance: '986.15 km away from you',
              deliveryAddress: '4B Kemal Ataturk Ave, Dhaka 1212, Bangladesh',
              price: 600.00,
              timeAgo: '554114 mins ago',
            ),
            OrderCard(
              storeName: 'Online Market',
              distance: '1000+ km away from you',
              deliveryAddress: 'Dhaka, Bangladesh',
              price: 610.00,
              timeAgo: '554114 mins ago',
            ),
            // Add more OrderCard widgets as needed
          ],
        ),
      );
  }
}

class OrderCard extends StatelessWidget {
  final String storeName;
  final String distance;
  final String deliveryAddress;
  final double price;
  final String timeAgo;

  OrderCard({super.key, 
    required this.storeName,
    required this.distance,
    required this.deliveryAddress,
    required this.price,
    required this.timeAgo,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/store_logo.png'), // Replace with a suitable image
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        storeName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const Text('1 Item'),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Text(
                      timeAgo,
                      style: TextStyle(
                        color: Theme.of(context).hintColor,
                        fontSize: 12,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 4),
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                      color: Theme.of(context).primaryColor.withOpacity(0.1),
                      child: Text(
                        distance,
                        style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Divider(),
            Text("Delivery Address:",style: robotoMedium.copyWith(fontSize: 14,color: Theme.of(context).primaryColor.withOpacity(0.7)),),
            const SizedBox(height: 4),
            Row(
              children: [
                CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.blue.withOpacity(.3),
                  child: const Icon(Icons.person, color: Colors.blue,size: 16,),
                ),
                const SizedBox(width: 10),
                // Expanded(
                //   flex: 1,
                //   child: Text(
                //     'Deliver to',
                //     style: robotoMedium,
                //   ),
                // ),
                Expanded(
                  flex: 2,
                  child: Text(
                    deliveryAddress,
                    style: TextStyle(fontSize: 14, color:Theme.of(context).hintColor),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                SizedBox(
                  height: 30,
                  child: FilledButton.icon(
                    onPressed: () {
                      // Implement map view logic
                    },
                    icon: const Icon(Icons.location_on_sharp,size: 16,),
                    label: Text('On Map',style: robotoRegular.copyWith(fontSize: 12),),
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.blue.withOpacity(.2),
                      foregroundColor: Colors.blue,
                      // shape: RoundedRectangleBorder(
                      //   borderRadius: BorderRadius.circular(8),
                      // )
                     
                    ),
                  ),
                ),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '\$${price.toStringAsFixed(2)}',
                      style: robotoBold.copyWith(fontSize: 16),
                    ),
                    Container(
                       margin: const EdgeInsets.only(top: 8),
                       padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                       color: Theme.of(context).primaryColor.withOpacity(.1),
                       child: Text(
                         'Payment - Digitally Paid',
                         style: robotoMedium.copyWith(color: Theme.of(context).primaryColor, fontSize: 12),
                       ),
                      ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 35,
                      child: OutlinedButton(
                        onPressed: () {
                          // Implement ignore logic
                        },
                        style: ElevatedButton.styleFrom(
                        ),
                        child: Text('Ignore',style: robotoBold.copyWith(color: Colors.red),),
                      ),
                    ),
                    const SizedBox(width: 8),
                    SizedBox(
                      height: 37,
                      child: ElevatedButton(
                        onPressed: () {
                          // Implement accept logic
                        },
                        style: ElevatedButton.styleFrom(
                        ),
                        child: Text('Accept',style: robotoBold,),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // Align(
            //   alignment: Alignment.bottomLeft,
            //   child: Container(
            //     margin: EdgeInsets.only(top: 8),
            //     padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
            //     color: Theme.of(context).primaryColor.shade50,
            //     child: Text(
            //       'Payment - Digitally Paid',
            //       style: robotoMedium.copyWith(color: Theme.of(context).primaryColor, fontSize: 12),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
