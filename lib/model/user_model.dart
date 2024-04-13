import 'dart:convert';

class UserModel {
  String? name;
  String? mobileNum;
  String? userType;
  UserModel({
    this.name,
    this.mobileNum,
    this.userType,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'mobileNum': mobileNum,
      'userType': userType,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      mobileNum: map['mobileNum'],
      userType: map['userType'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
