class Assure {
  String? idUser;
  bool isActivated;
  String numAssure;
  String nom;
  String prenom;
  String dateNaissance;
  String password;
  String img;
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
    required this.img,
    required this.dateFinDroit,
    required this.taux,
  });

  factory Assure.fromJson(Map<String, dynamic> json) {
    return Assure(
      idUser: json['id_user'],
      isActivated: json['isActivated'] ?? false,
      numAssure: json['num_Assure'] ?? '',
      nom: json['nom'] ?? '',
      prenom: json['prenom'] ?? '',
      dateNaissance: json['date_nai'] ?? '',
      password: json['password'] ?? '',
      img: json['img'] ?? '',
      dateFinDroit: json['date_fin_droit'] ?? '',
      taux: json['taux'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_user': idUser,
      'isActivated': isActivated,
      'num_Assure': numAssure,
      'nom': nom,
      'prenom': prenom,
      'date_nai': dateNaissance,
      'password': password,
      'img': img,
      'date_fin_droit': dateFinDroit,
      'taux': taux,
    };
  }
}
