import 'package:demande_chifa/components/button.dart';
import 'package:demande_chifa/components/drawer.dart';
import 'package:demande_chifa/components/files_sheet.dart';
import 'package:demande_chifa/controllers/demande_reno_controller.dart';
import 'package:demande_chifa/pages/scan_page.dart';
import 'package:demande_chifa/style/colors.dart';
import 'package:demande_chifa/style/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:u_credit_card/u_credit_card.dart';

class DemandeRenouvellementPage extends StatelessWidget {
  final DemandeRenoController demandeController =
      Get.find<DemandeRenoController>();
  DemandeRenouvellementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: TheDrawer(),
      appBar: AppBar(
        title: const Text(ktext_demande_renouvellement_page_title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: GetBuilder(
              init: demandeController,
              builder: (_) {
                return demandeController.checkDateFinDroit()?const Text(
                       ktext_have_right_message,
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 18,
                        ),
                      ) :demandeController.checkIfHasNotDoneDemandes()
                        ? const Text(
                            ktext_demand_in_progress,
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 18,
                            ),
                          ): Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        ListTile(
                          onTap: () {
                            demandeController.pickIdImage();
                          },
                          title: const Text(ktext_image_carte_identite),
                          tileColor: Colors.grey[200],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          trailing: demandeController.idImageBytes != null
                              ? Image.memory(demandeController.idImageBytes!)
                              : const Text(ktext_no_image_message),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ListTile(
                          onTap: () {
                            demandeController.pickAttestationImage();
                          },
                          title: const Text(
                              ktext_image_attestation_demande_renouvellement_page),
                          tileColor: Colors.grey[200],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          trailing:
                              demandeController.attestationImageBytes != null
                                  ? Image.memory(
                                      demandeController.attestationImageBytes!)
                                  : const Text(ktext_no_image_message),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: MyButton(
                          onTap: () {
                            demandeController.createDemande();
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
