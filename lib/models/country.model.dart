class CountryModel {
  late String name;
  late String code;
  late String ddi;
  String? phoneMask;

  CountryModel({
    required this.name,
    required this.code,
    required this.ddi,
    this.phoneMask,
  });

  CountryModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    code = json['code'];
    ddi = json['dial_code'];
    phoneMask = json['phoneMask'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['code'] = code;
    data['ddi'] = ddi;
    data['phoneMask'] = phoneMask;
    return data;
  }
}
