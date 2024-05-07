// To parse this JSON data, do
//
//     final subCategoryModel = subCategoryModelFromJson(jsonString);

import 'dart:convert';

List<SubCategoryModel> subCategoryModelFromJson(String str) => List<SubCategoryModel>.from(json.decode(str).map((x) => SubCategoryModel.fromJson(x)));

String subCategoryModelToJson(List<SubCategoryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SubCategoryModel {
  int id;
  String en;
  String ku;
  String ar;
  String en1;
  String ku1;
  String ar1;
  String image;
  String user;
  DateTime date;
  String branch;
  int deleted;

  SubCategoryModel({
    required this.id,
    required this.en,
    required this.ku,
    required this.ar,
    required this.en1,
    required this.ku1,
    required this.ar1,
    required this.image,
    required this.user,
    required this.date,
    required this.branch,
    required this.deleted,
  });

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) => SubCategoryModel(
    id: json["id"],
    en: json["en"],
    ku: json["ku"],
    ar: json["ar"],
    en1: json["en1"],
    ku1: json["ku1"],
    ar1: json["ar1"],
    image: json["image"],
    user: json["user"],
    date: DateTime.parse(json["date"]),
    branch: json["branch"],
    deleted: json["deleted"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "en": en,
    "ku": ku,
    "ar": ar,
    "en1": en1,
    "ku1": ku1,
    "ar1": ar1,
    "image": image,
    "user": user,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "branch": branch,
    "deleted": deleted,
  };
}
