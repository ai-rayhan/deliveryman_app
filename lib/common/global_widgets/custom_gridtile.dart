
import 'package:deliveryman_app/common/global_widgets/custom_card.dart';
import 'package:deliveryman_app/common/global_widgets/network_image_with_shimmer.dart';
import 'package:flutter/material.dart';

class CustomGridTile extends StatelessWidget {
  const CustomGridTile({super.key, required this.title, this.subtitle, required this.imgUrl});
  final String  title;
  final String? subtitle;
  final String  imgUrl;
  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: NetworkImageWithShimmer(
              imageUrl: imgUrl,
              width: 50,
              height: 50,),
          ),
          // const SizedBox(height: 8.0),
          Text(
            title,maxLines: 2,overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          // const SizedBox(height: 8.0),
          // subtitle!=null?Text(
          //   subtitle!,
          //   textAlign: TextAlign.center,
          // ):Container(),
        ],
      ),
    );
  }
}
