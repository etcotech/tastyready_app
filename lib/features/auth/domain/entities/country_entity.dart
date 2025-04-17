class CountryEntity {
  int? id;
  String? name;
  List<Cities>? cities;

  CountryEntity
  
  
  ({this.id, this.name, this.cities});


}

class Cities {
  int? id;
  int? countryId;
  String? name;
  String? alias;
  String? image;
  String? imageUrl;

  Cities(
      {this.id,
      this.countryId,
      this.name,
      this.alias,
      this.image,
      this.imageUrl});

  Cities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    countryId = json['country_id'];
    name = json['name'];
    alias = json['alias'];
    image = json['image'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['country_id'] = this.countryId;
    data['name'] = this.name;
    data['alias'] = this.alias;
    data['image'] = this.image;
    data['image_url'] = this.imageUrl;
    return data;
  }
}
