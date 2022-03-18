// To parse this JSON data, do
//
//     final itemList = itemListFromJson(jsonString);

// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

List<ItemList> itemListFromJson(String str) =>
    List<ItemList>.from(json.decode(str).map((x) => ItemList.fromJson(x)));

String itemListToJson(List<ItemList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ItemList {
  ItemList(
      {required this.p_name,
      required this.p_id,
      required this.p_cost,
      required this.p_availability,
      required this.p_details,
      required this.p_category,
      required this.image});

  String? p_name;
  int? p_id;
  int? p_cost;
  int? p_availability;
  String? p_details;
  String? p_category;
  String? image;

  factory ItemList.fromJson(Map<String, dynamic> json) => ItemList(
      p_name: json["p_name"],
      p_id: json["p_id"],
      p_cost: json["p_cost"],
      p_availability: json["p_availability"],
      p_details: (json["p_details"] == null) ? null : json["p_details"],
      p_category: (json["p_category"] == null) ? null : json["p_category"],
      image: json["image"]);

  Map<String, dynamic> toJson() => {
        "p_name": p_name,
        "p_id": p_id,
        "p_cost": p_cost,
        "p_availability": p_availability,
        "p_details": (p_details == null) ? null : p_details,
        "p_category": (p_category == null) ? null : p_category,
        "image": image
      };
}
