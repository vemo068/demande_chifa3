import 'package:demande_chifa/components/button.dart';
import 'package:demande_chifa/components/text_field.dart';
import 'package:demande_chifa/components/text_field1.dart';
import 'package:demande_chifa/controllers/auth_controller.dart';
import 'package:demande_chifa/controllers/demande_controller.dart';
import 'package:demande_chifa/pages/welcome_page.dart';
import 'package:demande_chifa/style/buttons_style.dart';
import 'package:demande_chifa/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SetPasswordPage extends StatelessWidget {
  SetPasswordPage({super.key});
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Set Password",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        elevation: 0,
        backgroundColor: kBackgroundColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: SingleChildScrollView(
              child: GetBuilder(
                  init: authController,
                  builder: (_) {
                    return Column(
                      children: [
                        const Text(
                          'Une application pour gérer votre CHIFA card virtuelle',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: kTextColor2,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 25),
                        // username textfield

                        // password textfield
                        TextField1(
                          textEditingController:
                              authController.password_signup_controller,
                          labelText: 'Mot de pass',
                          hintText: 'Entrez un neuvoux mot de pass',
                        ),

                        const SizedBox(height: 10),
                        TextField1(
                          textEditingController:
                              authController.confirm_password_controller,
                          labelText: 'Confirm Mot de pass',
                          hintText: 'Confirmer votre Mot de pass',
                        ),
                        const SizedBox(height: 10),
                        OutlinedButton(
                          style: kOutlinedButtonStyle,
                          onPressed: () async {
                            await authController.pickImage();
                          },
                          child: const Text("Photo"),
                        ),
                        SizedBox(
                          height: 80,
                          width: 80,
                          child: authController.profileImageBytes != null
                              ? Image.memory(authController.profileImageBytes!)
                              : const Text('No image selected'),
                        ),
                        const SizedBox(height: 25),
                        MyButton(
                          text: "Inscrire",
                          onTap: () {
                            authController.accountActivation();
                          },
                          color: kTextColor2,
                        ),
                      ],
                    );
                  }),
            ),
          ),
        ),
      ),
    );
  }
}
