import 'dart:convert';
import 'dart:typed_data';
import 'package:demande_chifa/models/assure.dart';

class DemandeDeRenouvellement {
  int? id;
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
      attestationImg: Uint8List.fromList(base64Decode(json['attestationImg'])),
      idImg: Uint8List.fromList(base64Decode(json['idImg'])),
      assure: Assure.fromJson(json['assure']),
      status: json['status'],
      reasonDeRefuse: json['reasonDeRefuse'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'attestationImg': base64Encode(attestationImg),
      'idImg': base64Encode(idImg),
      'assure': assure.toJson(),
      'status': status,
      'reasonDeRefuse': reasonDeRefuse,
    };
  }
}
