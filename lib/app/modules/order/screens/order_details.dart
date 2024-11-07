import 'package:deliveryman_app/app/modules/order/controllers/order_controller.dart';
import 'package:deliveryman_app/app/modules/order/domain/entities/order.dart';
import 'package:deliveryman_app/app/modules/order/util.dart';
import 'package:deliveryman_app/app/modules/order/widgets/order_item.dart';
import 'package:deliveryman_app/app/routes/app_routes.dart';
import 'package:deliveryman_app/common/global_widgets/appbar.dart';
import 'package:deliveryman_app/common/global_widgets/dialogs/base_dialog.dart';
import 'package:deliveryman_app/helper/date_converter.dart';
import 'package:deliveryman_app/helper/get_currency.dart';
import 'package:deliveryman_app/helper/translated_text.dart';
import 'package:deliveryman_app/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({super.key});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  late final Order order;

  @override
  void initState() {
    super.initState();
    order = Get.arguments as Order;
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) async{
    //  await Get.find<OrderController>().getOrderDetails(orderId: order.id);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar(
        context: context,
        text: "order_details".translate,
      ),
      body: SingleChildScrollView(
        child: GetBuilder<OrderController>(
          builder: (controller) {
            if (controller.inProgress) {
              return const Center(child: CircularProgressIndicator());
            } else if (controller.errorMessage != null && controller.errorMessage!.isNotEmpty) {
              return Center(child: Text(controller.errorMessage!));
            }
            // order=controller.ordersDetailsResponse.data.order;
            return Column(
              children: [
                _buildGeneralInfoSection(order),
                _buildItemInfoSection(order),
                _buildDeliveryDetailsSection(order),
                // _buildStoreDetailsSection(),
                _buildPaymentMethodSection(order),
                _buildOrderSummarySection(order),
                _buildActionButtons(order.id),
              ],
            );
          }
        ),
      ),
    );
  }

  Widget _buildGeneralInfoSection(Order order) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "general_info".translate,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildInfoRow("order_id".translate, "#${order.id}"),
            const Divider(),
            _buildInfoRow(
              "order_date".translate,
              DateConverter.readableDateAndTime(order.createdAt),
            ),
            // const Divider(),
            // _buildInfoRow(
            //   "delivery_label".tr,
            // "order.deliveryType",
            // ),
            const Divider(),
            _buildInfoRow(
              "item_count".translate,
              "${order.details.length} ${"items".translate}",
            ),
          ],
        ),
      ),
    );
  }

  // // Other helper methods for building UI sections (same as before)

  Widget _buildOrderSummarySection(Order order) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "order_summary".translate,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 19),
          _buildInfoRow("item_price".translate, " ${order.subTotal.toCurrency()}"),
          const SizedBox(height: 10),
          _buildInfoRow("discount".tr, "(-) ${order.discount.toCurrency()}"),
          const SizedBox(height: 10),
          // _buildInfoRow("additional_charge_label".tr, "(+) ${order.tax?.toCurrency()?? 0.0.toCurrency()}"),
          // const SizedBox(height: 10),
          // _buildInfoRow("vat_tax_label".tr, "(+) ${order.tax?.toCurrency()?? 0.0.toCurrency()}"), 
          // const SizedBox(height: 10),
          _buildInfoRow("delivery_fee".tr, "(+) ${(order.grandTotal + order.discount)-order.subTotal}"),
          const Divider(color: Colors.grey, thickness: 1),
          _buildInfoRow(
            "total_amount".tr,
            "${order.grandTotal.toCurrency()} ",
          ),
        ],
      ),
    );
  }

  // Widget _buildGeneralInfoSection(Order order) {
  //   return Padding(
  //     padding: const EdgeInsets.all(8.0),
  //     child: Container(
  //       child: Padding(
  //         padding: const EdgeInsets.all(8.0),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Text(
  //               "general_info_title".tr,
  //               style: TextStyle(fontWeight: FontWeight.bold),
  //             ),
  //             const SizedBox(height: 10),
  //             _buildInfoRow("order_id_label".tr, "#${order.id}"),
  //             Divider(),
  //             _buildInfoRow(
  //               "order_date_label".tr,
  //               DateConverter.readableDateAndTime(order.createdAt),
  //             ),
  //             Divider(),
  //             _buildInfoRow(
  //               "delivery_label".tr,
  //               paymentMethodName(order.paymentStatus),
  //             ),
  //             Divider(),
  //             _buildInfoRow(
  //               "item_count_label".tr,
  //               getStatusName(order.orderStatus),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        Text(
          value,
          style: robotoRegular
        ),
      ],
    );
  }

  Widget _buildItemInfoSection(Order order) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          Text("item_info".translate,style: robotoMedium,),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: order.details.length,
            separatorBuilder: (context, index) => const Divider(height: 1,),
            itemBuilder: (context, index) {
              final orderDetail = order.details[index];
              return OrderItem(orderDetail: orderDetail);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDeliveryDetailsSection(Order order) {
    return _buildDetailSection("delivery_details".translate, [
      // _buildListTile(
      //   icon: Icons.store,
      //   title: "from_store_label".tr,
      //   subtitle: "House: 00, Road: 00,City-000",
      // ),
      _buildListTile(
        icon: Icons.location_history_sharp,
        title: "${"receiver_name".translate}:${order.user?.billingFirstname??"" } ${order.user?.billingLastname??""}",
        subtitle: "${"phone".translate}: ${order.user?.billingMobile??""} ${"address".translate}: ${order.user?.billingAddress??""}",
      ),
    ]);
  }


  Widget _buildPaymentMethodSection(Order order) {
    return _buildDetailSection("payment_method".tr, [
      ListTile(
        leading:  Icon(Icons.payment_rounded,size: 20,color: Theme.of(context).primaryColor,),
        title:Text(paymentMethodName(order.paymentMethodId)),
       
      ),
    ]);
  }

  // Widget _buildOrderSummarySection() {
  //   return Padding(
  //     padding: const EdgeInsets.all(8.0),
  //     child: Container(
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Text(
  //             "order_summary_title".tr,
  //             style: TextStyle(fontWeight: FontWeight.bold),
  //           ),
  //           const SizedBox(height: 19),
  //           _buildInfoRow("item_price_label".tr, "\$ 400"),
  //           const SizedBox(height: 10),
  //           _buildInfoRow("discount_label".tr, "(-) \$ 400"),
  //           const SizedBox(height: 10),
  //           _buildInfoRow("additional_charge_label".tr, "(+) \$ 400"),
  //           const SizedBox(height: 10),
  //           _buildInfoRow("vat_tax_label".tr, "(+) \$ 400"),
  //           const SizedBox(height: 10),
  //           _buildInfoRow("delivery_fee_label".tr, "(+) \$ 400"),
  //           Divider(color: Colors.grey, thickness: 1),
  //           _buildInfoRow(
  //             "total_amount_label".tr,
  //             "\$ 800",
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget _buildActionButtons(int orderId) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 58, 154, 61),
            ),
            onPressed: () {
            Get.toNamed(Routes.orderTracking,arguments: order.orderStatus);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 14),
              child: Text("track_order".translate),
            ),
          ),
          GetBuilder<OrderController>(
            builder: (controller) {
              if (controller.inProgress) {
                return const Center(child: CircularProgressIndicator());
              }
              return OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                    color: Color.fromARGB(255, 128, 205, 130),
                    width: 2,
                  ),
                ),
                onPressed: () {
                  showCustomDialog(context: context, title: "cancel_order".translate, content: Text("cancel_order_message".translate), onSubmitPressed: () {
                      controller.cancelOrder(orderId: orderId,);
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                  child: Text(
                    "cancel_order".translate,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ),
              );
            }
          ),
        ],
      ),
    );
  }

  Widget _buildDetailSection(String title, List<Widget> children) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          ...children,
        ],
      ),
    );
  }

 Widget _buildListTile({
  required IconData icon,
  required String title,
  required String subtitle,
  String? image,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
    child: Row(
      children: [
       image != null? CircleAvatar(
          backgroundColor: Colors.white70,
          child: Image.asset(image)
              
        ): Icon(icon, size: 30, color: Colors.green),
        const SizedBox(width: 10), 
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(subtitle),
            ],
          ),
        ),
      ],
    ),
  );
}


}


// class OrderDetailsScreen extends StatefulWidget {
//   const OrderDetailsScreen({super.key});

//   @override
//   State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
// }

// class _OrderDetailsScreenState extends State<OrderDetailsScreen> {

//   String? selectedOption;

//   @override
//   Widget build(BuildContext context) {
//     final Order order = Get.arguments as Order;
//     return Scaffold(
//       appBar: showAppBar(
//         context: context,
//         text: "order_details_title".tr,
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   // Center(
//                   //   child: SizedBox(
//                   //     height: 150,
//                   //     child: Lottie.asset(
//                   //       'assets/lottie/delivered.json',
//                   //     ),
//                   //   ),
//                   // ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
             
//                       child: Padding(
//                         padding: EdgeInsets.all(8.0),
//                         child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 "general_info_title".tr,
//                                 style: TextStyle(fontWeight: FontWeight.bold),
//                               ),
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text("order_id_label".tr),
//                                   Text(
//                                     "#${order.id}",
//                                     style:robotoBold.copyWith(fontSize: 14),
//                                   )
//                                 ],
//                               ),
//                               Divider(),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text("order_date_label".tr),
//                                   Text(DateConverter.readableDateAndTime(order.createdAt),
//                                     style:robotoMedium.copyWith(fontSize: 13),
//                                   )
//                                 ],
//                               ),
//                               Divider(),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text("delivery_label".tr),
//                                   Text(paymentMethodName(order.paymentStatus),
//                                     style: robotoMedium.copyWith(fontSize: 13,color: Theme.of(context).primaryColor),
//                                   )
//                                 ],
//                               ),
//                               Divider(),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text("item_count_label".tr),
//                                   Text(getStatusName(order.orderStatus),
//                                     style:
//                                         TextStyle(fontWeight: FontWeight.w500),
//                                   )
//                                 ],
//                               ),
//                             ]),
//                       ),
//                     ),
//                   ),
//                   Container(
                
//                     child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           SizedBox(
//                             height: 8,
//                           ),
//                           Padding(
//                             padding:
//                                 const EdgeInsets.symmetric(horizontal: 16.0),
//                             child: Text("item_info_title".tr),
//                           ),
//                           Container(
//                             constraints: BoxConstraints(maxHeight: 300),
//                             child: ListView.builder(
//                               shrinkWrap: true,
//                               physics: NeverScrollableScrollPhysics(),
//                               itemCount: order.details.length,
//                               itemBuilder: (context, index) {
//                                 final orderDetail = order.details[index];
//                                 return Padding(
//                                   padding: const EdgeInsets.symmetric(
//                                       horizontal: 16.0),
//                                   child: OrderItem(orderDetail: orderDetail),
//                                 );
//                               },
//                             ),
//                           )
                        
//                         ]),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Container(
              
//                     child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(top: 16.0, left: 16),
//                             child: Text(
//                               "delivery_details_title".tr,
//                               style: TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                           ListTile(
//                             leading: CircleAvatar(
                          
//                               child: Icon(
//                                 Icons.store,
//                                 size: 40,
//                                 color: Colors.green,
//                               ),
//                             ),
//                             title: Text(
//                               "from_store_label".tr,
//                               style: TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                             subtitle: Text("House: 00, Road: 00,City-000"),
//                           ),
//                           ListTile(
//                             leading: CircleAvatar(
                          
//                               child: Icon(
//                                 Icons.location_on,
//                                 size: 40,
//                                 color: Colors.green,
//                               ),
//                             ),
//                             title: Text(
//                               "to_label".tr,
//                               style: TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                             subtitle: Text("House: 00, Road: 00,City-000"),
//                           ),
//                         ]),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Container(
      
//                     child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(top: 16.0, left: 16),
//                             child: Text(
//                               "store_details_title".tr,
//                               style: TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                           ListTile(
//                             leading: CircleAvatar(
//                               backgroundColor: Colors.white70,
//                               child: Image.asset("assets/intro2.png"),
//                             ),
//                             title: Text(
//                               "Fresh Local",
//                               style: TextStyle(fontWeight: FontWeight.w500),
//                             ),
//                             subtitle: Text("House: 00, Road: 00,City-000"),
//                           ),
//                         ]),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Container(
            
//                     child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(top: 16.0, left: 16),
//                             child: Text(
//                               "payment_method_title".tr,
//                               style: TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                           ListTile(
//                             leading: CircleAvatar(
//                               backgroundColor: Colors.white70,
//                               child: Icon(
//                                Icons.payment_rounded,
//                                 color: Color.fromARGB(255, 66, 66, 66),
//                                 size: 18,
//                               ),
//                             ),
//                             title: Text(
//                               "cash_label".tr,
//                               style: TextStyle(
//                                   fontWeight: FontWeight.w400,
//                                   fontSize: 14,
//                                   color: Colors.grey[600]),
//                             ),
//                           ),
//                         ]),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
         
//                       child: Padding(
//                         padding: EdgeInsets.all(8.0),
//                         child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 "order_summary_title".tr,
//                                 style: TextStyle(fontWeight: FontWeight.bold),
//                               ),
//                               SizedBox(
//                                 height: 19,
//                               ),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text("item_price_label".tr),
//                                   Text(
//                                     "\$ 400",
//                                   )
//                                 ],
//                               ),
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text("discount_label".tr),
//                                   Text(
//                                     "(-) \$ 400 ",
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.normal),
//                                   )
//                                 ],
//                               ),
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text("additional_charge_label".tr),
//                                   Text(
//                                     "(+) \$ 400 ",
//                                   )
//                                 ],
//                               ),
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text("vat_tax_label".tr),
//                                   Text(
//                                     "(+) \$ 400 ",
//                                   )
//                                 ],
//                               ),
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text("delivery_fee_label".tr),
//                                   Text(
//                                     "(+) \$ 400 ",
//                                   )
//                                 ],
//                               ),
//                               Divider(
//                                 color: Colors.grey,
//                                 thickness: 1,
//                               ),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(
//                                     "total_amount_label".tr,
//                                     style: TextStyle(
//                                         color: Color.fromARGB(255, 40, 156, 44),
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 17),
//                                   ),
//                                   Text(
//                                     "\$ 800",
//                                     style: TextStyle(
//                                         color: Color.fromARGB(255, 40, 156, 44),
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 17),
//                                   ),
//                                 ],
//                               ),
//                             ]),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Container(

//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                       backgroundColor: Color.fromARGB(255, 58, 154, 61)),
//                   onPressed: () {
//                     // Navigate.to(
//                     //     screen: OrderTrackingScreen(), context: context);
//                   },
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 20.0, vertical: 14),
//                     child: Text("track_order_button".tr),
//                   ),
//                 ),
//                 OutlinedButton(
//                     style: OutlinedButton.styleFrom(
//                         side: BorderSide(
//                             color: Color.fromARGB(255, 128, 205, 130),
//                             width: 2)),
//                     onPressed: () {
//                       showDialog(
//                         context: context,
//                         builder: (context) => AlertDialog(
//                           title: Text("select_cancellation_reason_title".tr),
//                           content: Column(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               Row(
//                                 children: [
//                                   Radio(
//                                     value: 'order_delivered_time_reason'.tr,
//                                     groupValue: selectedOption,
//                                     onChanged: (value) {
//                                       setState(() {
//                                         selectedOption = value;
//                                       });
//                                     },
//                                   ),
//                                   Text('order_delivered_time_reason'.tr),
//                                 ],
//                               ),
//                               Row(
//                                 children: [
//                                   Radio(
//                                     value: 'ordered_wrong_food_reason'.tr,
//                                     groupValue: selectedOption,
//                                     onChanged: (value) {
//                                       setState(() {
//                                         selectedOption = value;
//                                       });
//                                     },
//                                   ),
//                                   Text('ordered_wrong_food_reason'.tr),
//                                 ],
//                               ),
//                             ],
//                           ),
//                           actions: [
//                             TextButton(
//                               onPressed: () {},
//                               child: Text(
//                                 "submit_button".tr,
//                                 style: TextStyle(color: Colors.grey),
//                               ),
//                             ),
//                             TextButton(
//                               onPressed: () {},
//                               child: Text(
//                                 "cancel_button".tr,
//                                 style: TextStyle(color: Colors.green),
//                               ),
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 20.0, vertical: 14),
//                       child: Text(
//                         "cancel_order_button".tr,
//                         style: TextStyle(color: Colors.grey),
//                       ),
//                     )),
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 5,
//           )
//         ],
//       ),
//     );
//   }
// }
