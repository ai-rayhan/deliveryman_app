
import 'package:deliveryman_app/common/global_widgets/custom_asset_image.dart';
import 'package:deliveryman_app/util/styles.dart';
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({super.key, required this.name, this.leading, this.leadingOntap, this.imgUrl});
  final String name;
  final Widget? leading;
  final VoidCallback? leadingOntap;
  final String? imgUrl;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style:robotoBold.copyWith(color: Theme.of(context).primaryColor,fontSize:17),
          ),
          const SizedBox(width: 10,),
          imgUrl!=null? CustomAssetImageWidget(imgUrl!,height: 20):Container(),
          const Spacer(),
          leading!=null?GestureDetector(
            onTap: leadingOntap,
            child: leading,
          ):Container(),
        ],
      ),
    );
  }
}