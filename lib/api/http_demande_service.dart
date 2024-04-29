import 'dart:convert';
import 'dart:typed_data';
import 'package:demande_chifa/api/links.dart';
import 'package:demande_chifa/models/assure.dart';
import 'package:http/http.dart' as http;
import 'package:demande_chifa/models/demande_renouvle.dart';

class HttpDemandeService {
  Future<List<DemandeDeRenouvellement>> getAllDemandesDeRenouvellement() async {
    final response = await http.get(Uri.parse(getDemandesUrl));

    if (response.statusCode == 200) {
      Iterable data = jsonDecode(response.body);
      List<DemandeDeRenouvellement> demandes =
          List<DemandeDeRenouvellement>.from(
              data.map((model) => DemandeDeRenouvellement.fromJson(model)));
      return demandes;
    } else {
      throw Exception('Failed to load demandes de renouvellement');
    }
  }

  static Future<DemandeDeRenouvellement?> createDemandeDeRenouvellement(
      {required Uint8List attestationImg,
      required idImg,
      required int assureid,
      required String status}) async {
//{required Uint8List attestationImg,required idImg,required Assure assure, required String status}
    final response = await http.post(
      Uri.parse(createDemandeUrl),
      //  body: demandeDeRenouvellement.toJson(),

      body: {
        'attestationImg': base64Encode(attestationImg),
        'idImg': base64Encode(idImg),
        'assureid': assureid.toString(),
        'status': status,
      },
    );

    if (response.statusCode == 201) {
      var bdy = await json.decode(response.body);
      return DemandeDeRenouvellement.fromJson(bdy);
    } else {
      throw Exception('Failed to create demande de renouvellement');
    }
  }
}
