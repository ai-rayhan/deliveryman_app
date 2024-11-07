import 'package:deliveryman_app/common/global_widgets/custom_gridtile.dart';
import 'package:flutter/material.dart';

class ReusableCategoryGrid extends StatelessWidget {
  final List categories;
  final Function(int) onTap; // A callback function for item taps

  const ReusableCategoryGrid({
    Key? key,
    required this.categories,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Number of columns
          crossAxisSpacing: 16.0, // Spacing between columns
          mainAxisSpacing: 16.0, // Spacing between rows
          childAspectRatio: 1.0, // Aspect ratio of the items
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => onTap(index),
            child: CustomGridTile(
              title: categories[index].categoryName,
              imgUrl: categories[index].imageUrl,
            ),
          );
        },
      ),
    );
  }
}
