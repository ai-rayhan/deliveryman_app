import 'package:deliveryman_app/app/data/urls.dart';
import 'package:deliveryman_app/app/modules/support/controllers/support_controller.dart';
import 'package:deliveryman_app/helper/translated_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PolicyWebview extends StatefulWidget {
  const PolicyWebview({super.key});

  @override
  State<PolicyWebview> createState() => _PolicyWebviewState();
}

class _PolicyWebviewState extends State<PolicyWebview> {
 String title=Get.arguments;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final controller = Get.find<SupportController>();
      if(title=="privacy_policy"){
       controller.getPrivacyInfo(Urls.privacyPolicy);
      }
      else if(title=="terms_and_conditions"){
         controller.getPrivacyInfo(Urls.termsAndConditions);
      }
      else if(title=="help_and_support"){
         controller.getHelpAndSupportInfo();
      }

    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(title.translate),
      ),
      body: GetBuilder<SupportController>(
        builder: (controller) {
          if(controller.inProgress){
            return const Center(child: CircularProgressIndicator());
          }
          return Container();
          // return HtmlViewWidget(htmlData:cleanHtml(controller.privacyPolicyResponse?.privacyPolicy.content??""));
        }
      )  
    );
  }
}


String cleanHtml(String html) {
  // Remove unwanted HTML entities and special characters
  html = html.replaceAll(RegExp(r'&nbsp;'), ' '); // Replace non-breaking spaces
  html = html.replaceAll(RegExp(r'&amp;'), '&'); // Replace ampersand entity
  html = html.replaceAll(RegExp(r'&lt;'), '<'); // Replace less-than entity
  html = html.replaceAll(RegExp(r'&gt;'), '>'); // Replace greater-than entity
  html = html.replaceAll(RegExp(r'&#39;'), '\''); // Replace apostrophe entity

  // Optionally, you can remove any other unwanted characters or HTML tags here
  // For example, removing <body> and </body> tags
  html = html.replaceAll(RegExp(r'<body[^>]*>|</body>'), '');

  return html.trim(); // Trim whitespace from start and end
}
