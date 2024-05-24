import 'package:demande_chifa/components/drawer.dart';
import 'package:demande_chifa/controllers/auth_controller.dart';
import 'package:demande_chifa/controllers/home_controller.dart';
import 'package:demande_chifa/style/colors.dart';
import 'package:demande_chifa/style/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomePage extends StatelessWidget {
  final HomeController homeController = Get.find<HomeController>();
  final AuthController authController = Get.find<AuthController>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  HomePage({super.key});

  @override
  Widget build(BuildContext contxt) {
    return GetBuilder(
        init: homeController,
        builder: (_) {
          // homeController.getScreenDimension(contxt);
          return SafeArea(
            child: Scaffold(
              drawer: TheDrawer(),
              key: _scaffoldKey,
              backgroundColor: Colors.grey.shade100,
              body: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: kTextColor2,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.menu,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            _scaffoldKey.currentState!.openDrawer();
                          },
                        ),
                        GetBuilder(
                            init: authController,
                            builder: (_) {
                              return Column(
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    home_page_text,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    "${authController.currenAssure!.nom} ${authController.currenAssure!.prenom}",
                                    style: const TextStyle(color: Colors.white),
                                  )
                                ],
                              );
                            }),
                        IconButton(
                          icon: const Icon(
                            Icons.notifications,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
