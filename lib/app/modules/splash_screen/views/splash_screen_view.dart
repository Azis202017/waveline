import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../routes/app_pages.dart';
import '../../../theme/color.dart';
import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashScreenController>(initState: (_) {
      Timer.periodic(const Duration(seconds: 4), (timer) {
        Get.offAllNamed(Routes.ONBOARDING );
        timer.cancel();
      });
    }, builder: (_) {
      return Scaffold(
        backgroundColor: primary,
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/img/Vector.png',
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'Waveline',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w700,
                    fontSize: 50.11,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const CircularProgressIndicator.adaptive(
                  backgroundColor: whiteColor,
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
