import 'package:demande_chifa/components/button.dart';
import 'package:demande_chifa/components/drawer.dart';
import 'package:demande_chifa/controllers/auth_controller.dart';
import 'package:demande_chifa/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();
  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: TheDrawer(),
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: kTextColor2,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GetBuilder(
              init: authController,
              builder: (_) {
                return authController.currenAssure != null
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          authController.currenAssure!.image == null
                              ? const Text("no image")
                              : CircleAvatar(
                                  radius: 50,
                                  backgroundImage: MemoryImage(
                                      authController.currenAssure!.image!),
                                ),
                          const SizedBox(height: 20),
                          Text(
                            'Numéro d\'assurance: ${authController.currenAssure!.numAssure}',
                            style: const TextStyle(color: kTextColor2),
                          ),
                          Text(
                            'Nom: ${authController.currenAssure!.nom}',
                            style: const TextStyle(color: kTextColor2),
                          ),
                          Text(
                            'Prénom: ${authController.currenAssure!.prenom}',
                            style: const TextStyle(color: kTextColor2),
                          ),
                          Text(
                            'Date de naissance: ${authController.currenAssure!.dateNaissance}',
                            style: const TextStyle(color: kTextColor2),
                          ),
                          Text(
                            'Date fin droit: ${authController.currenAssure!.dateFinDroit}',
                            style: const TextStyle(color: kTextColor2),
                          ),
                          Text(
                            'Taux: ${authController.currenAssure!.taux} %',
                            style: const TextStyle(color: kTextColor2),
                          ),
                        ],
                      )
                    : const Text("data");
              }),
        ),
      ),
    );
  }
}
