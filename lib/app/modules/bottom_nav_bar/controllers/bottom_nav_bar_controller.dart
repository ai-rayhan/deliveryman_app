import 'package:deliveryman_app/app/modules/home/screens/home_screen.dart';
import 'package:deliveryman_app/app/modules/menu/bindings/menu_binding.dart';
import 'package:deliveryman_app/app/modules/menu/views/menu_screen.dart';
import 'package:deliveryman_app/app/modules/order/bindings/my_order_binding.dart';
import 'package:deliveryman_app/app/modules/order/screens/my_order_screen.dart';
import 'package:deliveryman_app/app/modules/order/screens/order_requests_screen.dart';
import 'package:deliveryman_app/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainBottomNavController extends GetxController {
  int _selectedIndex = 0;

  int get currentIndex => _selectedIndex;

  // void changeIndex(int index) {
  //   if (_selectedIndex == index) {
  //     return;
  //   }
  //   _selectedIndex = index;
  //   update();
  // }

 
  void backToHome() {
    changePage(0);
  }
  

 List<String> get pages{
      final pages = <String>[Routes.home,Routes.orderRequest, Routes.orders,Routes.menu];
      return pages;
  }
  
  void changePage(int index) {
    _selectedIndex = index;
    update();
    Get.offNamed(pages[index], id: 1);
  }

  Route? onGenerateRoute(RouteSettings settings) {
    if (settings.name == Routes.home) {
      return GetPageRoute(
        settings: settings,
        page: () => const DashboardScreen(),
        // binding: HomeBindings(),
      );
    }

    if (settings.name == Routes.orderRequest) {
      return GetPageRoute(
        settings: settings,
        page: () => const OrderRequestsScreen(),
        // binding:ShopBinding(),
      );
    }

    if (settings.name ==Routes.orders) {
      return GetPageRoute(
        settings: settings,
        page: () => const MyOrdersScreen(),
        binding: MyOrderBinding(),
      );
    }
    if (settings.name == Routes.menu) {
      return GetPageRoute(
        settings: settings,
        page: () => const MenuScreen(),
        binding: MenuBinding(),
      );
    }  

   //Guest Login

    // if (settings.name == Routes.goToLogin) {
    //   return GetPageRoute(
    //     settings: settings,
    //     page: () => const GotoLoginScreen(),
    //     binding:AuthBinding(),
    //   );
    // }

    // if (settings.name == RoutePath.guestProfile) {
    //   return GetPageRoute(
    //     settings: settings,
    //     page: () => GuestProfile(),
    //     // binding: SettingsBinding(),
    //   );
    // }

    return null;
  }
}
