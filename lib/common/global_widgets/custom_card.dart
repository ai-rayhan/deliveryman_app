
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard(
      {super.key,
      required this.child,
      this.borderRadius,
      this.blurRadius = 2,
      this.spreadRadius = 2,
      this.padding = const EdgeInsets.all(8),
      this.color,
       this.onTap});
  final Widget child;
  final EdgeInsetsGeometry padding;
  final BorderRadiusGeometry? borderRadius;
  final double blurRadius;
  final double spreadRadius;
  final VoidCallback? onTap;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: borderRadius ?? BorderRadius.circular(12),
              color:color?? Theme.of(context).cardColor,
              boxShadow: [
                BoxShadow(
                    color: Theme.of(context).highlightColor,
                    spreadRadius: 2,
                    blurRadius: 5)
              ]),
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}
