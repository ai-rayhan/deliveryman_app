
import 'package:deliveryman_app/app/modules/profile/controllers/profile_controller.dart';
import 'package:deliveryman_app/app/routes/app_routes.dart';
import 'package:deliveryman_app/common/global_widgets/custom_card.dart';
import 'package:deliveryman_app/common/global_widgets/network_image_with_shimmer.dart';
import 'package:deliveryman_app/helper/translated_text.dart';
import 'package:deliveryman_app/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileCard extends StatefulWidget {
  const ProfileCard({super.key});

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {

@override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final prController = Get.find<ProfileController>();
      prController.getUserProfile();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (prController) {
        return Column(
          children: [
            ListTile(
                leading: prController.userProfile?.image==null?Icon(Icons.account_circle_sharp,size: 50,color: Theme.of(context).hintColor,): NetworkImageWithShimmer(imageUrl: prController.userProfile?.image??'',),
                title: Text("${prController.userProfile?.firstname} ${prController.userProfile?.lastname}"),
                subtitle: Text("${"joined".translate} ${prController.userProfile?.joinedDate()}"),
                trailing: IconButton(
                  onPressed: () {
                    Get.toNamed(Routes.editProfile);
                  },
                  icon: const Icon(Icons.edit),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               DashBoardCard(icon: Icons.refresh, title: "pending_orders", amount: '${prController.profileResponse?.pendingOrders??''}'),
               DashBoardCard(icon: Icons.rocket_launch, title: "processing_orders", amount: '${prController.profileResponse?.processingOrders??''}'),
               DashBoardCard(icon: Icons.shopping_bag, title: "completed_orders", amount: '${prController.profileResponse?.completedOrders??''}'),
              //  DashBoardCard(icon: Icons.wallet, title: "wallet_balance".translate, amount: "\$ 330"),
              //  DashBoardCard(icon: Icons.shopping_bag, title: "total_order".translate, amount: "0"),

             ],
           )
          ],
        );
      }
    );
  }
}

class DashBoardCard extends StatelessWidget {
  const DashBoardCard({super.key, required this.icon, required this.title, required this.amount});
  final IconData icon;
  final String title;
  final String amount;
  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: CustomCard(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(icon,
                              color: Theme.of(context).primaryColor,
                              size: 30,
                            ),
                            Text(amount,style: robotoBold.copyWith(fontSize: 18),
                            ),
                            Text(title.translate,style: robotoMedium.copyWith(fontSize: 12),overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
        ),
      ),
    );
  }
}