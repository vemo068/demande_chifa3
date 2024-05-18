import 'dart:convert';
import 'dart:typed_data';

class Assure {
  int? idUser;
  bool isActivated;
  bool cardActivated;
  String numAssure;
  String nom;
  String prenom;
  DateTime dateNaissance;
  String password;
  Uint8List? image;
  DateTime dateFinDroit;
  int taux;

  Assure({
    this.idUser,
    required this.cardActivated,
    required this.isActivated,
    required this.numAssure,
    required this.nom,
    required this.prenom,
    required this.dateNaissance,
    required this.password,
    required this.image,
    required this.dateFinDroit,
    required this.taux,
  });

  factory Assure.fromJson(Map<String, dynamic> json) {
    return Assure(
      idUser: json['idUser'],
      isActivated: json['activated'] ?? false,
      cardActivated: json['cardActivated'],
      numAssure: json['numAssure'] ?? '',
      nom: json['nom'] ?? '',
      prenom: json['prenom'] ?? '',
      dateNaissance: DateTime.parse(json['dateNaissance']),
      password: json['password'] ?? '',
      image: json['image'] != null
          ? Uint8List.fromList(base64Decode(json['image']))
          : null,
      dateFinDroit: DateTime.parse(json['dateFinDroit']),
      taux: json['taux'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idUser': idUser,
      'activated': isActivated,
      'cardActivated': cardActivated,
      'numAssure': numAssure,
      'nom': nom,
      'prenom': prenom,
      'dateNaissance': dateNaissance.toIso8601String(),
      'password': password,
      'image': base64Encode(image!),
      'dateFinDroit': dateFinDroit.toIso8601String(),
      'taux': taux,
    };
  }
}
