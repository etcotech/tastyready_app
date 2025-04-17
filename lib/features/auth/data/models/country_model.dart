import 'package:tastyready_mobile/features/auth/domain/entities/country_entity.dart';

class CountryModel extends CountryEntity {
  @override
  int ? id;
  @override
  String ? name;
  @override
  List<Cities> ? cities;
  CountryModel({this.id, this.name, this.cities});
  CountryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['cities'] != null) {
      cities = <Cities>[];
      json['cities'].forEach((v) {
        cities!.add(new Cities.fromJson(v));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.cities != null) {
      data['cities'] = this.cities!.map((v) => v.toJson()).toList();
    }
    return data;
  }
  toEntity() {
    return CountryEntity(
      id: id,
      name: name,
      cities: cities,
    );
  }
  
}