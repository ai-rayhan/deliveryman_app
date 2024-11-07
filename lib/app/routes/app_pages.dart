import 'package:deliveryman_app/app/modules/auth/screens/forget_password_screen.dart';
import 'package:deliveryman_app/app/modules/auth/screens/otp_verification_screen.dart';
import 'package:deliveryman_app/app/modules/auth/screens/reset_password_screen.dart';
import 'package:deliveryman_app/app/modules/auth/screens/verify_phone_screen.dart';
import 'package:deliveryman_app/app/modules/currency/views/currency_screen.dart';
import 'package:deliveryman_app/app/modules/home/screens/home_screen.dart';
import 'package:deliveryman_app/app/modules/order/screens/order_details.dart';
import 'package:deliveryman_app/app/modules/order/screens/order_requests_screen.dart';
import 'package:deliveryman_app/app/modules/order/screens/order_tracking_screen.dart';
import 'package:deliveryman_app/app/modules/profile/bindings/profile_binding.dart';
import 'package:deliveryman_app/app/modules/profile/screens/edit_profile.dart';
import 'package:deliveryman_app/app/modules/profile/screens/profile_screen.dart';
import 'package:deliveryman_app/app/modules/support/bindings/support_binding.dart';
import 'package:deliveryman_app/app/modules/support/screens/help_and_support_screen.dart';
import 'package:deliveryman_app/app/modules/support/screens/policy_webview.dart';
import 'package:get/get.dart';

import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/screens/signin_screen.dart';
import '../modules/bottom_nav_bar/bindings/bottom_nav_bar_binding.dart';
import '../modules/bottom_nav_bar/screens/bottom_nav_bar.dart';
import '../modules/language/views/select_language_screen.dart';
import '../modules/location/bindings/location_binding.dart';
import '../modules/location/screens/select_current_location.dart';
import '../modules/menu/bindings/menu_binding.dart';
import '../modules/menu/views/menu_screen.dart';
import '../modules/order/bindings/my_order_binding.dart';
import '../modules/order/screens/my_order_screen.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/screens/splash_screen.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    // Getting Started
    GetPage(
      name: Routes.splash,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.language,
      page: () => const SelectLanguageScreen(
      ),
    ),
   // Auth
    GetPage(
      name: Routes.signIn,
      page: () => const SignInScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.verifyOtp,
      page: () => const VerifyOTPScreen(),
      // binding: ver(),
    ),
    GetPage(
      name: Routes.verifyPhone,
      page: () => const VerifyPhoneScreen(),
    ),
    GetPage(
      name: Routes.forgetPassword,
      page: () => const ForgetPasswordScreen(),
      // binding: ver(),
    ),
    GetPage(
      name: Routes.resetPassword,
      page: () => const ResetPasswordScreen(),
      // binding: ver(),
    ),

    // Profile
    GetPage(
      name: Routes.profile,
      page: () => const ProfileScreen(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routes.editProfile,
      page: () => const EditProfileScreen(),
    ),

    // Bottom Navigation Bar
    GetPage(
      name: Routes.bottomNavigationBar,
      page: () => const BaseBottomNavScreen(),
      binding: BottomNavBarBinding(),
    ),
    GetPage(
      name: Routes.home,
      page: () => const DashboardScreen(),
      // binding: HomeBindings(),
    ),
    
    GetPage(
      name: Routes.home,
      page: () => const OrderRequestsScreen(),
    ),
    
    GetPage(
      name: Routes.orders,
      page: () => const MyOrdersScreen(),
      binding: MyOrderBinding(),
    ),
    GetPage(
      name: Routes.menu,
      page: () => const MenuScreen(),
      binding: MenuBinding(),
    ),

    GetPage(
      name: Routes.orderDetails,
      page: () => const OrderDetailsScreen(),
      binding: LocationBinding(),
    ),
    GetPage(
      name: Routes.orderTracking,
      page: () => const OrderTrackingScreen(),
    ),
    GetPage(
      name: Routes.location,
      page: () => const LocationScreen(),
      binding: LocationBinding(),
    ),

    //Menu
    GetPage(
      name: Routes.currency,
      page: () => const CurrencyScreen(),
    ),
  
    GetPage(
      name: Routes.helpAndSupport,
      page: () =>  const HelpAndSupportScreen(),
      binding: SupportBinding()
    ),
    GetPage(
      name: Routes.webview,
      page: () =>  const PolicyWebview(),
      binding: SupportBinding()
    )
   



  ];
}
