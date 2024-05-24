import 'package:demande_chifa/components/button.dart';
import 'package:demande_chifa/components/drawer.dart';
import 'package:demande_chifa/controllers/demande_carte_controller.dart';
import 'package:demande_chifa/controllers/demande_reno_controller.dart';
import 'package:demande_chifa/style/colors.dart';
import 'package:demande_chifa/style/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DemandeCartePage extends StatelessWidget {
  final DemandeCarteController demandeCarteController =
      Get.find<DemandeCarteController>();
  DemandeCartePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: TheDrawer(),
      appBar: AppBar(
        title: const Text(ktext_demande_carte_page),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: GetBuilder(
              init: demandeCarteController,
              builder: (_) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        ListTile(
                          onTap: () {
                            demandeCarteController.pickIdImage();
                          },
                          title: const Text(ktext_image_carte_identite),
                          tileColor: Colors.grey[200],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          trailing: demandeCarteController.idImageBytes != null
                              ? Image.memory(
                                  demandeCarteController.idImageBytes!)
                              : const Text(ktext_no_image_message),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ListTile(
                          onTap: () {
                            demandeCarteController.pickphoto();
                          },
                          title: const Text(
                              ktext_image_personnelle_demande_carte_page),
                          tileColor: Colors.grey[200],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          trailing: demandeCarteController.photoBytes != null
                              ? Image.memory(demandeCarteController.photoBytes!)
                              : const Text(ktext_no_image_message),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: MyButton(
                          onTap: () {
                            demandeCarteController.createDemande();
                          },
                          text: ktext_btn_demande,
                          color: kTextColor2),
                    )
                  ],
                );
              }),
        ),
      ),
    );
  }
}
