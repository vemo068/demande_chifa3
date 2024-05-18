import 'dart:io';
import 'dart:typed_data';

import 'package:demande_chifa/api/http_assure_service.dart';
import 'package:demande_chifa/controllers/home_controller.dart';
import 'package:demande_chifa/models/assure.dart';
import 'package:demande_chifa/pages/enter_password_page.dart';
import 'package:demande_chifa/pages/home_page.dart';
import 'package:demande_chifa/pages/set_password_page.dart';
import 'package:demande_chifa/pages/welcome_page.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AuthController extends GetxController {
  Assure? currenAssure;
  HttpAssureService httpService = HttpAssureService();
  // sign up
  TextEditingController n_Assure_controller = TextEditingController();
  TextEditingController password_signup_controller = TextEditingController();
  TextEditingController confirm_password_controller = TextEditingController();

  Uint8List? profileImageBytes;

  void signUp() {
    Get.to(HomePage());
  }

  // login
  //TextEditingController email_login_controller = TextEditingController();
  TextEditingController password_login_controller = TextEditingController();
  void checkAccountIsActivated() async {
    bool? isActive =
        await HttpAssureService.checkActivation(n_Assure_controller.text);
    if (isActive != null) {
      if (isActive) {
        Get.to(EnterPasswordPage());
      } else {
        Get.to(SetPasswordPage());
      }
    } else {
      Get.snackbar(
        "Login Faild",
        "please check Numero d'Assurance",
        // borderColor: Colors.red,
        // colorText: Colors.black,
      );
    }
  }

  void accountActivation() async {
    if (password_signup_controller.text == confirm_password_controller.text) {
      currenAssure = await HttpAssureService.activateAccount(
        n_Assure_controller.text,
        password_signup_controller.text,
      );
      print(currenAssure);
      // login
      if (currenAssure != null) {
        Get.snackbar(
          "Compte creeé",
          "d",
        );
        Get.offAll(() => HomePage());
      } else {
        Get.snackbar(
          "Login Faild",
          "please check internet",
        );
      }
    } else {
      Get.snackbar(
        "Login Faild",
        "please confirm Mot de pass",
      );
    }
  }

  Future<void> login() async {
    currenAssure = await HttpAssureService.login(
        n_Assure_controller.text, password_login_controller.text);
    if (currenAssure != null) {
      Get.offAll(() => HomePage());
    } else {
      Get.snackbar(
        "Login Faild",
        "please check your password ",
      );
    }
  }

  void logout() {
    Get.offAll(() => WelcomePage());
    currenAssure = null;
    update();
  }

  Future<void> pickImage() async {
    try {
      // Pick a single file
      var file = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: [
          'jpg',
          'jpeg',
          'png'
        ], // Add more extensions if needed
      );

      if (file != null && file.files.isNotEmpty) {
        // Get the path of the picked file
        String path = file.files.first.path!;
        // Read the file as bytes
        File imageFile = File(path);
        List<int> bytes = await imageFile.readAsBytes();
        profileImageBytes = Uint8List.fromList(bytes);
        print("::::::: $bytes");
        update();
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }
}
