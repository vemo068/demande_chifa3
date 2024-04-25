import 'package:demande_chifa/api/http_service.dart';
import 'package:demande_chifa/controllers/home_controller.dart';
import 'package:demande_chifa/models/assure.dart';
import 'package:demande_chifa/pages/enter_password_page.dart';
import 'package:demande_chifa/pages/home_page.dart';
import 'package:demande_chifa/pages/set_password_page.dart';
import 'package:demande_chifa/pages/welcome_page.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AuthController extends GetxController {
  Assure? currenAssure;
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
    if (isActive == null) {
      Get.snackbar("Login Faild", "please check Numero d'Assurance",
          borderColor: Colors.red);
     
       
    } else if(isActive) {
       Get.to(() => EnterPasswordPage());
      } else {
        Get.to(() => SetPasswordPage());
      }
    }
  

  void accountActivation() async {
    if (password_signup_controller.text == confirm_password_controller.text) {
      currenAssure = await HttpService.activateAccount(
          n_Assure_controller.text, password_signup_controller.text);

      // login
      if (currenAssure != null) {
        Get.snackbar("Compte creeé", "", borderColor: Colors.green);
        Get.offAll(() => HomePage());
      } else {
        Get.snackbar(
          "Login Faild",
          "please check internet",
          borderColor: Colors.red,
        );
      }
    } else {
      Get.snackbar("Login Faild", "please check Mot de pass",
          borderColor: Colors.red);
    }
  }

  Future<void> login() async {
    currenAssure = await HttpService.login(
        n_Assure_controller.text, password_login_controller.text);
    if (currenAssure != null) {
      Get.offAll(() => HomePage());
    } else {
      Get.snackbar(
        "Login Faild",
        "please check your password ",
        borderColor: Colors.red,
      );
      
    }
  }

  void logout() {
    Get.off(() => WelcomePage());
  }
}
