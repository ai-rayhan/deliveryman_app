import 'package:deliveryman_app/common/global_widgets/appbar.dart';
import 'package:deliveryman_app/common/global_widgets/network_image_with_shimmer.dart';
import 'package:flutter/material.dart';

class FullScreenImageViewer extends StatefulWidget {
  final String imageUrl;
  final BoxFit?  fit;
  final double? height;
  final double? width;
  const FullScreenImageViewer({super.key, required this.imageUrl, this.fit, this.height, this.width});

  @override
  FullScreenImageViewerState createState() => FullScreenImageViewerState();
}

class FullScreenImageViewerState extends State<FullScreenImageViewer> {
 final TransformationController _transformationController = TransformationController();
  double _currentScale = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar(context: context, text: ''),
      body: Center(
        child: GestureDetector(
          onDoubleTap: () {
            setState(() {
              // Toggle between zoomed-in and original scale
              _currentScale = _currentScale == 1.0 ? 2.5 : 1.0;
              _transformationController.value = Matrix4.identity()..scale(_currentScale);
            });
          },
          child: InteractiveViewer(
            transformationController: _transformationController,
            boundaryMargin: const EdgeInsets.all(20),
            minScale: 1.0,
            maxScale: 5.0,
            child: SizedBox(
              height: double.infinity,
              child: NetworkImageWithShimmer(
                imageUrl: widget.imageUrl,
                fit: widget.fit??BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _transformationController.dispose();
    super.dispose();
  }
}
