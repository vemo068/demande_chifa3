class Assure {
  String? id_user;
  String num_Assure;
  String nom;
  String prenom;
  String date_nai;
  String password;

  Assure({
    this.id_user,
    required this.num_Assure,
    required this.nom,
    required this.prenom,
    required this.date_nai,
    required this.password,
  });

  factory Assure.fromJson(Map<String, dynamic> json) {
    return Assure(
      id_user: json['id_user'],
      num_Assure: json['num_Assure'],
      nom: json['nom'],
      prenom: json['prenom'],
      date_nai: json['date_nai'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'num_Assure': num_Assure,
      'nom': nom,
      'prenom': prenom,
      'date_nai': date_nai,
      'password': password,
    };
    if (id_user != null) {
      data['id_user'] = id_user;
    }
    return data;
  }

  // Other necessary functions can be added here as per requirement
}
