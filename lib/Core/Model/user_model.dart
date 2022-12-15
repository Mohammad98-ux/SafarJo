import 'dart:developer';

class UserModel {
  String? uid;
  String? name;
  String? email;
  String? password;
  bool? loginState;
  bool? state;
  String? imageUrl;
  Role? role;


  UserModel.empty();
  UserModel(
      {this.uid,
        this.name,
        this.email,
        this.password,
        this.loginState,
        this.state,
        this.imageUrl,
        this.role,
      });

  UserModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    loginState = json['loginState'];
    state = json['state'];
    imageUrl = json['imageUrl'];
    role = json['role'] != null ? Role.fromJson(json['role']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['loginState'] = loginState;
    data['state'] = state;
    data['imageUrl'] = imageUrl;
    if (role != null) {
      data['role'] = role!.toJson();
    }
    return data;
  }
}

class UserList {
  List<UserModel> users;

  UserList({required this.users});

  factory UserList.fromJson(List<dynamic> data) {
    log('all data3 : ${data[0]['id']}');
    List<UserModel> userList = [];
    userList = data.map((element) {
      log('all data4 : ${element['id']}');
      return UserModel.fromJson(Map<String, dynamic>.from(element));
    }).toList();
    return UserList(users: userList);
  }
}
class Role {
  bool? isAdmin;
  bool? isModerator;
  bool? isBasic;

  Role({this.isAdmin, this.isModerator, this.isBasic});

  Role.fromJson(Map<String, dynamic> json) {
    isAdmin = json['isAdmin'];
    isModerator = json['isModerator'];
    isBasic = json['isBasic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['isAdmin'] = isAdmin;
    data['isModerator'] = isModerator;
    data['isBasic'] = isBasic;
    return data;
  }
}