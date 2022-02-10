// To parse this JSON data, do
//
//     final tvgObj = tvgObjFromJson(jsonString);

import 'dart:convert';

TvgObj tvgObjFromJson(String str) => TvgObj.fromJson(json.decode(str));

String tvgObjToJson(TvgObj data) => json.encode(data.toJson());

class TvgObj {
  TvgObj({
    this.id,
    this.name,
    this.url,
  });

  String ?id;
  String ?name;
  String ?url;

  factory TvgObj.fromJson(Map<String, dynamic> json) => TvgObj(
    id: json["id"]??"",
    name: json["name"]??"",
    url: json["url"]??"",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "url": url,
  };
}
