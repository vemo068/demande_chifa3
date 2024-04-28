import 'dart:convert';
import 'dart:typed_data';

class Assure {
  String? idUser;
  bool isActivated;
  String numAssure;
  String nom;
  String prenom;
  String dateNaissance;
  String password;
  Uint8List image;
  String dateFinDroit;
  int taux;

  Assure({
    this.idUser,
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
      idUser: json['id_user'],
      isActivated: json['isActivated'] ?? false,
      numAssure: json['numAssure'] ?? '',
      nom: json['nom'] ?? '',
      prenom: json['prenom'] ?? '',
      dateNaissance: json['dateNaissance'] ?? '',
      password: json['password'] ?? '',
      image: Uint8List.fromList(base64Decode(json['image'])),
      dateFinDroit: json['dateFinDroit'] ?? '',
      taux: json['taux'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_user': idUser,
      'isActivated': isActivated,
      'numAssure': numAssure,
      'nom': nom,
      'prenom': prenom,
      'dateNaissance': dateNaissance,
      'password': password,
      'image': image,
      'dateFinDroit': dateFinDroit,
      'taux': taux,
    };
  }
}
