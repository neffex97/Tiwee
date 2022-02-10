// To parse this JSON data, do
//
//     final countryObj = countryObjFromJson(jsonString);

import 'dart:convert';

CountryObj countryObjFromJson(String str) => CountryObj.fromJson(json.decode(str));

String countryObjToJson(CountryObj data) => json.encode(data.toJson());

class CountryObj {
  CountryObj({
    this.name,
    this.code,
  });

  String ?name;
  String? code;

  factory CountryObj.fromJson(Map<String, dynamic> json) => CountryObj(
    name: json["name"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "code": code,
  };
}
