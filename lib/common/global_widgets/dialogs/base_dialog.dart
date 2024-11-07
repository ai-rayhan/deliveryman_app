import 'package:deliveryman_app/helper/translated_text.dart';
import 'package:deliveryman_app/util/dimensions.dart';
import 'package:deliveryman_app/util/styles.dart';
import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final Widget? content;
  final VoidCallback? onSubmitPressed;

  const CustomDialog({
    super.key,
    required this.title,
    this.onSubmitPressed,
    this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Theme.of(context).cardTheme.color,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(title,style: robotoMedium.copyWith(fontSize: Dimensions.fontSizeLarge,color: Theme.of(context).primaryColor),),
              const SizedBox(height: 15.0),
              content ?? Container(),
              const SizedBox(height: 22.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    style: TextButton.styleFrom(
                      backgroundColor: Theme.of(context).hintColor,
                      shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                      textStyle: robotoMedium,
                      foregroundColor: Colors.white,
                    ),
                    child:  Text('cancel'.translate,style: robotoRegular,),
                  ),
                  const SizedBox(width: 15.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      if (onSubmitPressed != null) {
                        onSubmitPressed!();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10,),
                    child: Text('ok'.translate,style: robotoMedium,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

void showCustomDialog({
  required BuildContext context,
  required String title,
  Widget? content,
  VoidCallback? onSubmitPressed,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return CustomDialog(
        title: title,
        content: content,
        onSubmitPressed: onSubmitPressed,
      );
    },
  );
}
