import 'package:deliveryman_app/app/modules/order/screens/running_order.dart';
import 'package:deliveryman_app/common/global_widgets/network_image_with_shimmer.dart';
import 'package:flutter/material.dart';

class CollageAvatar extends StatelessWidget {
  final List<String> images;

  CollageAvatar({required this.images});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 30,
      child: _buildImageCollage(),
    );
  }

  Widget _buildImageCollage() {
    if (images.isEmpty) {
      return Container(); // If no images, return an empty widget
    } else if (images.length == 1) {
      // One image takes the full size
      return ClipOval(
        child: NetworkImageWithShimmer(
          imageUrl: getFullImageUrl(images[0]),
          width: 60,
          height: 60,
          fit: BoxFit.cover,
        ),
      );
    } else if (images.length == 2) {
      // Two images split the circle in half
      return Row(
        children: images.take(2).map((image) {
          return Expanded(
            child: NetworkImageWithShimmer(
              imageUrl: getFullImageUrl(image),
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          );
        }).toList(),
      );
    } else if (images.length == 3) {
     
      return Column(
        children: [
          NetworkImageWithShimmer(
            imageUrl: getFullImageUrl(images[0]),
            width: 60,
            height: 30,
            fit: BoxFit.cover,
          ),
          Row(
            children: images.skip(1).take(2).map((image) {
              return Expanded(
                child: NetworkImageWithShimmer(
                  imageUrl: getFullImageUrl(image),
                  width: 30,
                  height: 30,
                  fit: BoxFit.cover,
                ),
              );
            }).toList(),
          ),
        ],
      );
    } else {
      // Four images in a 2x2 grid
      return Column(
        children: [
          Row(
            children: images.take(2).map((image) {
              return Expanded(
                child: NetworkImageWithShimmer(
                  imageUrl: getFullImageUrl(image),
                  width: 30,
                  height: 30,
                  fit: BoxFit.cover,
                ),
              );
            }).toList(),
          ),
          Row(
            children: images.skip(2).take(2).map((image) {
              return Expanded(
                child: NetworkImageWithShimmer(
                  imageUrl: getFullImageUrl(image),
                  width: 30,
                  height: 30,
                  fit: BoxFit.cover,
                ),
              );
            }).toList(),
          ),
        ],
      );
    }
  }
}
