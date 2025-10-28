import 'package:aqar/core/constants/aqar_string.dart';
import 'package:aqar/core/helpers/extensions.dart';
import 'package:flutter/material.dart';

import '../../core/routing/routes.dart';
import '../../gen/assets.gen.dart';
import 'model/boarding_model.dart';
import 'widgets/onboarding_page_view.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page?.round() ?? 0;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(Assets.images.logo.path),
        actions: [
          TextButton(
            onPressed: () => context.pushNamed(Routes.loginOptionScreen),
            child: Text(
              AqarString.skip,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          )
        ],
      ),
      body: PageView(
        controller: _pageController,
        children: List.generate(boarding.length, (index) {
          return OnboardingPageView(
            pageController: _pageController,
            isLastPage: index == boarding.length - 1,
            boardingModel: boarding[index],
            index: index,
            currentPage: _currentPage,
            onFinished: () {
              if (_pageController.hasClients) {
                _pageController.nextPage(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              }
            },
          );
        }),
      ),
    );
  }
}
