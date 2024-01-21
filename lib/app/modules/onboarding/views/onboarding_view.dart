import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:waveline/app/theme/font.dart';

import '../../../theme/color.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      key: controller.introKey,
      onDone: controller.onIntroEnd,
      pages: controller.pageViewModel,
      showDoneButton: true,
      done: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 18,
        ),
        decoration: BoxDecoration(
          color: primary,
          borderRadius: BorderRadius.circular(
            16,
          ),
        ),
        child: Text(
          'Done',
          style: h6SemiBold.copyWith(
            color: whiteColor,
          ),
        ),
      ),
      next: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 18,
        ),
        decoration: BoxDecoration(
          color: primary,
          borderRadius: BorderRadius.circular(
            16,
          ),
        ),
        child: Text(
          'Next',
          style: h6SemiBold.copyWith(
            color: whiteColor,
          ),
        ),
      ),
      showNextButton: true,
      showBackButton: false,
      showSkipButton: true,
      skip: Container(
        child: Text(
          'SKIP',
          style: h6SemiBold.copyWith(
            color: primary,
          ),
        ),
      ),
    );
  }
}
