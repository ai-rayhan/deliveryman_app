import 'package:deliveryman_app/util/dimensions.dart';
import 'package:deliveryman_app/util/styles.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  final Function? onTap;
  final String? image;
  const TitleWidget({super.key, required this.title, this.onTap, this.image});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Row(children: [
        Text(title, style: robotoBold.copyWith(fontSize:Dimensions.fontSizeLarge)),
        const SizedBox(width: Dimensions.paddingSizeSmall),

        image != null ? Image.asset(image!, height: 20, width: 20) : const SizedBox(),
        ],
      ),
      (onTap != null) ? InkWell(
        onTap: onTap as void Function()?,
        child: Padding(
          padding: EdgeInsets.fromLTRB( 0, 5, 10, 5),
          child: Text(
            'see_all'.tr,
            style: robotoMedium.copyWith(fontSize: Dimensions.fontSizeSmall, color: Theme.of(context).primaryColor, decoration: TextDecoration.underline),
          ),
        ),
      ) : const SizedBox(),
    ]);
  }
}
