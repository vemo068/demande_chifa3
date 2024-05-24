import 'package:demande_chifa/components/button.dart';
import 'package:demande_chifa/components/text_field1.dart';
import 'package:demande_chifa/controllers/auth_controller.dart';

import 'package:demande_chifa/style/colors.dart';
import 'package:demande_chifa/style/strings.dart';
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
          set_password_page_title,
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
                          ktext_introduction_echifa,
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
                          labelText: ktext_labelText_mot_de_pass,
                          hintText:
                              hintText_neuvoux_mot_de_pass_set_password_page,
                        ),

                        const SizedBox(height: 10),
                        TextField1(
                          textEditingController:
                              authController.confirm_password_controller,
                          labelText:
                              labelText_confirm_mot_de_pass_set_password_page,
                          hintText:
                              hintText_confirm_mot_de_pass_set_password_page,
                        ),

                        const SizedBox(height: 25),
                        MyButton(
                          text: text_btn_inscrire_set_password_page,
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
