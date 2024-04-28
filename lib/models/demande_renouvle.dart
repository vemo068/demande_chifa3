import 'dart:convert';
import 'dart:typed_data';
import 'package:demande_chifa/models/assure.dart';

class DemandeDeRenouvellement {
  String? id;
  Uint8List attestationImg;
  Uint8List idImg;
  Assure assure;
  String status;
  String? reasonDeRefuse;

  DemandeDeRenouvellement({
    this.id,
    required this.attestationImg,
    required this.idImg,
    required this.assure,
    required this.status,
    this.reasonDeRefuse,
  });

  factory DemandeDeRenouvellement.fromJson(Map<String, dynamic> json) {
    return DemandeDeRenouvellement(
      id: json['id'],
      attestationImg: Uint8List.fromList(base64Decode(json['attestation_img'])),
      idImg: Uint8List.fromList(base64Decode(json['id_img'])),
      assure: Assure.fromJson(json['assure']),
      status: json['status'],
      reasonDeRefuse: json['reason_de_refuse'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'attestation_img': base64Encode(attestationImg),
      'id_img': base64Encode(idImg),
      'assure': assure.toJson(),
      'status': status,
      'reason_de_refuse': reasonDeRefuse,
    };
  }
}
