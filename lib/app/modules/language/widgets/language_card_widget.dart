import 'package:deliveryman_app/common/global_widgets/custom_asset_image_widget.dart';
import 'package:deliveryman_app/util/dimensions.dart';
import 'package:flutter/material.dart';

class LocaleCard extends StatelessWidget {
  final bool isSelected;
  final String name;
  final String imageUrl;
  final VoidCallback onTap;

  const LocaleCard({
    super.key,
    required this.isSelected,
    required this.onTap, 
    required this.name,
    required this.imageUrl
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Container(
          height: 70,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: isSelected
                ? Theme.of(context).primaryColor.withOpacity(0.15)
                : Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(Dimensions.radiusLarge),
            border: Border.all(
              color: isSelected
                  ? Theme.of(context).primaryColor.withOpacity(0.2)
                  : Theme.of(context).disabledColor.withOpacity(0.3),
            ),
          ),
          child: ListTile(
            leading: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              child: CustomAssetImageWidget(
                imageUrl,
                height: 35,
                width: 60,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(name
            ),
            trailing: isSelected
                ? const Icon(
                    Icons.check_circle,
                    color: Colors.green,
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
