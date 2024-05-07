
import 'package:la_vapiano/API/Api.dart';

class MenuModel{
  String? id,en,ku,ar,image,user,date,branch,deleted;

  MenuModel({
    required this.id,
    this.en,
    this.ku,
    this.ar,
    this.image,
    this.user,
    this.date,
    this.branch,
    this.deleted,
  });

  // Convert Product object to a map for serialization
  Map<String, dynamic> toJson() {
    return {
      ApiKey.key_id: id,
      ApiKey.key_mobile: en,
      ApiKey.key_address: ku,
      ApiKey.key_ar: ar,
      ApiKey.key_image: image,
      ApiKey.key_user: user,
      ApiKey.key_date: date,
      ApiKey.key_branch: branch,
      ApiKey.key_deleted: deleted,
    };
  }

  // Create a Product object from a map
  factory MenuModel.fromJson(Map<String, dynamic> json) {
    return MenuModel(
      id: json[ApiKey.key_id],
      en: json[ApiKey.key_en],
      ku: json[ApiKey.key_ku],
      ar: json[ApiKey.key_ar],
      image: json[ApiKey.key_image],
      user: json[ApiKey.key_user],
      date: json[ApiKey.key_date],
      branch: json[ApiKey.key_branch],
      deleted: json[ApiKey.key_deleted],
    );
  }
}