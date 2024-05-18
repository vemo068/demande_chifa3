import 'dart:convert';
import 'dart:typed_data';
import 'package:demande_chifa/api/links.dart';
import 'package:demande_chifa/models/demande_card.dart';
import 'package:http/http.dart' as http;

class HttpDemandeCarteService {
  static Future<DemandeCard> createDemandeCard({
    required Uint8List photo,
    required Uint8List idImg,
    required int assureid,
    required String status,
  }) async {
    final response = await http.post(
      Uri.parse(createCarteDemandeUrl),
      //  body: demandeDeRenouvellement.toJson(),

      body: {
        'status': status,
        'photo': base64Encode(photo),
        'idImg': base64Encode(idImg),
        'assureid': assureid.toString(),
      },
    );

    if (response.statusCode == 200) {
      var bdy = await json.decode(response.body);
      return DemandeCard.fromJson(bdy);
    } else {
      throw Exception('Failed to create demande de carte');
    }
  }
}
