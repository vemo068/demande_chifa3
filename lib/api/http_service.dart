import 'dart:convert';
import 'dart:typed_data';
import 'package:demande_chifa/api/links.dart';
import 'package:demande_chifa/models/assure.dart';
import 'package:http/http.dart' as http;

class HttpService {
  static Future<Assure?> activateAccount(
      String numAssure, String password, Uint8List image) async {
    Map<String, dynamic> reqBody = {
      'numAssure': numAssure,
      'password': password,
      'image': base64Encode(image),
    };
    print(jsonEncode(reqBody));
    final response = await http.post(
      Uri.parse(accountActivationUrl),
      // headers: <String, String>{
      //   'Content-Type': 'application/json; charset=UTF-8',
      // },
      body: {
        'numAssure': numAssure,
        'password': password,
        'image': base64Encode(image),
      },
    );
    if (response.statusCode == 200) {
      var body = await json.decode(response.body);
      return Assure.fromJson(body);
    } else {
      return null;
    }
  }

  static Future<Assure?> login(String numAssure, String password) async {
    final response = await http.post(
      Uri.parse(loginUrl),
      body: {
        'numAssure': numAssure,
        'password': password,
      },
    );
    if (response.statusCode == 200) {
      String body = response.body;
      if (body == "") {
        return null;
      } else {
        var bdy = await json.decode(response.body);
        return Assure.fromJson(bdy);
      }
    }
    return null;
  }

  static Future<bool?> checkActivation(String numAssure) async {
    final response = await http.post(
      Uri.parse(checkActivationUrl),
      body: {
        'numAssure': numAssure,
      },
    );
    if (response.statusCode == 200) {
      String body = response.body;
      if (body == "") {
        return null;
      } else {
        bool result = jsonDecode(body);
        return result;
      }
    }
    return null;
  }
}
