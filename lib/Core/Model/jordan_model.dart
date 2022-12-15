class JordanModel{
  String? id;
  String? name;
  String? image;
  String? info;
  String? king;

  JordanModel(
      {this.id,
        this.name,
        this.image,
        this.info,
        this.king,
      });

  JordanModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    info=json['info'];
    king=json['king'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['info']=info;
    data['king']=king;
    return data;
  }
}

class JordanList{
  List<JordanModel> jordan;

  JordanList({
    required this.jordan
  });
  factory JordanList.fromJson(List<dynamic> data){
    List<JordanModel> jordanList=[];
    jordanList =
        data.map((element) {
          return JordanModel.fromJson(Map<String,dynamic>.from(element));
        }).toList();
    return JordanList(jordan: jordanList);
  }
}