// import 'package:deliveryman_app/common/global_widgets/custom_asset_image.dart';
// import 'package:deliveryman_app/util/asset_path.dart';
// import 'package:flutter/material.dart';
// import 'package:shimmer_animation/shimmer_animation.dart';

// class NetworkImageWithShimmer extends StatelessWidget {
//   final String imageUrl;
//   final BoxFit fit;
//   final double? width;
//   final double? height;
//   final Widget? placeholder;
//   final Widget? errorWidget;
//   final Duration shimmerDuration;

//   const NetworkImageWithShimmer({
//     super.key,
//     required this.imageUrl,
//     this.fit = BoxFit.cover,
//     this.width,
//     this.height,
//     this.placeholder,
//     this.errorWidget,
//     this.shimmerDuration = const Duration(seconds: 1),
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Image.network(
//       imageUrl,
//       fit: fit,
//       width: width,
//       height: height,
//       loadingBuilder: (context, child, loadingProgress) {
//         if (loadingProgress == null) return child;
//         return _buildShimmer();
//       },
//       errorBuilder: (context, error, stackTrace) {
//         return errorWidget ?? _buildErrorWidget();
//       },
//     );
//   }

//   Widget _buildShimmer() {
//     return Shimmer(
//       duration: shimmerDuration,
//       enabled: true,
//       child: CustomAssetImageWidget(AssetPath.placeholder,width: width,height: height,),
//     );
//   }

//   Widget _buildErrorWidget() {
//     return Container(
//       color: Colors.grey[300],
//       child:  CustomAssetImageWidget(AssetPath.placeholder,width: width,height: height,),
//     );
//   }
// }

import 'package:deliveryman_app/common/global_widgets/custom_asset_image.dart';
import 'package:deliveryman_app/util/asset_path.dart';
import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class NetworkImageWithShimmer extends StatefulWidget {
  final String imageUrl;
  final BoxFit fit;
  final double? width;
  final double? height;
  final Widget? placeholder;
  final Widget? errorWidget;
  final Duration shimmerDuration;

  const NetworkImageWithShimmer({
    super.key,
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
    this.placeholder,
    this.errorWidget,
    this.shimmerDuration = const Duration(seconds: 1),
  });

  @override
  _NetworkImageWithShimmerState createState() => _NetworkImageWithShimmerState();
}

class _NetworkImageWithShimmerState extends State<NetworkImageWithShimmer> {
  int retryCount = 0;
  final int maxRetryCount = 3;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      widget.imageUrl,
      fit: widget.fit,
      width: widget.width,
      height: widget.height,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return _buildShimmer();
      },
      errorBuilder: (context, error, stackTrace) {
        if (retryCount < maxRetryCount) { 
          retryCount++;
          return _retryLoadingImage();
        } else {
          // If the maximum retries have been reached, show the error widget
          return widget.errorWidget ?? _buildErrorWidget();
        }
      },
    );
  }

  Widget _retryLoadingImage() {
    Future.delayed(const Duration(seconds: 1), () {
      // setState(() {});
    });
    return _buildShimmer();
  }

  Widget _buildShimmer() {
    return Shimmer(
      duration: widget.shimmerDuration,
      enabled: true,
      child: CustomAssetImageWidget(
        AssetPath.placeholder,
        width: widget.width,
        height: widget.height,
      ),
    );
  }

  Widget _buildErrorWidget() {
    return Container(
      color: Colors.grey[300],
      child: CustomAssetImageWidget(
        AssetPath.placeholder,
        width: widget.width,
        height: widget.height,
      ),
    );
  }
}
