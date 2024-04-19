import 'dart:convert';

class AddressModel {
  String? name;
  String? mobileNum;
  String? authenticatedMobileNum; //Do not textfield for this param
  String? houseNum;
  String? area;
  String? landMark;
  String? pincode;
  String? town;
  String? state;
  String? docID;
  bool? isDefault;

  AddressModel(
      {this.name,
      this.mobileNum,
      this.authenticatedMobileNum,
      this.houseNum,
      this.area,
      this.landMark,
      this.pincode,
      this.town,
      this.state,
      this.docID,
      this.isDefault});

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "monileNum": mobileNum,
      'authenticatedMobileNum': authenticatedMobileNum,
      "houseNum": houseNum,
      "area": area,
      "landMark": landMark,
      "pincode": pincode,
      "town": town,
      "state": state,
      "docID": docID,
      "isDefault": isDefault,
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      name: map['name'] != null ? map['name'] as String : null,
      mobileNum:
          map['mobileNumber'] != null ? map['mobileNumber'] as String : null,
      authenticatedMobileNum: map['authenticatedMobileNumber'] != null
          ? map['authenticatedMobileNumber'] as String
          : null,
      houseNum:
          map['houseNumber'] != null ? map['houseNumber'] as String : null,
      area: map['area'] != null ? map['area'] as String : null,
      landMark: map['landMark'] != null ? map['landMark'] as String : null,
      pincode: map['pincode'] != null ? map['pincode'] as String : null,
      town: map['town'] != null ? map['town'] as String : null,
      state: map['state'] != null ? map['state'] as String : null,
      docID: map['docID'] != null ? map['docID'] as String : null,
      isDefault: map['isDefault'] != null ? map['isDefault'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressModel.fromJson(String source) =>
      AddressModel.fromMap(json.decode(source));
}
