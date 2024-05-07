/// success : true
/// data : [{"id":1,"en":"Italian Food","ku":"خواردنی ئیتاڵی","ar":"طعام ايطالي","image":"food.png","user":"alan.soft2@gmail.com","date":"2023-11-12","branch":"La Vapiano Cafe & Rest","deleted":0},{"id":2,"en":"Special Food","ku":"خواردنی تایبەت","ar":"طعام خاص","image":"SPfood.png","user":"vapiano","date":"2024-01-23","branch":"La Vapiano Cafe & Rest","deleted":0},{"id":3,"en":"Spanish Food","ku":"خواردنی اسپانی","ar":"طعام اسباني","image":"Spanish Food.png","user":"alan.soft2@gmail.com","date":"2023-11-14","branch":"La Vapiano Cafe & Rest","deleted":0},{"id":4,"en":"Burger","ku":"بەرگر","ar":"برجر","image":"Burger.png","user":"vapiano","date":"2024-01-23","branch":"La Vapiano Cafe & Rest","deleted":0},{"id":5,"en":"Mexican Food","ku":"خواردنی مەکسیکی","ar":"طعام مكسيكي","image":"maxcican.png","user":"alan.soft2@gmail.com","date":"2023-11-14","branch":"La Vapiano Cafe & Rest","deleted":0},{"id":6,"en":"Kids Meal","ku":"خواردنی منداڵان","ar":"وجبة اطفال","image":"kids.png","user":"vapiano","date":"2024-01-23","branch":"La Vapiano Cafe & Rest","deleted":0},{"id":7,"en":"Pastry","ku":"شیرینی","ar":"معجنات","image":"pastry.png","user":"alan.soft2@gmail.com","date":"2023-11-12","branch":"La Vapiano Cafe & Rest","deleted":0},{"id":8,"en":"Healthy Food","ku":"خواردنی تەندروست","ar":"طعام الصحي","image":"healthyFood.png","user":"alan.soft2@gmail.com","date":"2023-11-15","branch":"La Vapiano Cafe & Rest","deleted":0},{"id":9,"en":"Drink","ku":"خواردنەوە","ar":"مشروبات","image":"drink.png","user":"alan.soft2@gmail.com","date":"2023-11-12","branch":"La Vapiano Cafe & Rest","deleted":0},{"id":10,"en":"Shisha","ku":"نێرگەلە","ar":"ارگیلە","image":"shisha.png","user":"alan.soft2@gmail.com","date":"2023-11-12","branch":"La Vapiano Cafe & Rest","deleted":0}]

class CategoryModel {
  CategoryModel({
      bool? success, 
      List<Data>? data,}){
    _success = success;
    _data = data;
}

  CategoryModel.fromJson(dynamic json) {
    _success = json['success'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  bool? _success;
  List<Data>? _data;
CategoryModel copyWith({  bool? success,
  List<Data>? data,
}) => CategoryModel(  success: success ?? _success,
  data: data ?? _data,
);
  bool? get success => _success;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// en : "Italian Food"
/// ku : "خواردنی ئیتاڵی"
/// ar : "طعام ايطالي"
/// image : "food.png"
/// user : "alan.soft2@gmail.com"
/// date : "2023-11-12"
/// branch : "La Vapiano Cafe & Rest"
/// deleted : 0

class Data {
  Data({
      num? id, 
      String? en, 
      String? ku, 
      String? ar, 
      String? image, 
      String? user, 
      String? date, 
      String? branch, 
      num? deleted,}){
    _id = id;
    _en = en;
    _ku = ku;
    _ar = ar;
    _image = image;
    _user = user;
    _date = date;
    _branch = branch;
    _deleted = deleted;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _en = json['en'];
    _ku = json['ku'];
    _ar = json['ar'];
    _image = json['image'];
    _user = json['user'];
    _date = json['date'];
    _branch = json['branch'];
    _deleted = json['deleted'];
  }
  num? _id;
  String? _en;
  String? _ku;
  String? _ar;
  String? _image;
  String? _user;
  String? _date;
  String? _branch;
  num? _deleted;
Data copyWith({  num? id,
  String? en,
  String? ku,
  String? ar,
  String? image,
  String? user,
  String? date,
  String? branch,
  num? deleted,
}) => Data(  id: id ?? _id,
  en: en ?? _en,
  ku: ku ?? _ku,
  ar: ar ?? _ar,
  image: image ?? _image,
  user: user ?? _user,
  date: date ?? _date,
  branch: branch ?? _branch,
  deleted: deleted ?? _deleted,
);
  num? get id => _id;
  String? get en => _en;
  String? get ku => _ku;
  String? get ar => _ar;
  String? get image => _image;
  String? get user => _user;
  String? get date => _date;
  String? get branch => _branch;
  num? get deleted => _deleted;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['en'] = _en;
    map['ku'] = _ku;
    map['ar'] = _ar;
    map['image'] = _image;
    map['user'] = _user;
    map['date'] = _date;
    map['branch'] = _branch;
    map['deleted'] = _deleted;
    return map;
  }

}