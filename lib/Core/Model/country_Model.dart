class CountryModel {
  String? id;
  String? name;
  String? imageUrl;
  String? capital;
  String? details;

  CountryModel(
      {this.id,
        this.name,
        this.imageUrl,
      this.capital,
        this.details,
      });

  CountryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageUrl = json['imageUrl'];
    capital=json['capital'];
    details=json['details'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['imageUrl'] = imageUrl;
    data['capital']=capital;
    data['details']=details;
    return data;
  }
}

class CountryList{
  List<CountryModel> countries;

  CountryList({
    required this.countries
  });
  factory CountryList.fromJson(List<dynamic> data){
    List<CountryModel> countryList=[];
    countryList =
        data.map((element) {
          return CountryModel.fromJson(Map<String,dynamic>.from(element));
        }).toList();
    return CountryList(countries: countryList);
  }
}