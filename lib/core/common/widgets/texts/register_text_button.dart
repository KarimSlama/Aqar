import 'package:aqar/core/common/widgets/texts/text_span.dart';
import 'package:flutter/material.dart';

class RegisterTextButton extends StatelessWidget {
  final String text;
  final String actionText;
  final VoidCallback onActionTextTap;
  const RegisterTextButton({
    super.key,
    required this.text,
    required this.actionText,
    required this.onActionTextTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpanText(
        text: text,
        actionText: actionText,
        actionTextOnTap: onActionTextTap,
      ),
    );
  }
}
