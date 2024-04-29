import 'package:demande_chifa/controllers/auth_controller.dart';
import 'package:demande_chifa/pages/card_page.dart';
import 'package:demande_chifa/pages/demande_carte_page.dart';
import 'package:demande_chifa/pages/home_page.dart';
import 'package:demande_chifa/pages/profile_page.dart';
import 'package:demande_chifa/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TheDrawer extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();
  TheDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: SingleChildScrollView(
      child: Column(
        children: [
          const DrawerHeader(
            padding: EdgeInsets.all(0),
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.hub_rounded,
                      color: kMainColor,
                      size: 60,
                    ),
                  ],
                ),
              ),
            ),
          ),
          DropdownMenuItem(
            child: ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Accueil"),
              onTap: () {
                Get.offAll(() => HomePage());
              },
            ),
          ),
          DropdownMenuItem(
            child: ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Profile"),
              onTap: () {
                Get.offAll(() => ProfilePage());
              },
            ),
          ),
          DropdownMenuItem(
            child: ListTile(
              leading: const Icon(Icons.credit_card),
              title: const Text("Carte"),
              onTap: () {
                Get.offAll(() => const CardPage());
              },
            ),
          ),
          DropdownMenuItem(
            child: ListTile(
              leading: const Icon(Icons.add_card_rounded),
              title: const Text("Demande Renouvellement"),
              onTap: () {
                Get.offAll(() => DemandeCartePage());
              },
            ),
          ),
          GetBuilder(
              init: authController,
              builder: (_) {
                return DropdownMenuItem(
                  child: ListTile(
                    leading: const Icon(Icons.logout),
                    title: const Text("Logout"),
                    onTap: () {
                      authController.logout();
                    },
                  ),
                );
              }),
        ],
      ),
    ));
  }
}
