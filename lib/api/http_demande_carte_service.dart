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


static Future<List<DemandeCard>> fetchCardDemandsByAssureId(int assureId) async {
    final response = await http.get(Uri.parse('$getAllCardDemandsByAssureId$assureId'));

    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      List<DemandeCard> demandes = body.map((dynamic item) => DemandeCard.fromJson(item)).toList();
      return demandes;
    } else {
      throw Exception('Failed to load card demands');
    }
  }



static Future<List<DemandeCard>> fetchNotDoneCardDemandsByAssureId(int assureId) async {
    final response = await http.get(Uri.parse('$getNotDoneCardDemandsByAssureId$assureId'));

    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      List<DemandeCard> demandes = body.map((dynamic item) => DemandeCard.fromJson(item)).toList();
      return demandes;
    } else {
      throw Exception('Failed to load not done card demands');
    }
  }


}
