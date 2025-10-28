import 'package:flutter/material.dart';

class PropertyTextWithDefinition extends StatelessWidget {
  final String text, definition;
  const PropertyTextWithDefinition({
    super.key,
    required this.definition,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text),
        Text(definition),
      ],
    );
  }
}
