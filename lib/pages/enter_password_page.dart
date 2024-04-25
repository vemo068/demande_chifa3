// ignore_for_file: must_be_immutable

import 'package:demande_chifa/components/button.dart';
import 'package:demande_chifa/components/text_field.dart';
import 'package:demande_chifa/components/text_field1.dart';
import 'package:demande_chifa/controllers/auth_controller.dart';
import 'package:demande_chifa/pages/home_page.dart';
import 'package:demande_chifa/pages/set_password_page.dart';
import 'package:demande_chifa/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EnterPasswordPage extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();
  EnterPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
          child: GetBuilder(
              init: authController,
              builder: (_) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 150.0,
                      height: 150.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: kTextColor2.withOpacity(0.2),
                      ),
                      child: const Icon(
                        Icons.person,
                        size: 80.0,
                        color: kTextColor2,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    const Text(
                      'Entrez votre Mot de pass',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: kTextColor2,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    const Text(
                      'Une application pour gérer votre CHIFA card virtuelle',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: kTextColor2,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 40.0),
                    TextField1(
                      textEditingController:
                          authController.password_login_controller,
                      labelText: 'Mot de pass',
                      hintText: 'Entrez votre Mot de pass',
                    ),
                    const SizedBox(height: 40.0),
                    MyButton(
                      onTap: () async {
                        authController.login();
                      },
                      text: "Continue",
                      color: kTextColor2,
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
