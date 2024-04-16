import 'package:demande_chifa/controllers/home_controller.dart';
import 'package:demande_chifa/pages/home_page.dart';
import 'package:demande_chifa/pages/login_page.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AuthController extends GetxController {
  // sign up
  TextEditingController email_signup_controller = TextEditingController();
  TextEditingController password_signup_controller = TextEditingController();
  TextEditingController confirm_password_controller = TextEditingController();

  void signUp() {
    Get.to(HomePage());
  }

  // login
  TextEditingController email_login_controller = TextEditingController();
  TextEditingController password_login_controller = TextEditingController();
  void loginUser() {
    Get.to(HomePage());
  }

  void logout() {
    Get.off(() => LoginPage());
  }
}
