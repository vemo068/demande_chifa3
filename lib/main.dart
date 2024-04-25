import 'package:demande_chifa/controllers/auth_controller.dart';
import 'package:demande_chifa/controllers/home_controller.dart';
import 'package:demande_chifa/pages/home_page.dart';
import 'package:demande_chifa/pages/welcome_page.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(TheApp());
}

// ignore: must_be_immutable
class TheApp extends StatelessWidget {
  HomeController homeController = Get.put(HomeController());
  AuthController authController = Get.put(AuthController());
  TheApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Demande Chifa',
      home: WelcomePage(),
    );
  }
}
