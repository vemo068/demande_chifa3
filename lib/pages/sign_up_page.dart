


import 'package:demande_chifa/components/button.dart';
import 'package:demande_chifa/components/text_field.dart';
import 'package:demande_chifa/controllers/auth_controller.dart';
import 'package:demande_chifa/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: GetBuilder(
                init: authController,
                builder: (_) {
                  return Column(
                    children: [
                      const Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 25),
                      // username textfield
                      MyTextField(
                        controller: authController.email_signup_controller,
                        hintText: 'Email',
                        obscureText: false,
                      ),

                      const SizedBox(height: 10),

                      // password textfield
                      MyTextField(
                        controller: authController.password_signup_controller,
                        hintText: 'Password',
                        obscureText: true,
                      ),

                      const SizedBox(height: 10),
                      MyTextField(
                        controller: authController.confirm_password_controller,
                        hintText: 'Confirm Password',
                        obscureText: true,
                      ),
                      const SizedBox(height: 25),
                      MyButton(
                        text: "Create an account",
                        onTap: authController.signUp,
                      ),
                      const SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("have an account? "),
                          TextButton(
                              onPressed: () {
                                Get.to(() => LoginPage());
                              },
                              child: const Text("Sign in")),
                        ],
                      )
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }
}
