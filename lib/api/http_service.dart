import 'dart:convert';
import 'package:demande_chifa/api/links.dart';
import 'package:http/http.dart' as http;

class HttpService {
 


  static Future<bool> activateAccount(String numAssure, String password) async {
    final response = await http.post(
      Uri.parse('$accountActivationUrl'),
      body: {
        'numAssure': numAssure,
        'password': password,
      },
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to activate account');
    }
  }

  static Future<bool> login(String numAssure, String password) async {
    final response = await http.post(
      Uri.parse('$loginUrl'),
      body: {
        'numAssure': numAssure,
        'password': password,
      },
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
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
      // If the response body is 'true', return true; otherwise, return false
      return response.body.trim().toLowerCase() == 'true';
    } else if (response.statusCode == 404) {
      // If the response status code is 404, return null (no record found)
      return null;
    } else {
      throw Exception('Failed to check activation');
    }
  }
}
