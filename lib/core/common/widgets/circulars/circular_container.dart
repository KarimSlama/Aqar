import 'package:flutter/material.dart';
import '../../../constants/aqar_colors.dart';

class CircularContainer extends StatelessWidget {
  final double? width, height;
  final double? borderWidth;
  final Color? borderColor;
  final double radius;
  final double padding;
  final Widget? child;
  final Color color;

  const CircularContainer({
    super.key,
    this.width,
    this.height,
    this.radius = 50,
    this.padding = 0,
    this.child,
    this.color = AqarColors.light,
    this.borderWidth,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsetsDirectional.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(
            color: borderColor != null ? borderColor! : Colors.transparent,
            width: borderWidth != null ? borderWidth! : 0),
        color: color,
      ),
      child: child,
    );
  }
}
