import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:aqar/core/constants/aqar_colors.dart';

class SpanText extends StatelessWidget {
  final String text, actionText;
  final String? actionText2;
  final VoidCallback? actionTextOnTap;
  final bool isSmall, isActionCenter;
  final TextStyle? textStyle;
  final TextStyle? actionTextStyle;
  const SpanText(
      {super.key,
      required this.text,
      required this.actionText,
      this.actionTextOnTap,
      this.isSmall = false,
      this.textStyle,
      this.actionTextStyle,
      this.isActionCenter = false,
      this.actionText2});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
              text: '$text ',
              style: isSmall
                  ? Theme.of(context).textTheme.bodyMedium
                  : textStyle ?? Theme.of(context).textTheme.titleMedium),
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = actionTextOnTap,
            text: actionText,
            style: isSmall
                ? Theme.of(context).textTheme.bodyMedium!.apply(
                      color: AqarColors.darkBlue,
                    )
                : actionTextStyle ??
                    Theme.of(context).textTheme.titleMedium!.apply(
                          color: AqarColors.darkBlue,
                        ),
          ),
          if (isActionCenter)
            TextSpan(
                text: ' $actionText2 ',
                style: isSmall
                    ? Theme.of(context).textTheme.bodyMedium
                    : textStyle ?? Theme.of(context).textTheme.titleMedium),
        ],
      ),
    );
  }
}
