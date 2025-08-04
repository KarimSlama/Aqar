import 'package:flutter/material.dart';

import '../../../constants/aqar_colors.dart';
import '../../../helpers/helper_functions.dart';

class CircularContainerShadow extends StatelessWidget {
  final Widget widget;
  final bool? isSelected;
  final bool showBorder, isPaddingAll, isCircularRadius;
  final double padding, horizontalPadding, verticalPadding;
  final double? width;
  final double? height;
  final double? radius, topEnd, bottomEnd, bottomStart;
  final Color? containerColor;

  const CircularContainerShadow({
    super.key,
    required this.widget,
    this.isSelected,
    this.padding = 0,
    this.width,
    this.height,
    this.radius,
    this.showBorder = false,
    this.isPaddingAll = true,
    this.horizontalPadding = 0,
    this.verticalPadding = 0,
    this.isCircularRadius = true,
    this.topEnd,
    this.bottomEnd,
    this.bottomStart,
    this.containerColor,
  });

  @override
  Widget build(BuildContext context) {
    final dark = AqarHelperFunctions.isDark(context);
    return Container(
      padding: isPaddingAll
          ? EdgeInsetsDirectional.all(padding)
          : EdgeInsetsDirectional.symmetric(
              horizontal: horizontalPadding, vertical: verticalPadding),
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: containerColor ?? (dark ? AqarColors.black : AqarColors.white),
        borderRadius: isCircularRadius
            ? BorderRadiusDirectional.circular(radius ?? 100)
            : BorderRadiusDirectional.only(
                topStart: Radius.circular(radius ?? 10),
                bottomStart: Radius.circular(bottomStart ?? 4),
                bottomEnd: Radius.circular(bottomEnd ?? 14),
                topEnd: Radius.circular(topEnd ?? 14),
              ),
        boxShadow: [
          BoxShadow(
            color: dark
                ? AqarColors.white.withValues(alpha: .1)
                : AqarColors.black.withValues(alpha: .1),
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(0, 4),
          )
        ],
      ),
      child: widget,
    );
  }
}
