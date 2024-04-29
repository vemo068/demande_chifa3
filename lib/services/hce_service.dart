import 'package:flutter/services.dart';

const MethodChannel _channel = MethodChannel('com.example.my_flutter_app/hce');

class HceService {
  static Future<void> sendJsonData(Map<String, dynamic> jsonData) async {
    try {
      await _channel.invokeMethod('sendJsonData', jsonData);
    } on PlatformException catch (e) {
      print("Failed to send JSON data: '${e.message}'.");
    }
  }


 
}
