// To parse this JSON data, do
//
//     final categoryobj = categoryobjFromJson(jsonString);

import 'dart:convert';

Categoryobj categoryobjFromJson(String str) => Categoryobj.fromJson(json.decode(str));

String categoryobjToJson(Categoryobj data) => json.encode(data.toJson());

class Categoryobj {
  Categoryobj({
    this.name,
    this.slug,
  });

  String? name;
  String? slug;

  factory Categoryobj.fromJson(Map<String, dynamic> json) => Categoryobj(
    name: json["name"],
    slug: json["slug"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "slug": slug,
  };
}
