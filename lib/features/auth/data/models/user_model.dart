import 'package:tastyready_mobile/features/auth/domain/entities/user_entitiy.dart';

class UserModelModel  extends UserEntity{
  String? name;
  String? email;
  String? phone;
  String? country;
  String? countryCode;
  String? city;

  UserModelModel(
      {this.name,
      this.email,
      this.phone,
      this.country,
      this.countryCode,
      this.city});

  UserModelModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    country = json['country'];
    countryCode = json['country_code'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['country'] = this.country;
    data['country_code'] = this.countryCode;
    data['city'] = this.city;
    return data;
  }

  toEntity () {
    return UserEntity(
      name: name,
      email: email,
      phone: phone,
      country: country,
      countryCode: countryCode,
      city: city,
    );
  }
}
