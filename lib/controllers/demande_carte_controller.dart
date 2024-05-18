import 'dart:io';
import 'dart:typed_data';

import 'package:demande_chifa/api/http_demande_carte_service.dart';
import 'package:demande_chifa/controllers/auth_controller.dart';
import 'package:demande_chifa/models/demande_card.dart';
import 'package:demande_chifa/pages/home_page.dart';
import 'package:demande_chifa/style/colors.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DemandeCarteController extends GetxController {
  final AuthController _authController = Get.find<AuthController>();

  Uint8List? idImageBytes;
  Uint8List? photoBytes;

  Future<void> pickIdImage() async {
    try {
      // Pick a single file
      var file = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: [
          'jpg',
          'jpeg',
          'png'
        ], // Add more extensions if needed
      );

      if (file != null && file.files.isNotEmpty) {
        // Get the path of the picked file
        String path = file.files.first.path!;
        // Read the file as bytes
        File imageFile = File(path);
        List<int> bytes = await imageFile.readAsBytes();
        idImageBytes = Uint8List.fromList(bytes);
        print("::::::: $bytes");
        update();
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  Future<void> pickphoto() async {
    try {
      // Pick a single file
      var file = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: [
          'jpg',
          'jpeg',
          'png'
        ], // Add more extensions if needed
      );

      if (file != null && file.files.isNotEmpty) {
        // Get the path of the picked file
        String path = file.files.first.path!;
        // Read the file as bytes
        File imageFile = File(path);
        List<int> bytes = await imageFile.readAsBytes();
        photoBytes = Uint8List.fromList(bytes);
        print("::::::: $bytes");
        update();
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  Future<void> createDemande() async {
    // DemandeDeRenouvellement? d = await HttpDemandeService()
    //     .createDemandeDeRenouvellement(DemandeDeRenouvellement(
    //         attestationImg: attestationImageBytes!,
    //         idImg: idImageBytes!,
    //         assure: _authController.currenAssure!,
    //         status: "status"));
    DemandeCard? d = await HttpDemandeCarteService.createDemandeCard(
        photo: photoBytes!,
        idImg: idImageBytes!,
        assureid: _authController.currenAssure!.idUser!,
        status: "status");
    Get.snackbar(
      "Demande Created",
      "message",
      colorText: kTextColor2,
      backgroundColor: kBackgroundColor,
    );
    Get.offAll(
      () => HomePage(),
    );
  }
}
