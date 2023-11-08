import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:waveline/app/routes/app_pages.dart';
import 'package:waveline/app/services/auth_service.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLogin = false;
  void login() async{
    isLogin = await AuthService().login(email: emailController.text, password: passwordController.text);
    if(isLogin){
      Get.offAllNamed(Routes.HOME);
    }else {
      
    }
    

  }
}
