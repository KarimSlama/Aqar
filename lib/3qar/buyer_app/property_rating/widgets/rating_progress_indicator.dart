import 'package:flutter/material.dart';

import '../../../../core/constants/aqar_colors.dart';
import '../../../../core/devices/device_utility.dart';

class RatingProgressIndicator extends StatelessWidget {
  final String text;
  final double value;
  const RatingProgressIndicator(
      {super.key, required this.text, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(text, style: Theme.of(context).textTheme.bodyMedium),
        ),
        Expanded(
          flex: 11,
          child: SizedBox(
            width: AqarDeviceUtility.getScreenWidth(context) * .8,
            child: LinearProgressIndicator(
              backgroundColor: AqarColors.grey,
              minHeight: 9,
              value: value,
              borderRadius: BorderRadius.circular(7),
              valueColor: AlwaysStoppedAnimation(AqarColors.primary),
            ),
          ),
        )
      ],
    );
  }
}
