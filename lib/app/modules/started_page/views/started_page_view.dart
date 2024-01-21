import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:get/get.dart';
import 'package:waveline/app/theme/color.dart';
import 'package:waveline/app/theme/font.dart';

import '../../../routes/app_pages.dart';
import '../controllers/started_page_controller.dart';

class StartedPageView extends GetView<StartedPageController> {
  const StartedPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 32,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        child: Image.asset(
                          'assets/img/logo-biru.png',
                          color: whiteColor,
                          width: 24,
                          height: 24,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Waveline',
                        style: h3Bold.copyWith(
                          color: primary,
                        ),
                      ),
                    ],
                  ).animate().slideY(),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Get Realtime Prediction  Healthy With ECG Device',
                    style: h1Bold.copyWith(
                      color: primary,
                    ),
                  ).animate().slideY(),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Get.toNamed(Routes.LOGIN);
                        },
                        child: const Text(
                          'Get Started',
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ).animate().slideY(),
            Align(
              alignment: Alignment.bottomLeft,
              child: Image.asset('assets/img/bottom_started.png', height: 300),
            ).animate().slideX(),
            Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(
                'assets/img/started.png',
                height: 450,
              ),
            ).animate().slideX(),
          ],
        ),
      ),
    );
  }
}
