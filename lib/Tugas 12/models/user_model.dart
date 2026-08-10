class UserModel {
  final int? id;
  final String nama;
  final String email;
  final String noHp;
  final String password;
  final String kota;

  UserModel({
    this.id,
    required this.nama,
    required this.email,
    required this.noHp,
    required this.password,
    required this.kota,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nama': nama,
      'email': email,
      'no_hp': noHp,
      'password': password,
      'kota': kota,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      nama: map['nama'],
      email: map['email'],
      noHp: map['no_hp'],
      password: map['password'],
      kota: map['kota'],
    );
  }
}
