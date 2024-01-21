import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:waveline/app/theme/color.dart';
import 'package:waveline/app/theme/font.dart';

import '../../../routes/app_pages.dart';

class OnboardingController extends GetxController {
  final introKey = GlobalKey<IntroductionScreenState>();
  void onIntroEnd() {
    Get.offAllNamed(Routes.STARTED_PAGE);
  }

  List<PageViewModel> pageViewModel = [
    PageViewModel(
      image: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/onboarding1.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      bodyWidget: Text(
        'With the revolutionary Waveline ECG device, you gain the power to predict whether you may be at risk of a stroke or not, putting your health in your hands.',
        style: body2Regular.copyWith(
          color: fontAbu,
        ),
      ),
      titleWidget: Text(
        'Device ECG',
        style: h3Bold,
      ),
    ),
    PageViewModel(
      image: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/onboarding2.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      titleWidget: Text(
        'Verify By Doctor',
        style: h3Bold,
      ),
      bodyWidget: Text(
        'Waveline ECG can provide an initial prediction of your stroke risk, but it\'s essential to consult with a doctor for a thorough examination and confirmation.',
        style: body2Regular.copyWith(
          color: fontAbu,
        ),
      ),
    ),
  ];
}
