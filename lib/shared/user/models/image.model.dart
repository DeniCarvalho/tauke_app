import 'dart:convert';

class Img {
  String? small;
  String? medium;
  String? large;
  Img({
    this.small,
    this.medium,
    this.large,
  });

  Img copyWith({
    String? small,
    String? medium,
    String? large,
  }) {
    return Img(
      small: small ?? this.small,
      medium: medium ?? this.medium,
      large: large ?? this.large,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'small': small,
      'medium': medium,
      'large': large,
    };
  }

  factory Img.fromMap(Map<String, dynamic> map) {
    return Img(
      small: map['small'] != null ? map['small'] as String : null,
      medium: map['medium'] != null ? map['medium'] as String : null,
      large: map['large'] != null ? map['large'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Img.fromJson(String source) =>
      Img.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Img(small: $small, medium: $medium, large: $large)';

  @override
  bool operator ==(covariant Img other) {
    if (identical(this, other)) return true;

    return other.small == small &&
        other.medium == medium &&
        other.large == large;
  }

  @override
  int get hashCode => small.hashCode ^ medium.hashCode ^ large.hashCode;
}
