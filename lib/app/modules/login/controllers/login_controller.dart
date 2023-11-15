import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:waveline/app/routes/app_pages.dart';
import 'package:waveline/app/services/auth_service.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLogin = false;
  bool isObsecurePassword = true;
  final formKey = GlobalKey<FormState>();
  void login() async {
    isLogin = await AuthService().login(
      email: emailController.text,
      password: passwordController.text,
    );
    if (formKey.currentState!.validate()) {
      if (isLogin) {
        Get.offAllNamed(Routes.BOTTOM_NAV);
      } else {}
    }
  }

  void showPassword() {
    isObsecurePassword = !isObsecurePassword;
    update();
  }

  String? isValidPassword(String? password) {
    
    if (password!.length < 7) {
      return "You have the password 7";
    }
    return null;
  }

  String? isValidEmail(String? email) {
     if (email!.isEmpty) {
      return "You have the password 7";
    }
    if (!email.contains("@")) {
      return "Valid email use @";
    }
    return null;
  }
}
