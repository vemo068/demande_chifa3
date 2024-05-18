import 'package:demande_chifa/components/button.dart';
import 'package:demande_chifa/pages/demande_renouvellement_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExpiredCardMessage extends StatelessWidget {
  const ExpiredCardMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Your card is expired",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.red, // Example color
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 25,
          ),
          MyButton(
            onTap: () {
              Get.to(()=>DemandeRenouvellementPage());
            },
            text: 'Demande Renouvellement',
          ),
        ],
      ),
    );
  }
}