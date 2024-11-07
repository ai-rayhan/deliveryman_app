
import 'package:deliveryman_app/util/dimensions.dart';
import 'package:flutter/material.dart';

class BackgroundContainer extends StatelessWidget {
  const BackgroundContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
      return Container(
      color: Theme.of(context).primaryColor.withOpacity(.3),
      padding: const EdgeInsets.only(
        top: Dimensions.paddingSizeDefault,
        bottom: Dimensions.paddingSizeLarge,
        left: Dimensions.paddingSizeSmall,
        right: Dimensions.paddingSizeSmall
       ),
    child: child,
    );
  }
}