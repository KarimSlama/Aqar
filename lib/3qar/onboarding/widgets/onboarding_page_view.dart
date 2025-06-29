import 'package:animate_do/animate_do.dart';
import 'package:aqar/3qar/onboarding/model/boarding_model.dart';
import 'package:aqar/core/common/widgets/texts/text_span.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/aqar_colors.dart';
import '../../../core/constants/aqar_sizes.dart';
import 'image_with_action_buttons_and_progress_bar.dart';

class OnboardingPageView extends StatefulWidget {
  final BoardingModel boardingModel;
  final VoidCallback onFinished;
  final int index;
  final int currentPage;
  final PageController pageController;
  final bool isLastPage;
  const OnboardingPageView(
      {super.key,
      required this.boardingModel,
      required this.onFinished,
      required this.index,
      required this.currentPage,
      required this.pageController,
      required this.isLastPage});

  @override
  State<OnboardingPageView> createState() => _OnboardingPageViewState();
}

class _OnboardingPageViewState extends State<OnboardingPageView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          widget.onFinished();
        }
      });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: const Duration(milliseconds: 200),
      child: Padding(
        padding: const EdgeInsetsDirectional.only(
            start: AqarSizes.ms,
            end: AqarSizes.ms,
            top: AqarSizes.lg,
            bottom: AqarSizes.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: AqarSizes.spaceBtwItems,
          children: [
            SpanText(
              text: widget.boardingModel.title,
              actionText: widget.boardingModel.actionText,
              actionText2: widget.boardingModel.actionText2,
              isActionCenter: widget.boardingModel.actionText2 != null,
              textStyle: Theme.of(context).textTheme.headlineSmall,
              actionTextStyle:
                  Theme.of(context).textTheme.headlineMedium!.apply(
                        color: AqarColors.darkBlue,
                      ),
            ),
            Text(
              widget.boardingModel.body,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            ImageWithActionButtonsAndProgressBar(
              image: widget.boardingModel.image,
              animation: _animation,
              isLastPage: widget.isLastPage,
              pageController: widget.pageController,
              showBackButton:
                  widget.index != 0 && widget.currentPage == widget.index,
            ),
          ],
        ),
      ),
    );
  }
}
