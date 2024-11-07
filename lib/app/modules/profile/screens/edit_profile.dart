import 'package:deliveryman_app/app/modules/profile/controllers/profile_controller.dart';
import 'package:deliveryman_app/common/global_widgets/appbar.dart';
import 'package:deliveryman_app/common/global_widgets/custom_button.dart';
import 'package:deliveryman_app/common/global_widgets/custom_text_field.dart';
import 'package:deliveryman_app/common/global_widgets/network_image_with_shimmer.dart';
import 'package:deliveryman_app/helper/translated_text.dart';
import 'package:deliveryman_app/util/show_snackbar.dart';
import 'package:deliveryman_app/util/sizedbox_space.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
TextEditingController firstNameController = TextEditingController();
TextEditingController lastNameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController phoneController = TextEditingController();


@override
  void initState() {
    final prController = Get.find<ProfileController>();
    firstNameController.text = prController.userProfile?.firstname??'';
    lastNameController.text = prController.userProfile?.lastname??'';
    emailController.text = prController.userProfile?.email??'';
    phoneController.text = prController.userProfile?.mobile??'';
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar(
        context: context,
        text: "update_profile".translate,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: GetBuilder<ProfileController>(
          builder: (prController) {
            return Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: 80,
                      child: ClipOval(
                        child: Container(
                          child: prController.userProfile?.image==null?
                          Icon(Icons.account_circle_sharp,size: 80,color: Theme.of(context).hintColor,)
                          : NetworkImageWithShimmer(imageUrl: prController.userProfile?.image??'',),
                        ),
                      ),
                    ),
                     Positioned(
                      bottom: 8,
                      right: 8,
                      child: Icon(
                        Icons.camera_alt,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
                SizedBoxSpace.h10,
                CustomTextField(
                  controller:firstNameController,
                  label:Text("first_name".translate),
                ),
                SizedBoxSpace.h10,
                CustomTextField(
                  controller: lastNameController,
                  label:Text("last_name".translate),
                ),
                SizedBoxSpace.h10,
                CustomTextField(
                  controller: emailController,
                  label:Text("email".translate),
                ),
                SizedBoxSpace.h10,
                CustomTextField(
                  controller:phoneController ,
                  label:Text("update_phone".translate),
                  isEnabled: false,
                ),
                const Spacer(),
                prController.inProgress?const Center(child: CircularProgressIndicator(),):
                CustomButton(
                  buttonText: "update".translate,
                  onPressed: ()async {
                 bool response =  await prController.updateProfile(
                     firstNameController.text,
                     lastNameController.text,
                     emailController.text
                   );
                   if(response){
                    prController.getUserProfile();
                    SnackbarHelper.showSuccessSnackbar("Profile Updated", "Profile Updated Successfully");
                   }else{
                    SnackbarHelper.showErrorSnackbar('Failed to Update', "Profile Update Failed,${prController.errorMessage}");
                   }
                  },
                ),
              ],
            );
          }
        ),
      ),
    );
  }
}