import 'package:demande_chifa/components/button.dart';
import 'package:demande_chifa/components/drawer.dart';
import 'package:demande_chifa/pages/scan_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:u_credit_card/u_credit_card.dart';

class DemandeCartePage extends StatelessWidget {
  const DemandeCartePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: TheDrawer(),
      appBar: AppBar(
        title: const Text('Demande V_CHIFA'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // ChifaCard(),
            const CreditCardUi(
              cardHolderFullName: 'John Doe',
              cardNumber: '1234567812378',
              validThru: '10/24',
              cardType: CardType.other,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: MyButton(
                  onTap: () {
                    Get.to(() => const ScanPage());
                  },
                  text: "Demande",
                  color: Colors.blue[900]!),
            )
          ],
        ),
      ),
    );
  }
}
