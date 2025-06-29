import 'package:aqar/core/helpers/extensions.dart';
import 'package:aqar/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../core/constants/aqar_colors.dart';
import '../../../core/constants/aqar_sizes.dart';
import 'boarding_action_buttons.dart';

class ImageWithActionButtonsAndProgressBar extends StatelessWidget {
  const ImageWithActionButtonsAndProgressBar({
    super.key,
    required Animation<double> animation,
    required this.image,
    required this.showBackButton,
    required this.isLastPage,
    required this.pageController,
  }) : _animation = animation;

  final Animation<double> _animation;
  final String image;
  final bool showBackButton;
  final bool isLastPage;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AqarSizes.borderRadiusXxl),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              image,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 100,
              left: 100,
              child: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return LinearPercentIndicator(
                    width: MediaQuery.of(context).size.width * .4,
                    animation: false,
                    lineHeight: 3,
                    percent: _animation.value,
                    linearStrokeCap: LinearStrokeCap.butt,
                    progressColor: AqarColors.white,
                    backgroundColor: AqarColors.light,
                  );
                },
              ),
            ),
            BoardingActionButtons(
              showBackButton: showBackButton,
              onPrevious: () => pageController.previousPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              ),
              onNext: () {
                if (isLastPage) {
                  context.pushNamed(Routes.loginOptionScreen);
                } else {
                  pageController.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
