import 'package:demande_chifa/style/colors.dart';
import 'package:flutter/material.dart';



class TextField1 extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController textEditingController;
  const TextField1({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        //labelText: 'Numéro de sécurité sociale',
        labelText: labelText,
        labelStyle: const TextStyle(color: kTextColor2),
        // hintText: 'Entrez votre numéro de sécurité sociale',
        hintText: hintText,

        hintStyle: TextStyle(color: kTextColor2.withOpacity(0.5)),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: kTextColor2),
          borderRadius: BorderRadius.circular(12.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: kTextColor2),
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      style: const TextStyle(color: kTextColor2),
    );
  }
}
