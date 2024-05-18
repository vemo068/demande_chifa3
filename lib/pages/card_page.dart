import 'dart:typed_data';

import 'package:demande_chifa/components/button.dart';
import 'package:demande_chifa/components/chifa_card.dart';
import 'package:demande_chifa/components/drawer.dart';
import 'package:demande_chifa/components/expired_card_message.dart';
import 'package:demande_chifa/components/no_card_message.dart';
import 'package:demande_chifa/controllers/auth_controller.dart';
import 'package:demande_chifa/services/hce_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:u_credit_card/u_credit_card.dart';

class CardPage extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();
  CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: TheDrawer(),
      appBar: AppBar(
        title: const Text('Credit Card'),
      ),
      body: GetBuilder(
          init: authController,
          builder: (_) {
            return authController.currenAssure!.cardActivated == false
                ? const NoCardMessage()
                : authController.currenAssure!.dateFinDroit
                        .isBefore(DateTime.now())
                    ? const ExpiredCardMessage()
                    : Center(
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
                            MyButton(
                                onTap: () {
                                  // _emulateNFC();
                                  // emulateNfcTag("hellloo");
                                  sendDataToAndroid();
                                  // _sendDataViaNFC({
                                  //   "name": "aymen",
                                  //   "age": 15,
                                  // });
                                },
                                text: "Share Data")
                          ],
                        ),
                      );
          }),
    );
  }
}

void _emulateNFC() {
  // Call platform-specific code for NFC tag emulation

  try {
    const MethodChannel('com.example.demande_chifa3')
        .invokeMethod('emulateNFC');
  } catch (e) {
    print("Failed to emulate NFC tag: $e");
  }
}

void emulateNfcTag(String text) async {
  const platform = MethodChannel('com.example.demande_chifa3');
  try {
    await platform.invokeMethod('emulateNfcTag', text);
  } on PlatformException catch (e) {
    print("Failed to emulate NFC tag: ${e.message}");
  }
}

void sendDataToAndroid() async {
  const platform = MethodChannel('com.example.demande_chifa3');
  try {
    await platform.invokeMethod('sendData');
  } on PlatformException catch (e) {
    print("Failed to send data to Android: ${e.message}");
  }
}

Future<void> _sendDataViaNFC(Map<String, dynamic> data) async {
  const platform = MethodChannel("com.example.demande_chifa3");
  try {
    await platform.invokeMethod('sendData', data);
  } on PlatformException catch (e) {
    print("Failed to send data via NFC: '${e.message}'.");
  }
}


// void _startNFCWriting() async {
//   try {
// //check if NFC is available on the device or not.
//     bool isAvailable = await NfcManager.instance.isAvailable();

// // If NFC is available, start a session to listen for NFC tags.
//     if (isAvailable) {
//       NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
//         try {
// // When an NFC tag is discovered, we check if it supports NDEF technology.
//           NdefMessage message =
//               NdefMessage([NdefRecord.createText('Hello, NFC!')]);
//           await Ndef.from(tag)?.write(
//               message); //If it supports NDEF, create an NDEF message and write it to the tag.
//           debugPrint('Data emitted successfully');
//           Uint8List payload = message.records.first.payload;
//           String text = String.fromCharCodes(payload);
//           print('ddddd');
//           debugPrint("Written data: $text");

// //stop the NFC Session
//           NfcManager.instance.stopSession();
//         } catch (e) {
//           debugPrint('Error emitting NFC data: $e');
//         }
//       });
//     } else {
//       debugPrint('NFC not available.');
//     }
//   } catch (e) {
//     debugPrint('Error writing to NFC: $e');
//   }
// }
