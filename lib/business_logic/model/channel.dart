// To parse this JSON data, do
//
//     final channelObj = channelObjFromJson(jsonString);

import 'dart:convert';

ChannelObj channelObjFromJson(String str) => ChannelObj.fromJson(json.decode(str));

String channelObjToJson(ChannelObj data) => json.encode(data.toJson());

class ChannelObj {
  ChannelObj({
   required this.name,
   required this.logo,
   required this.url,
   required this.categories,
   required this.countries,
   required this.languages,
   required this.tvg,
  });

  String name;
  String logo;
  String url;
  List<Category> categories;
  List<Country> countries;
  List<Country> languages;
  Tvg tvg;

  factory ChannelObj.fromJson(Map<String, dynamic> json) => ChannelObj(
    name: json["name"]??"",
    logo: json["logo"]??"",
    url: json["url"]??"",
    categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
    countries: List<Country>.from(json["countries"].map((x) => Country.fromJson(x))),
    languages: List<Country>.from(json["languages"].map((x) => Country.fromJson(x))),
    tvg: Tvg.fromJson(json["tvg"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "logo": logo,
    "url": url,
    "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
    "countries": List<dynamic>.from(countries.map((x) => x.toJson())),
    "languages": List<dynamic>.from(languages.map((x) => x.toJson())),
    "tvg": tvg.toJson(),
  };
}

class Category {
  Category({
   required this.name,
   required this.slug,
  });

  String name;
  String slug;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    name: json["name"],
    slug: json["slug"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "slug": slug,
  };
}

class Country {
  Country({
  required  this.name,
   required this.code,
  });

  String name;
  String code;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    name: json["name"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "code": code,
  };
}

class Tvg {
  Tvg({
    this.id,
    this.name,
    this.url,
  });

  String? id;
  String? name;
  String? url;

  factory Tvg.fromJson(Map<String, dynamic> json) => Tvg(
    id: json["id"],
    name: json["name"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "url": url,
  };
}
