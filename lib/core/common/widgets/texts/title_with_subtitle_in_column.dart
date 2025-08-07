import 'package:aqar/core/common/widgets/texts/text_span.dart';
import 'package:flutter/material.dart';

import '../../../constants/aqar_sizes.dart';

class TitleWithSuptitleInColumn extends StatelessWidget {
  final String text;
  final String price;
  final int? noOfYears;
  final bool isActionText;
  const TitleWithSuptitleInColumn(
      {super.key,
      required this.text,
      this.noOfYears,
      required this.price,
      this.isActionText = true});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: AqarSizes.sm,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text),
        SpanText(
          text: price,
          actionText:
              noOfYears != null ? 'AED/ Month | $noOfYears Years' : 'AED',
          actionTextStyle: Theme.of(context).textTheme.bodySmall,
        )
      ],
    );
  }
}
