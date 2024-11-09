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
            } 
            // else if (controller.errorMessage != null && controller.errorMessage!.isNotEmpty) {
            //   return Center(child: Text(controller.errorMessage!));
            // }
            // order=controller.ordersDetailsResponse.data.order;
            return Column(
              children: [
                _buildGeneralInfoSection(order),
                _buildItemInfoSection(order),
                _buildDeliveryDetailsSection(order),
                // _buildStoreDetailsSection(),
                _buildPaymentMethodSection(order),
                _buildOrderSummarySection(order),
                // _buildActionButtons(order.id),
              (order.orderStatus==1)? _buildStatusUpdateSection(order): Container()
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
   Widget _buildStatusUpdateSection(Order order) {
    return Column(
      children: [
      ListTile(
        leading:  Icon(Icons.manage_history_rounded,size: 20,color: Theme.of(context).primaryColor,),
        title:Text("Where are you now?".translate),
        subtitle: ColoredBox(
          color: Colors.lightBlue.shade50,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("This Order status is ${getStatusName(order.orderStatus)}.If you want to change status, please click on the button below.".translate),
          )),
      ),
      SizedBox(
        width:  double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: ElevatedButton(onPressed: (){}, child: Text("Update Status".translate)),
        ))
      ]
    );
}


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