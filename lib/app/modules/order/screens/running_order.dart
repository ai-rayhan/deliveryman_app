import 'package:deliveryman_app/app/data/urls.dart';
import 'package:deliveryman_app/app/modules/order/controllers/order_controller.dart';
import 'package:deliveryman_app/app/modules/order/util.dart';
import 'package:deliveryman_app/app/modules/order/widgets/collage_avatar.dart';
import 'package:deliveryman_app/app/routes/app_routes.dart';
import 'package:deliveryman_app/common/global_widgets/empty_data_widget.dart';
import 'package:deliveryman_app/helper/date_converter.dart';
import 'package:deliveryman_app/helper/translated_text.dart';
import 'package:deliveryman_app/util/asset_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RunningOrdersScreen extends StatefulWidget {
  const RunningOrdersScreen({super.key, required this.type});
  final  String type ;
  @override
  State<RunningOrdersScreen> createState() => _RunningOrdersScreenState();
}

class _RunningOrdersScreenState extends State<RunningOrdersScreen> {
  ScrollController scrollController = ScrollController(); 
  

  Color _getStatusColor(int status) {
    switch (status) {
      case 1:
        return Colors.green; 
      case 2:
        return Colors.blue; 
      case 3:
        return Colors.amber;
      case 4:
        return Colors.red; 
      default:
        return Colors.grey; 
    }
  }

  @override
  void initState() {
    super.initState();
    Get.lazyPut(() => OrderController());
    WidgetsBinding.instance.addPostFrameCallback((_) async{
      final controller = Get.find<OrderController>();
      controller.clearProducts();
      await controller.getOrders(url: widget.type=='running'?Urls.runningOrders:Urls.orderHistory,refresh: true);
        scrollController.addListener(() {
        if (scrollController.position.pixels == scrollController.position.maxScrollExtent && !controller.inProgress) {
        controller.getOrders(url: widget.type=='running'?Urls.runningOrders:Urls.orderHistory);
        }
      });
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GetBuilder<OrderController>(
        builder: (controller) {
          if (controller.inProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
      
          if (controller.products.isEmpty) {
            return EmptyDataWidget(
              msg: 'no_order_found'.translate,
              image: AssetPath.termsIcon,
            );
          }
          return ListView.builder(
            controller: scrollController,
            itemCount: controller.products.length,
            itemBuilder: (context, index) {
              final order = controller.products[index];
          
              return GestureDetector(
                onTap: () {
                 Get.toNamed(Routes.orderDetails,arguments: order);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CollageAvatar(images:order.details.map((e) => e.productImage??'').toList()),
                    title: Text('${'order_id'.translate}: ${order.id}'),
                    subtitle: Text(DateConverter.dateToReadableDate(order.createdAt)),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 3),
                          decoration: BoxDecoration(
                            color: _getStatusColor(order.orderStatus),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Text(
                            getStatusName(order.orderStatus),
                            style: const TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                        const SizedBox(height: 8),
                        GestureDetector(
                          onTap: () {
                           Get.toNamed(Routes.orderTracking,arguments: order.orderStatus);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.green),
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 2),
                              child:  Text(
                               'track_order'.translate,
                                style: TextStyle(
                                    color: Colors.green, fontSize: 12),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }
      ),
    );
  }
}
String getFullImageUrl(String? imagePath) {
  if (imagePath == null) {
    return '';
  } else {
    return "${Urls.baseimageUrl}/$imagePath";
  }
}