// import 'package:demande_chifa/controllers/demande_controller.dart';
// import 'package:demande_chifa/style/buttons_style.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class FilesSheet extends StatelessWidget {
//   FilesSheet({
//     super.key,
//   });

//   final DemandeController demandeController = Get.find<DemandeController>();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 500,
//       decoration: const BoxDecoration(color: Colors.white),
//       child: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             OutlinedButton(
//               style: kOutlinedButtonStyle,
//               onPressed: () => demandeController.selectFile("photo"),
//               child: Obx(() => Text(demandeController.photoPath.value)),
//             ),
//             OutlinedButton(
//               style: kOutlinedButtonStyle,
//               onPressed: () => demandeController.selectFile("id"),
//               child: Obx(() => Text(demandeController.idPath.value)),
//             ),
//             OutlinedButton(
//               style: kOutlinedButtonStyle,
//               onPressed: () => demandeController.selectFile("document"),
//               child: Obx(
//                 () => Text(demandeController.documentPath.value),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
