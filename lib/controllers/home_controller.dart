import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  

  double screen_width = 0;
  double screen_height = 0;

  void getScreenDimension(BuildContext context) {
    screen_height = MediaQuery.of(context).size.height;
    screen_width = MediaQuery.of(context).size.width;
    update();
  }
}
