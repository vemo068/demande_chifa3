import 'dart:io';

import 'package:demande_chifa/models/assure.dart';
import 'package:demande_chifa/services/files_json_service.dart';
import 'package:file_picker/file_picker.dart';

class DemandeCarte {
  String? id;
  String status;
  File attestation_img;
  File assure_img;
  File id_img;
  Assure assure;

  DemandeCarte({
    this.id,
    required this.status,
    required this.attestation_img,
    required this.assure_img,
    required this.id_img,
    required this.assure,
  });
// TODO: require fix
  factory DemandeCarte.fromJson(Map<String, dynamic> json) {
    return DemandeCarte(
      id: json['id'],
      status:json['status'] ,
      attestation_img: (json['attestation_img']),
      assure_img: (json['assure_img']),
      id_img: (json['id_img']),
      assure: Assure.fromJson(json['assure']),
    );
  }
// TODO: require fix
  Future<Map<String, dynamic>> toJson() async{
    final Map<String, dynamic> data = {
      'attestation_img':attestation_img,
      'assure_img': assure_img,
      'id_img': id_img,
      'assure': assure.toJson(),
    };
    if (id != null) {
      data['id'] = id;
    }
    return data;
  }

  // Other necessary functions can be added here as per requirement
}
