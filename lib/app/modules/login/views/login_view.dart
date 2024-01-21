import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:get/get.dart';
import 'package:waveline/app/theme/color.dart';
import 'package:waveline/app/theme/font.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (_) {
      return SafeArea(
        child: Scaffold(
          body: Form(
            key: controller.formKey,
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 32,
                ),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Image.asset(
                          'assets/img/logo-biru.png',
                          width: 77,
                          height: 35,
                        ),
                      ).animate().slideY(),
                      const SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: Text(
                          'Sign in',
                          textAlign: TextAlign.center,
                          style: h3Bold,
                        ),
                      ).animate().slideY(),
                      const SizedBox(
                        height: 8,
                      ),
                      Center(
                        child: Text(
                          'Hi! Welcome back, predict your stroke with waveline',
                          style: h5Regular.copyWith(
                            color: fontAbu,
                          ),
                        ),
                      ).animate().slideY(),
                      const SizedBox(
                        height: 42,
                      ),
                      Text(
                        'Email',
                        textAlign: TextAlign.center,
                        style: bodyRegular,
                      ).animate().slideY(),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: controller.emailController,
                        validator: controller.isValidEmail,
                        decoration: InputDecoration(
                          prefixIconConstraints: const BoxConstraints(
                            minWidth: 16,
                            minHeight: 16,
                          ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                            ),
                            child: Image.asset(
                              'assets/img/email.png',
                              width: 24,
                              height: 24,
                              color: fontAbu,
                            ),
                          ),
                          hintText: 'example@gmail.com',
                        ),
                      ).animate().slideY(),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        'Password',
                        textAlign: TextAlign.center,
                        style: bodyRegular,
                      ).animate().slideY(),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        controller: controller.passwordController,
                        obscureText: controller.isObsecurePassword,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: controller.isValidPassword,
                        decoration: InputDecoration(
                          hintText: '***********',
                          prefixIconConstraints: const BoxConstraints(
                            minWidth: 16,
                            minHeight: 16,
                          ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                            ),
                            child: Image.asset(
                              'assets/img/password.png',
                              width: 24,
                              height: 24,
                              color: fontAbu,
                            ),
                          ),
                          suffixIconConstraints: const BoxConstraints(
                            minWidth: 16,
                            minHeight: 16,
                          ),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                            ),
                            child: GestureDetector(
                              onTap: controller.showPassword,
                              child: Image.asset(
                                'assets/img/${controller.isObsecurePassword ? "nlp" : "lp"}.png',
                                width: 24,
                                height: 24,
                                color: fontAbu,
                              ),
                            ),
                          ),
                        ),
                      ).animate().slideY(),
                      const SizedBox(
                        height: 60,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: controller.login,
                          child: const Text('Login'),
                        ),
                      ).animate().slideY()
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
