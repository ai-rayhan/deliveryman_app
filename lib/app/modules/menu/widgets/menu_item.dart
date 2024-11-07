
import 'package:deliveryman_app/util/dimensions.dart';
import 'package:deliveryman_app/util/sizedbox_space.dart';
import 'package:deliveryman_app/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuItem extends StatefulWidget {
  const MenuItem({
    super.key,
    required this.routeName,
    required this.icon,
    required this.name,
    required this.showDivider, 
    this.arguments
  });

  final String  routeName;
  final IconData icon;
  final String name;
  final bool showDivider;
  final dynamic arguments;

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(widget.routeName,arguments: widget.arguments);
      },
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                widget.icon,
                color: Theme.of(context).hintColor,
                size: Dimensions.iconSizeDefault,
              ),
              SizedBoxSpace.w10,
              Text(
                widget.name,
                style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeDefault),
              ),
            ],
          ),
          if (widget.showDivider)
            Divider(
              thickness: 1,
              color: Theme.of(context).hintColor.withOpacity(.2),),
        ],
      ),
    );
  }
}
