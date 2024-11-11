import 'package:deliveryman_app/app/modules/bottom_nav_bar/controllers/bottom_nav_bar_controller.dart';
import 'package:deliveryman_app/app/routes/app_routes.dart';
import 'package:deliveryman_app/helper/translated_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_navigation_bar/responsive_navigation_bar.dart';

class BaseBottomNavScreen extends StatefulWidget {
  const BaseBottomNavScreen({super.key});

  @override
  State<BaseBottomNavScreen> createState() => _BaseBottomNavScreenState();
}

class _BaseBottomNavScreenState extends State<BaseBottomNavScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async{


    });
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
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ResponsiveNavigationBar(
            backgroundColor:Theme.of(context).primaryColor,
            selectedIndex: controller.currentIndex,
            onTabChange: (index){
              controller.changePage(index);
            },
            textStyle: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
            fontSize: 18,
            navigationBarButtons:  <NavigationBarButton>[
              NavigationBarButton(
                text: "home".translate,
                icon: Icons.home,
                backgroundColor:Theme.of(context).primaryColor,
             
              ),
              NavigationBarButton(
                text: "proposals".translate,
                icon: Icons.pending_actions_rounded,
                backgroundColor:Theme.of(context).primaryColor ,
              ),
              NavigationBarButton(
                text: "orders".translate,
                icon: Icons.receipt,
                backgroundColor:Theme.of(context).primaryColor ,
              ),
              NavigationBarButton(
                text: "menu".translate,
                icon: Icons.menu,
                backgroundColor:Theme.of(context).primaryColor ,
              ),
            ],
           
          ),
        ),
      );
    });
  }
}
      