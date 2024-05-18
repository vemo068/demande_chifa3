import 'package:demande_chifa/components/button.dart';
import 'package:demande_chifa/pages/demande_carte_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoCardMessage extends StatelessWidget {
  const NoCardMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "You don't have a card",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.red, // Example color
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 25,
          ),
          MyButton(
            onTap: () {
              Get.to(() => DemandeCartePage());
            },
            text: 'Obtenir une carte',
          ),
        ],
      ),
    );
  }
}
