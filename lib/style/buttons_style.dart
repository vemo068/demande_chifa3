import 'package:flutter/material.dart';

ButtonStyle kOutlinedButtonStyle = ButtonStyle(
                side: MaterialStateProperty.resolveWith(
                  (states) => const BorderSide(
                    color: Colors.blue,
                    width: 2.0,
                  ), // Border color and width
                ),
                padding: MaterialStateProperty.all(const EdgeInsets.all(16.0)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0), // Border radius
                  ),
                ),
              );