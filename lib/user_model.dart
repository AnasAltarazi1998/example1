import 'dart:io';

class UserModel {
  String name;
  File img;

  UserModel({this.name, this.img});

  UserModel.fromJson(Map<String, dynamic> json) {
    this.name = json['name'];
    json['img'] ? this.img = json['img'] : print('no image');
  }

  Map<String, dynamic> toJson(UserModel user) {
    Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = user.name;
    data['img'] = user.img;
    return data;
  }
}
