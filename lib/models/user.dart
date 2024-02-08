import 'dart:convert';

class User {
  User({
    this.id,
    required this.name,
    required this.email,
    required this.address,
    required this.phone,
    required this.photo
  });
  String? id;
  String address;
  String email;
  String name;
  String phone;
  String photo;

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        email: json["email"],
        address: json["address"],
        name: json["name"],
        phone: json["phone"],
        photo: json["photo"]
      );

  Map<String, dynamic> toMap() => {
        "address": address,
        "email": email,
        "name": name,
        "phone": phone,
        "photo": photo
      };

  User copy() => User(address: address, email: email, name: name, phone: phone, photo: photo, id: id);
}
