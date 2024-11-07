
import 'package:flutter/material.dart';

class SelectionCard extends StatelessWidget {
  const SelectionCard(
      {super.key, required this.isSelected, required this.title, this.hints, this.onTap, this.trailing, this.child});
  final bool isSelected;
  final String title;
  final String? hints;
  final Widget? trailing;
  final Widget? child;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
             color:isSelected? Theme.of(context).primaryColor.withOpacity(.1):Theme.of(context).cardColor,
              border:Border.all(color:isSelected ? Theme.of(context).primaryColor:Theme.of(context).highlightColor),
              borderRadius: BorderRadius.circular(12)
              ),
              child:child??ListTile(
                title: Text(title),
                subtitle:hints!=null?Text(hints!,style: TextStyle(color: Theme.of(context).hintColor,fontSize: 12),):null,
                trailing:trailing,
                leading: isSelected? Icon(Icons.check_circle,color: Colors.green,):Icon(Icons.circle_outlined,color: Colors.green.withOpacity(.6),),
              ),
        ),
      ),
    );
  }
}
