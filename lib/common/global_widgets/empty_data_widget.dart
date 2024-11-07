import 'package:deliveryman_app/helper/translated_text.dart';
import 'package:deliveryman_app/util/asset_path.dart';
import 'package:deliveryman_app/util/styles.dart';
import 'package:flutter/material.dart';

class EmptyDataWidget extends StatelessWidget {
  const EmptyDataWidget({super.key,  this.msg, this.msgStyle, this.image});
  final String? msg;
  final TextStyle? msgStyle;
  final String? image;
  @override
  Widget build(BuildContext context) {
    return Center(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Image.asset(image??AssetPath.noDataFound,height: 150,width: 150,),
      Center(child: Text(msg ??"no_data_found".translate,style:msgStyle?? robotoMedium.copyWith(fontSize: 16,color: Theme.of(context).hintColor)),),
      const SizedBox(height: 50,)
    ],),);
  }
}