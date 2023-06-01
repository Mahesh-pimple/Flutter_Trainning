// To parse this JSON data, do
//
//     final tvModel = tvModelFromJson(jsonString);

import 'dart:convert';

List<TvModel> tvModelFromJson(String str) => List<TvModel>.from(json.decode(str).map((x) => TvModel.fromJson(x)));

String tvModelToJson(List<TvModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TvModel {
  bool? tvModelDefault;
  String? type;
  List<Item> items;

  TvModel({
    this.tvModelDefault,
    this.type,
    required this.items,
  });

  factory TvModel.fromJson(Map<String, dynamic> json) => TvModel(
    tvModelDefault: json["default"],
    type: json["type"],
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "default": tvModelDefault,
    "type": type,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
  };
}

class Item {
  String title;
  String year;
  String runtime;
  String timing;
  String startTime;
  String poster;

  Item({
    required this.title,
    required this.year,
    required this.runtime,
    required this.timing,
    required this.startTime,
    required this.poster,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    title: json["Title"],
    year: json["Year"],
    runtime: json["Runtime"],
    timing: json["Timing"],
    startTime: json["StartTime"],
    poster: json["Poster"],
  );

  Map<String, dynamic> toJson() => {
    "Title": title,
    "Year": year,
    "Runtime": runtime,
    "Timing": timing,
    "StartTime": startTime,
    "Poster": poster,
  };
}
