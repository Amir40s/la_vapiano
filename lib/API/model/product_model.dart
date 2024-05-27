// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(List<ProductModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
  int id;
  String en;
  String ku;
  String ar;
  String descen;
  String descar;
  String descku;
  int price;
  int discount;
  String category;
  String subcategory;
  String image;
  String user;
  DateTime date;
  String branch;
  int deleted;

  ProductModel({
    required this.id,
    required this.en,
    required this.ku,
    required this.ar,
    required this.descen,
    required this.descar,
    required this.descku,
    required this.price,
    required this.discount,
    required this.category,
    required this.subcategory,
    required this.image,
    required this.user,
    required this.date,
    required this.branch,
    required this.deleted,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json["id"],
    en: json["en"],
    ku: json["ku"],
    ar: json["ar"],
    descen: json["descen"],
    descar: json["descar"],
    descku: json["descku"],
    price: json["price"],
    discount: json["discount"],
    category: json["category"]!,
    subcategory: json["subcategory"]!,
    image: json["image"],
    user: json["user"]!,
    date: DateTime.parse(json["date"]),
    branch: json["branch"]!,
    deleted: json["deleted"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "en": en,
    "ku": ku,
    "ar": ar,
    "descen": descen,
    "descar": descar,
    "descku": descku,
    "price": price,
    "discount": discount,
    "category": category,
    "subcategory": subcategory,
    "image": image,
    "user": user,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "branch": branch,
    "deleted": deleted,
  };
}

enum Branch {
  LA_VAPIANO_CAFE_REST
}

final branchValues = EnumValues({
  "La Vapiano Cafe & Rest": Branch.LA_VAPIANO_CAFE_REST
});

// enum Category {
//   ITALIAN_FOOD
// }

// final categoryValues = EnumValues({
//   "Italian Food": Category.ITALIAN_FOOD
// });

// enum Subcategory {
//   GRILLED_FOOD,
//   ITALIAN_PIZZA,
//   PASTA,
//   SALAD,
//   SANDWICH,
//   SOUP
// }

// final subcategoryValues = EnumValues({
//   "GrilledFood": Subcategory.GRILLED_FOOD,
//   "ItalianPizza": Subcategory.ITALIAN_PIZZA,
//   "Pasta": Subcategory.PASTA,
//   "Salad": Subcategory.SALAD,
//   "Sandwich": Subcategory.SANDWICH,
//   "Soup": Subcategory.SOUP
// });

// enum User {
//   ALAN_SOFT2_GMAIL_COM,
//   VAPIANO
// }
//
// final userValues = EnumValues({
//   "alan.soft2@gmail.com": User.ALAN_SOFT2_GMAIL_COM,
//   "vapiano": User.VAPIANO
// });

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
