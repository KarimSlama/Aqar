import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../constants/aqar_colors.dart';
import '../../../constants/aqar_sizes.dart';

class AnimationLoaderWidget extends StatelessWidget {
  final String text, animation;
  final String? actionText;
  final bool showAction;
  final VoidCallback? onActionPressed;

  const AnimationLoaderWidget(
      {super.key,
      required this.text,
      required this.animation,
      this.actionText,
      this.showAction = false,
      this.onActionPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: AqarSizes.defaultSpace,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(animation,
              width: MediaQuery.of(context).size.width * .8),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          showAction
              ? OutlinedButton(
                  onPressed: onActionPressed,
                  style: OutlinedButton.styleFrom(
                      backgroundColor: AqarColors.black),
                  child: Text(
                    actionText!,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .apply(color: AqarColors.light),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
