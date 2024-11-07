import 'package:deliveryman_app/app/modules/profile/widgets/profile_card.dart';
import 'package:deliveryman_app/app/routes/app_routes.dart';
import 'package:deliveryman_app/common/controllers/theme_controller.dart';
import 'package:deliveryman_app/common/global_widgets/appbar.dart';
import 'package:deliveryman_app/common/global_widgets/custom_card.dart';
import 'package:deliveryman_app/helper/translated_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar(
        context: context,
        text: "profile".translate,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          
          const ProfileCard(),
          const SizedBox(
            height: 6,
          ),
          // CustomCard(
          //   child: ListTile(
          //     leading: const Icon(Icons.notifications),
          //     title: Text("notification".translate),
          //     trailing: CupertinoSwitch(
          //       value: true,
          //       onChanged: (bool value) {
                  
          //       },
          //     ),
          //   ),
          // ),
          GetBuilder<ThemeController>(
            builder: (controller) {
              return CustomCard(
                child: ListTile(
                  leading: const Icon(Icons.sunny),
                  title: Text("dark_theme".translate),
                  trailing: CupertinoSwitch(
                    value: controller.isDarkMode,
                    onChanged: (bool value) {
                    controller.toggleTheme();
                    },
                  ),
                ),
              );
            }
          ),
          CustomCard(
            child: ListTile(
              leading: const Icon(Icons.lock),
              title: Text("change_password".translate),
              onTap: () => Get.toNamed(Routes.forgetPassword),
            ),
          ),
          // CustomCard(
          //   child: ListTile(
          //     leading: const Icon(
          //       Icons.person_off,
          //       color: Colors.red,
          //     ),
          //     title: Text("delete_account".translate),
          //   ),
          // ),
        ],
      ),
    );
  }
}
