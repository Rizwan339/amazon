import 'dart:convert';

class AddressModel {
  String? name;
  String? monileNum;
  String? houseNum;
  String? area;
  String? landMark;
  String? pincode;
  String? town;
  String? state;
  bool? isDefault;

  AddressModel(
      {this.name,
      this.monileNum,
      this.houseNum,
      this.area,
      this.landMark,
      this.pincode,
      this.town,
      this.state,
      this.isDefault});

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "monileNum": monileNum,
      "houseNum": houseNum,
      "area": area,
      "landMark": landMark,
      "pincode": pincode,
      "town": town,
      "state": state,
      "isDefault": isDefault,
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      name: map["name"],
      monileNum: map["monileNum"],
      houseNum: map["houseNum"],
      area: map["area"],
      landMark: map["landMark"],
      pincode: map["pincode"],
      town: map["town"],
      state: map["state"],
      isDefault: map["isDefault"],
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressModel.fromJson(String source) =>
      AddressModel.fromMap(json.decode(source));
}
