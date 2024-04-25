import 'package:demande_chifa/api/http_service.dart';
import 'package:demande_chifa/controllers/home_controller.dart';
import 'package:demande_chifa/pages/enter_password_page.dart';
import 'package:demande_chifa/pages/home_page.dart';
import 'package:demande_chifa/pages/set_password_page.dart';
import 'package:demande_chifa/pages/welcome_page.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AuthController extends GetxController {
  HttpService httpService = HttpService();
  // sign up
  TextEditingController n_Assure_controller = TextEditingController();
  TextEditingController password_signup_controller = TextEditingController();
  TextEditingController confirm_password_controller = TextEditingController();

  void signUp() {
    Get.to(HomePage());
  }

  // login
  //TextEditingController email_login_controller = TextEditingController();
  TextEditingController password_login_controller = TextEditingController();
  void checkAccountIsActivated() async {
    bool? isActive =
        await HttpService.checkActivation(n_Assure_controller.text);
    if (isActive != null) {
      if (isActive) {
        Get.to(() => EnterPasswordPage());
      } else {
        Get.to(() => SetPasswordPage());
      }
    } else {
      Get.snackbar("Login Faild", "please check Numero d'Assurance");
    }
  }

  void logout() {
    Get.off(() => WelcomePage());
  }
}
