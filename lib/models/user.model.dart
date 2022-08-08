class UserModel {
  late String id;
  late String ddi;
  late String phone;
  late String name;
  Img? img;

  UserModel({
    required this.id,
    required this.ddi,
    required this.phone,
    required this.name,
    this.img,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ddi = json['ddi'];
    phone = json['phone'];
    name = json['name'];
    img = json['img'] != null ? Img.fromJson(json['img']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['ddi'] = ddi;
    data['phone'] = phone;
    data['name'] = name;
    if (img != null) {
      data['img'] = img!.toJson();
    }
    return data;
  }
}

class Img {
  String? small;
  String? medium;
  String? large;

  Img({this.small, this.medium, this.large});

  Img.fromJson(Map<String, dynamic> json) {
    small = json['small'];
    medium = json['medium'];
    large = json['large'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['small'] = small;
    data['medium'] = medium;
    data['large'] = large;
    return data;
  }
}
