import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../constants/aqar_colors.dart';

class AqarReadMoreText extends StatelessWidget {
  final String text;
  final int lines;

  const AqarReadMoreText({super.key, required this.text, required this.lines});

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      text,
      trimLines: lines,
      trimMode: TrimMode.Line,
      trimExpandedText: 'show Less',
      trimCollapsedText: 'show More',
      moreStyle: TextStyle(
          fontWeight: FontWeight.w700, fontSize: 14, color: AqarColors.blue),
      lessStyle: TextStyle(
          fontWeight: FontWeight.w700, fontSize: 14, color: AqarColors.blue),
    );
  }
}
