import 'package:demande_chifa/controllers/auth_controller.dart';
import 'package:demande_chifa/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ChifaCard extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();
  ChifaCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: authController,
        builder: (_) {
          return Material(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 2,
            child: Container(
              padding: const EdgeInsets.all(10),
              height: 200,
              width: 350,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 93, 235, 243),
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
                image: DecorationImage(
                    image: AssetImage("assets/Chifa_background.png"),
                    fit: BoxFit.cover),
              ),
              child: Column(
                children: [
                  const Center(
                    child: Text(
                      "E-CHIFA",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: kTextColor2,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 100,
                        width: 80,
                        color: kTextColor2,
                        child: Image.memory(
                          authController.currenAssure!.image!,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Text(
                                authController.currenAssure!.prenom,
                                style: const TextStyle(
                                    fontSize: 14, color: kTextColor2),
                              ),
                              const Text(
                                ":الاسم",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: kTextColor2),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text(
                                authController.currenAssure!.nom,
                                style: const TextStyle(
                                    fontSize: 14, color: kTextColor2),
                              ),
                              const Text(
                                ":اللقب",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: kTextColor2),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text(
                                authController.currenAssure!.dateNaissance
                                    .toString()
                                    .substring(0, 10),
                                style: const TextStyle(
                                    fontSize: 14, color: kTextColor2),
                              ),
                              const Text(
                                ":تاريخ الميلاد",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: kTextColor2),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
