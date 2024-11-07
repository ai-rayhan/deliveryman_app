import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:deliveryman_app/app/modules/bottom_nav_bar/controllers/bottom_nav_bar_controller.dart';
import 'package:deliveryman_app/app/routes/app_routes.dart';
import 'package:deliveryman_app/helper/translated_text.dart';
import 'package:deliveryman_app/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BaseBottomNavScreen extends StatefulWidget {
  const BaseBottomNavScreen({super.key});

  @override
  State<BaseBottomNavScreen> createState() => _BaseBottomNavScreenState();
}

class _BaseBottomNavScreenState extends State<BaseBottomNavScreen> {
  static const List<IconData> deActiveIconList = [
    Icons.home_outlined,
    Icons.shopping_bag_outlined,
    Icons.receipt_outlined,
    Icons.menu_outlined
  ];
    static const List<IconData>activeIconList = [
    Icons.home,
    Icons.shopping_bag,
    Icons.receipt,
    Icons.menu
  ];
  static const labels = ["home", "shop", "orders", "menu"];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async{


    });
  }
load()async{


}
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainBottomNavController>(builder: (controller) {
      return Scaffold(
        body: PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) {
            if(controller.currentIndex==0){
              SystemNavigator.pop();
              didPop = true;
            }else{
            controller.backToHome();
            }
          },
          child: Navigator(
            key: Get.nestedKey(1),
            initialRoute: Routes.home,
            onGenerateRoute: controller.onGenerateRoute,
          ),
        ),
        bottomNavigationBar: AnimatedBottomNavigationBar.builder(
          activeIndex: controller.currentIndex,
          backgroundColor: Theme.of(context).cardColor,
          onTap: (index) => controller.changePage(index),
          itemCount: deActiveIconList.length,
          tabBuilder: (int index, bool isActive) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 7.0),
              child: Column(
                children: [
                  Icon(
                   isActive? activeIconList[index]:deActiveIconList[index],
                    size: 24,
                    color: isActive
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).hintColor,
                  ),
                  Text(
                    labels[index].translate,
                    style: TextStyle(
                      fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                      color: isActive
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).hintColor,
                      fontSize: 12,
                    ),
                  )
                ],
              ),
            );
          },
        ),
      );
    });
  }
}
      