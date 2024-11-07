
import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class CustomShimmer extends StatelessWidget {
const CustomShimmer({super.key, required this.child, this.color, this.duration});
final Widget child;
final Color? color;
final int? duration;

  @override
  Widget build(BuildContext context) {
    return  Shimmer(
              color:color?? Theme.of(context).primaryColor.withOpacity(0.1),
              duration: Duration(seconds:duration?? 1),
              child: child,
              );
  }
}