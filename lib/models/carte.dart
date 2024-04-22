import 'package:demande_chifa/models/assure.dart';
class Carte {
  String? id_carte;
  String img;
  String date_fin_droit;
  int taux;
  Assure assure;

  Carte({
    this.id_carte,
    required this.img,
    required this.date_fin_droit,
    required this.taux,
    required this.assure,
  });

  factory Carte.fromJson(Map<String, dynamic> json) {
    return Carte(
      id_carte: json['id_carte'],
      img: json['img'],
      date_fin_droit: json['date_fin_droit'],
      taux: json['taux'],
      assure: Assure.fromJson(json['assure']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'img': img,
      'date_fin_droit': date_fin_droit,
      'taux': taux,
      'assure': assure.toJson(),
    };
    if (id_carte != null) {
      data['id_carte'] = id_carte;
    }
    return data;
  }

  // Other necessary functions can be added here as per requirement
}
