import 'package:tastyready_mobile/features/auth/domain/entities/city_entity.dart';

class CityModel {
  int? id;
  String? name;
  String? alias;
  String? image;
  String? imageUrl;

  CityModel({this.id, this.name, this.alias, this.image, this.imageUrl});

  CityModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    alias = json['alias'];
    image = json['image'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['alias'] = this.alias;
    data['image'] = this.image;
    data['image_url'] = this.imageUrl;
    return data;
  }
  toEntity() {
    return CityEntity(
      id: id,
      name: name,
      alias: alias,
      image: image,
      imageUrl: imageUrl,
    );
  }
}
