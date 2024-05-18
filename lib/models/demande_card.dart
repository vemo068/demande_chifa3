import 'dart:convert';
import 'dart:typed_data';
import 'package:demande_chifa/models/assure.dart';

class DemandeCard {
  int? id;
  Uint8List photo;
  Uint8List idImg;
  Assure assure;
  String status;
  String? reasonDeRefuse;

  DemandeCard({
    this.id,
    required this.photo,
    required this.idImg,
    required this.assure,
    required this.status,
    this.reasonDeRefuse,
  });

  factory DemandeCard.fromJson(Map<String, dynamic> json) {
    return DemandeCard(
      id: json['id'],
      photo: Uint8List.fromList(base64Decode(json['attestationImg'])),
      idImg: Uint8List.fromList(base64Decode(json['idImg'])),
      assure: Assure.fromJson(json['assure']),
      status: json['status'],
      reasonDeRefuse: json['reasonDeRefuse'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'photo': base64Encode(photo),
      'idImg': base64Encode(idImg),
      'assure': assure.toJson(),
      'status': status,
      'reasonDeRefuse': reasonDeRefuse,
    };
  }
}
