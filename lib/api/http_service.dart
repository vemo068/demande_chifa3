import 'dart:convert';
import 'package:demande_chifa/api/links.dart';
import 'package:demande_chifa/models/assure.dart';
import 'package:http/http.dart' as http;

class HttpService {
  static Future<Assure?> activateAccount(
      String numAssure, String password) async {
    final response = await http.post(
      Uri.parse('$accountActivationUrl'),
      body: {
        'numAssure': numAssure,
        'password': password,
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
      Uri.parse('$loginUrl'),
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
  }

  static Future<bool?> checkActivation(String numAssure) async {
    final response = await http.post(
      Uri.parse('$checkActivationUrl'),
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
  }
}
