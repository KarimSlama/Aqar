import 'package:flutter/material.dart';

import '../../../../core/constants/aqar_colors.dart';
import '../../../../core/constants/aqar_sizes.dart';

class CategoriesItemButtons extends StatelessWidget {
  final bool isSelected;
  final Widget icon;
  final String text;
  const CategoriesItemButtons({
    super.key,
    this.isSelected = false,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        padding: EdgeInsetsDirectional.symmetric(
          vertical: AqarSizes.ms,
          horizontal: AqarSizes.md,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          border: Border.all(
            color: isSelected ? Colors.transparent : AqarColors.light,
          ),
          color: isSelected ? AqarColors.green : Colors.transparent,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(width: 30, child: icon),
            SizedBox(width: AqarSizes.xs),
            Text(text,
                style: Theme.of(context).textTheme.bodyLarge!.apply(
                    color: isSelected ? AqarColors.white : AqarColors.grey)),
          ],
        ),
      ),
    );
  }
}
