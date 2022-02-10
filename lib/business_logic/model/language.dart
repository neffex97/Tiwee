// To parse this JSON data, do
//
//     final languageObj = languageObjFromJson(jsonString);

import 'dart:convert';

LanguageObj languageObjFromJson(String str) => LanguageObj.fromJson(json.decode(str));

String languageObjToJson(LanguageObj data) => json.encode(data.toJson());

class LanguageObj {
  LanguageObj({
    this.name,
    this.code,
  });

  String ?name;
  String ?code;

  factory LanguageObj.fromJson(Map<String, dynamic> json) => LanguageObj(
    name: json["name"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "code": code,
  };
}
