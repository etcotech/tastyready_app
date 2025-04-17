import 'package:tastyready_mobile/features/auth/domain/entities/login_sucess_entity.dart';

class LoginSuccessModel extends LoginSucessEntity {
  bool? status;
  String? token;
  int? id;
  String? name;
  String? email;
  String? country;
  String? countryCode;
  String? city;

  LoginSuccessModel(
      {this.status,
      this.token,
      this.id,
      this.name,
      this.email,
      this.country,
      this.countryCode,
      this.city});

  LoginSuccessModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    token = json['token'];
    id = json['id'];
    name = json['name'];
    email = json['email'];
    country = json['country'];
    countryCode = json['country_code'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['token'] = this.token;
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['country'] = this.country;
    data['country_code'] = this.countryCode;
    data['city'] = this.city;
    return data;
  }

  toEntity() {
    return LoginSucessEntity(
      status: this.status,
      token: this.token,
      id: this.id,
      name: this.name,
      email: this.email,
      country: this.country,
      countryCode: this.countryCode,
      city: this.city,
    );
  }
}
