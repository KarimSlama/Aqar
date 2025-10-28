import 'package:flutter/material.dart';

import '../../../constants/aqar_colors.dart';

class RoundedContainer extends StatelessWidget {
  final Widget? child;
  final String? text;
  final TextStyle? style;
  final Color? bgColor, textColor, borderColor;

  final bool isText;
  final double? radius, borderWidth, margin;
  final double verticalPadding, horizontalPadding;
  final EdgeInsetsDirectional? padding;
  final int maxLines;

  const RoundedContainer({
    super.key,
    this.child,
    this.text,
    this.radius,
    this.maxLines = 2,
    required this.isText,
    this.bgColor,
    this.textColor,
    this.borderColor,
    this.borderWidth = 0,
    this.padding,
    this.style,
    this.margin,
    this.verticalPadding = 0.0,
    this.horizontalPadding = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(margin ?? 10),
        padding: padding ??
            EdgeInsets.symmetric(
                vertical: verticalPadding, horizontal: horizontalPadding),
        decoration: BoxDecoration(
            color: bgColor ?? AqarColors.black.withValues(alpha: .5),
            borderRadius: BorderRadius.circular(radius ?? 26),
            border: Border.all(
                color: borderColor ?? Colors.transparent,
                width: borderWidth ?? 1)),
        child: isText
            ? Text(text ?? '',
                maxLines: maxLines,
                overflow: TextOverflow.ellipsis,
                style: style ??
                    Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .apply(color: textColor))
            : child);
  }
}
