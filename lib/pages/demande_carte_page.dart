import 'package:demande_chifa/components/button.dart';
import 'package:demande_chifa/components/drawer.dart';
import 'package:demande_chifa/components/files_sheet.dart';
import 'package:demande_chifa/controllers/demande_controller.dart';
import 'package:demande_chifa/pages/scan_page.dart';
import 'package:demande_chifa/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:u_credit_card/u_credit_card.dart';

class DemandeCartePage extends StatelessWidget {
  final DemandeController demandeController = Get.find<DemandeController>();
  DemandeCartePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: TheDrawer(),
      appBar: AppBar(
        title: const Text('Demande Renouvellement'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: GetBuilder(
              init: demandeController,
              builder: (_) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        ListTile(
                          onTap: () {
                            demandeController.pickIdImage();
                          },
                          title: const Text("Image de carte d'identité"),
                          tileColor: Colors.grey[200],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          trailing: demandeController.idImageBytes != null
                              ? Image.memory(demandeController.idImageBytes!)
                              : const Text("no image choosed"),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ListTile(
                          onTap: () {
                            demandeController.pickAttestationImage();
                          },
                          title: const Text("Image de Attestation"),
                          tileColor: Colors.grey[200],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          trailing:
                              demandeController.attestationImageBytes != null
                                  ? Image.memory(
                                      demandeController.attestationImageBytes!)
                                  : const Text("no image choosed"),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: MyButton(
                          onTap: () {
                            demandeController.createDemande();
                          },
                          text: "Demande",
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
