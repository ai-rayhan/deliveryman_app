import 'package:deliveryman_app/app/modules/language/widgets/language_card_widget.dart';
import 'package:deliveryman_app/app/routes/app_routes.dart';
import 'package:deliveryman_app/app/modules/language/controllers/language_controller.dart';
import 'package:deliveryman_app/common/global_widgets/appbar.dart';
import 'package:deliveryman_app/helper/translated_text.dart';
import 'package:deliveryman_app/util/appconstants.dart';
import 'package:deliveryman_app/util/asset_path.dart';
import 'package:deliveryman_app/util/sizedbox_space.dart';
import 'package:deliveryman_app/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectLanguageScreen extends StatefulWidget {
  const SelectLanguageScreen({super.key});
  @override
  State<SelectLanguageScreen> createState() => _SelectLanguageScreenState();
}

class _SelectLanguageScreenState extends State<SelectLanguageScreen> {

  @override
  Widget build(BuildContext context) {
    bool fromMenu = Get.arguments??false;
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: fromMenu ? showAppBar(context: context, text: "back".translate) : null,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBoxSpace.h30,
              if (!fromMenu)
                Center(
                  child: Image.asset(AssetPath.languageBackground,height: 150,width: 150,),
                ),
              const Spacer(
                flex: 1,
              ),
              Row(
                children: [
                  Text("select_language".translate,
                    style: robotoBold.copyWith(fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: AppConstants.languages.length,
                itemBuilder: (context, index) {
                  final la= AppConstants.languages[index];
                  final Locale locale = Locale(
                      AppConstants.languages[index].languageCode,
                      AppConstants.languages[index].countryCode);
                  return GetBuilder<LanguageController>(
                      builder: (trController) {
                    return LocaleCard(
                      isSelected: trController.locale == locale,
                      name: la.languageName,
                      imageUrl:la.imageUrl,
                      onTap: () {
                        trController.changeLocale(locale);
                      },
                    );
                  });
                },
              ),
            
              const Spacer(flex: 2),
                SizedBox(
                    width:
                        size.width > 800 ? 800 * 0.45 : size.width * 0.95,
                    child: ElevatedButton(
                        onPressed: () async {
                         await Get.find<LanguageController>()
                            .saveLocaleToPrefs();
                           if (fromMenu) 
                              Get.back();
                            else{
                             Get.offAndToNamed(Routes.bottomNavigationBar);
                              }
                   
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text("save".translate,style: robotoBold,),
                        )))
            ],
          ),
        ),
      ),
    );
  }
}
