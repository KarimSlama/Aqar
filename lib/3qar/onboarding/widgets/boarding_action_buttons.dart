import 'package:flutter/material.dart';

import '../../../core/constants/aqar_colors.dart';
import '../../../core/constants/aqar_sizes.dart';

class BoardingActionButtons extends StatelessWidget {
  final bool showBackButton;
  final VoidCallback onNext, onPrevious;
  const BoardingActionButtons(
      {super.key,
      required this.showBackButton,
      required this.onNext,
      required this.onPrevious});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      left: 20,
      right: 20,
      child: Row(
        spacing: AqarSizes.spaceBtwItems,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (showBackButton)
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AqarColors.white,
                shape: CircleBorder(),
              ),
              onPressed: onPrevious,
              child: Icon(Icons.arrow_back_rounded),
            ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(MediaQuery.of(context).size.width * .5, 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AqarSizes.borderRadiusLg),
              ),
            ),
            onPressed: onNext,
            child: Text("Next"),
          ),
        ],
      ),
    );
  }
}
