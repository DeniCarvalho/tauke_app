import 'dart:convert';

import 'image.model.dart';

class User {
  String? id;
  String? phone;
  String? name;
  Img? img;
  User({
    this.id,
    this.phone,
    this.name,
    this.img,
  });

  User copyWith({
    String? id,
    String? phone,
    String? name,
    Img? img,
  }) {
    return User(
      id: id ?? this.id,
      phone: phone ?? this.phone,
      name: name ?? this.name,
      img: img ?? this.img,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'phone': phone,
      'name': name,
      'img': img?.toMap(),
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] != null ? map['id'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      img: map['img'] != null
          ? Img.fromMap(map['img'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, phone: $phone, name: $name, img: $img)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.phone == phone &&
        other.name == name &&
        other.img == img;
  }

  @override
  int get hashCode {
    return id.hashCode ^ phone.hashCode ^ name.hashCode ^ img.hashCode;
  }
}
