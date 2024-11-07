import 'package:deliveryman_app/app/modules/support/controllers/support_controller.dart';
import 'package:deliveryman_app/common/global_widgets/appbar.dart';
import 'package:deliveryman_app/common/global_widgets/custom_asset_image.dart';
import 'package:deliveryman_app/helper/translated_text.dart';
import 'package:deliveryman_app/util/asset_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HelpAndSupportScreen extends StatefulWidget {
  const HelpAndSupportScreen({super.key});

  @override
  State<HelpAndSupportScreen> createState() => _HelpAndSupportScreenState();
}

class _HelpAndSupportScreenState extends State<HelpAndSupportScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final controller = Get.find<SupportController>();
      controller.getHelpAndSupportInfo();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar(
        context: context,
        text: "help_and_support".translate,
      ),
      body: SingleChildScrollView(
        child: GetBuilder<SupportController>(
          builder: (controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 25),
                const Center(
                  child: SizedBox(
                    width: 100,
                    child: CustomAssetImageWidget(AssetPath.support),
                  ),
                ),
                const SizedBox(height: 20),
                _buildInfoCard(
                  icon: Icons.location_on,
                  iconColor: Colors.blue,
                  backgroundColor: const Color.fromARGB(255, 189, 225, 255),
                  title: "address".translate,
                  subtitle: controller.helpAndSupportResponse?.customer.address ?? '',
                  titleColor: Colors.blue,
                ),
                _buildInfoCard(
                  icon: Icons.call,
                  iconColor: Colors.red,
                  backgroundColor: const Color.fromARGB(255, 255, 203, 199),
                  title: "call".translate,
                  subtitle: controller.helpAndSupportResponse?.customer.mobile ?? '',
                  titleColor: Colors.red,
                ),
                _buildInfoCard(
                  icon: Icons.email,
                  iconColor: Colors.green,
                  backgroundColor: const Color.fromARGB(255, 187, 255, 189),
                  title: "email_us".translate,
                  subtitle: controller.helpAndSupportResponse?.customer.email ?? '',
                  titleColor: Colors.green,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required Color iconColor,
    required Color backgroundColor,
    required String title,
    required String subtitle,
    required Color titleColor,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 1),
      child: Card(
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: backgroundColor,
            child: Icon(icon, color: iconColor),
          ),
          title: Text(
            title,
            style: TextStyle(color: titleColor, fontWeight: FontWeight.w600),
          ),
          subtitle: Text(subtitle),
        ),
      ),
    );
  }
}
