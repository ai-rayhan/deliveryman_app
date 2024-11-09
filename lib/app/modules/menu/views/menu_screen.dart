import 'package:deliveryman_app/app/modules/auth/controllers/auth_controller.dart';
import 'package:deliveryman_app/app/modules/menu/widgets/menu_item.dart';
import 'package:deliveryman_app/app/routes/app_routes.dart';
import 'package:deliveryman_app/common/global_widgets/custom_card.dart';
import 'package:deliveryman_app/common/global_widgets/dialogs/signout_dialog.dart';
import 'package:deliveryman_app/common/global_widgets/section_header.dart';
import 'package:deliveryman_app/helper/translated_text.dart';
import 'package:deliveryman_app/util/dimensions.dart';
import 'package:deliveryman_app/util/sizedbox_space.dart';
import 'package:deliveryman_app/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
           Icon(Icons.account_circle_rounded,size: 100,color: Theme.of(context).primaryColor,),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                child: Column(
                  children: [

                    // General section
                    SectionHeader(name: "general".translate),
                    SizedBoxSpace.h10,
                    CustomCard(
                      child: Padding(
                        padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                        child: Column(
                          children: [
                            MenuItem(
                              routeName: Routes.profile,
                              icon: Icons.person_outline,
                              name: "profile".translate,
                              showDivider: true,
                            ),
                            MenuItem(
                              routeName: Routes.addresses,
                              icon: Icons.location_city,
                              name: "my_address".translate,
                              showDivider: true,
                            ),
                            MenuItem(
                               routeName: Routes.wishlist,
                              icon: Icons.favorite_outlined,
                              name: "wish_list".translate,
                              showDivider: true,
                            ),
                            MenuItem(
                              routeName: Routes.language,
                              icon: Icons.translate,
                              name: "language".translate,
                              showDivider: true,
                              arguments: true,
                            ),
                            MenuItem(
                              routeName: Routes.currency,
                              icon: Icons.currency_exchange,
                              name: "currency".translate,
                              showDivider: false,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBoxSpace.h10,
                    
                    // Promotional activity section
                   SectionHeader(name: "promotional_activity".translate),
                    SizedBoxSpace.h10,
                    CustomCard(
                      child: Padding(
                        padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                        child: Column(
                          children: [
                            MenuItem(
                              routeName: Routes.coupon,
                              icon: Icons.confirmation_num_outlined,
                              name: "coupon".translate,
                              showDivider: false,
                            ),
                            // MenuItem(
                            //   routeName: Routes.loyalityPoint,
                            //   icon: Icons.monetization_on_outlined,
                            //   name: "loyalty_point".translate,
                            //   showDivider: false,
                            // ),
                          ],
                        ),
                      ),
                    ),
                    SizedBoxSpace.h10,

                  // Refer and earn section
                  // SectionHeader(name: "earnings".translate),
                  //   SizedBoxSpace.h10,
                  //   CustomCard(
                  //     child: Padding(
                  //       padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                  //       child: Column(
                  //         children: [
                  //           MenuItem(
                  //             routeName: Routes.referAndEarn,
                  //             icon: Icons.group_add_outlined,
                  //             name: "refer_and_earn_title".translate,
                  //             showDivider: true,
                  //           ),
                  //           MenuItem(
                  //             routeName: Routes.joinAsDeliveryMan,
                  //             icon: Icons.directions_bike_outlined,
                  //             name: "join_as_delivery_man".translate,
                  //             showDivider: false,
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  //   SizedBoxSpace.h10,

                  // Help and support section
                    SectionHeader(
                      name: "help_and_support".translate
                    ),
                    SizedBoxSpace.h10,
                    CustomCard(
                      child: Padding(
                        padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                        child: Column(
                          children: [
                            // MenuItem(
                            //   routeName: Routes.liveChat,
                            //   icon: Icons.chat_bubble_outline_rounded,
                            //   name: "live_chat".translate,
                            //   showDivider: true,
                            // ),
                            MenuItem(
                              routeName: Routes.helpAndSupport,
                              icon: Icons.support_agent_outlined,
                              name: "help_and_support".translate,
                              showDivider: true,
                            ),
                            // MenuItem(
                            //   routeName: Routes.webview,
                            //   icon: Icons.info_outline,
                            //   name: "about_us".translate,
                            //   arguments: "about_us",
                            //   showDivider: true,
                              
                            // ),
                            MenuItem(
                              routeName: Routes.webview,
                              arguments: "privacy_policy",
                              icon: Icons.notes,
                              name: "privacy_policy".translate,
                              showDivider: true,
                            ),
                            MenuItem(
                              routeName: Routes.webview,
                              arguments: "terms_and_conditions",
                              icon: Icons.assignment_rounded,
                              name: "terms_and_conditions".translate,
                              showDivider: false,
                            ),
                            // MenuItem(
                            //   routeName: Routes.webview,
                            //   arguments: "refund_policy",
                            //   icon: Icons.replay_circle_filled_outlined,
                            //   name: "refund_policy".translate,
                            //   showDivider: true,
                            // ),
                            // MenuItem(
                            //  routeName: Routes.webview,
                            //   arguments: "cancellation_policy",
                            //   icon: Icons.description_outlined,
                            //   name: "cancellation_policy".translate,
                            //   showDivider: true,
                            // ),
                            // MenuItem(
                            //   routeName: Routes.webview,
                            //   arguments: "shipping_policy",
                            //   icon: Icons.local_shipping_outlined,
                            //   name: "shipping_policy".translate,
                            //   showDivider: false,
                            // ),
                            SizedBoxSpace.h10,
                            InkWell(
                             onTap: (){
                                  if(AuthController.token==null){
                                    Get.offAllNamed(Routes.signIn);
                                    return;
                                  }
                                 showSignOutDialog(context: context, onChanged: (val){
                                   if(val==true){
                                     Get.find<AuthController>().signOutFromAllDevices();
                                   }else{
                                     Get.find<AuthController>().signOut();
                                   }
                                 });
                                },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.power_settings_new, color: Colors.red,),
                                  const SizedBox(width: Dimensions.paddingSizeSmall),
                                  Text(AuthController.token==null?"sign_in".translate:"logout".translate,style: robotoRegular),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBoxSpace.h20,
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
