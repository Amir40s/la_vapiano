/// data : [{"order_id":327,"order_note":"Order Note","item_id":"2","id":2,"order_qty":"2","ip_address":"03356912850","note":"Order Note","order_number":"922807","status":"Pending","en":"Greek Salad","ku":"زەڵاتەی یۆنانی","ar":"سلطة يونانية","descen":"Onion, Cucumber, Tomato, Greek cheese, Sauce, Olive","descar":"بصل، خيار، طماطم، جبنة يونانية، صوص، زيتون","descku":"پیاز، خەیار، تەماتە، پەنیری یۆنانی، سۆس، زەیتوون","price":8000,"discount":0,"category":"Italian Food","subcategory":"Salad","image":"DSC05654.jpg","user":"alan.soft2@gmail.com","date":"2023-11-14","branch":"La Vapiano Cafe & Rest","deleted":0}]

class CartModel {
  CartModel({
      List<Data>? data,}){
    _data = data;
}

  CartModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  List<Data>? _data;
CartModel copyWith({  List<Data>? data,
}) => CartModel(  data: data ?? _data,
);
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// order_id : 327
/// order_note : "Order Note"
/// item_id : "2"
/// id : 2
/// order_qty : "2"
/// ip_address : "03356912850"
/// note : "Order Note"
/// order_number : "922807"
/// status : "Pending"
/// en : "Greek Salad"
/// ku : "زەڵاتەی یۆنانی"
/// ar : "سلطة يونانية"
/// descen : "Onion, Cucumber, Tomato, Greek cheese, Sauce, Olive"
/// descar : "بصل، خيار، طماطم، جبنة يونانية، صوص، زيتون"
/// descku : "پیاز، خەیار، تەماتە، پەنیری یۆنانی، سۆس، زەیتوون"
/// price : 8000
/// discount : 0
/// category : "Italian Food"
/// subcategory : "Salad"
/// image : "DSC05654.jpg"
/// user : "alan.soft2@gmail.com"
/// date : "2023-11-14"
/// branch : "La Vapiano Cafe & Rest"
/// deleted : 0

class Data {
  Data({
      num? orderId, 
      String? orderNote, 
      String? itemId, 
      num? id, 
      String? orderQty, 
      String? ipAddress, 
      String? note, 
      String? orderNumber, 
      String? status, 
      String? en, 
      String? ku, 
      String? ar, 
      String? descen, 
      String? descar, 
      String? descku, 
      num? price, 
      num? discount, 
      String? category, 
      String? subcategory, 
      String? image, 
      String? user, 
      String? date, 
      String? branch, 
      num? deleted,}){
    _orderId = orderId;
    _orderNote = orderNote;
    _itemId = itemId;
    _id = id;
    _orderQty = orderQty;
    _ipAddress = ipAddress;
    _note = note;
    _orderNumber = orderNumber;
    _status = status;
    _en = en;
    _ku = ku;
    _ar = ar;
    _descen = descen;
    _descar = descar;
    _descku = descku;
    _price = price;
    _discount = discount;
    _category = category;
    _subcategory = subcategory;
    _image = image;
    _user = user;
    _date = date;
    _branch = branch;
    _deleted = deleted;
}

  Data.fromJson(dynamic json) {
    _orderId = json['order_id'];
    _orderNote = json['order_note'];
    _itemId = json['item_id'];
    _id = json['id'];
    _orderQty = json['order_qty'];
    _ipAddress = json['ip_address'];
    _note = json['note'];
    _orderNumber = json['order_number'];
    _status = json['status'];
    _en = json['en'];
    _ku = json['ku'];
    _ar = json['ar'];
    _descen = json['descen'];
    _descar = json['descar'];
    _descku = json['descku'];
    _price = json['price'];
    _discount = json['discount'];
    _category = json['category'];
    _subcategory = json['subcategory'];
    _image = json['image'];
    _user = json['user'];
    _date = json['date'];
    _branch = json['branch'];
    _deleted = json['deleted'];
  }
  num? _orderId;
  String? _orderNote;
  String? _itemId;
  num? _id;
  String? _orderQty;
  String? _ipAddress;
  String? _note;
  String? _orderNumber;
  String? _status;
  String? _en;
  String? _ku;
  String? _ar;
  String? _descen;
  String? _descar;
  String? _descku;
  num? _price;
  num? _discount;
  String? _category;
  String? _subcategory;
  String? _image;
  String? _user;
  String? _date;
  String? _branch;
  num? _deleted;
Data copyWith({  num? orderId,
  String? orderNote,
  String? itemId,
  num? id,
  String? orderQty,
  String? ipAddress,
  String? note,
  String? orderNumber,
  String? status,
  String? en,
  String? ku,
  String? ar,
  String? descen,
  String? descar,
  String? descku,
  num? price,
  num? discount,
  String? category,
  String? subcategory,
  String? image,
  String? user,
  String? date,
  String? branch,
  num? deleted,
}) => Data(  orderId: orderId ?? _orderId,
  orderNote: orderNote ?? _orderNote,
  itemId: itemId ?? _itemId,
  id: id ?? _id,
  orderQty: orderQty ?? _orderQty,
  ipAddress: ipAddress ?? _ipAddress,
  note: note ?? _note,
  orderNumber: orderNumber ?? _orderNumber,
  status: status ?? _status,
  en: en ?? _en,
  ku: ku ?? _ku,
  ar: ar ?? _ar,
  descen: descen ?? _descen,
  descar: descar ?? _descar,
  descku: descku ?? _descku,
  price: price ?? _price,
  discount: discount ?? _discount,
  category: category ?? _category,
  subcategory: subcategory ?? _subcategory,
  image: image ?? _image,
  user: user ?? _user,
  date: date ?? _date,
  branch: branch ?? _branch,
  deleted: deleted ?? _deleted,
);
  num? get orderId => _orderId;
  String? get orderNote => _orderNote;
  String? get itemId => _itemId;
  num? get id => _id;
  String? get orderQty => _orderQty;
  String? get ipAddress => _ipAddress;
  String? get note => _note;
  String? get orderNumber => _orderNumber;
  String? get status => _status;
  String? get en => _en;
  String? get ku => _ku;
  String? get ar => _ar;
  String? get descen => _descen;
  String? get descar => _descar;
  String? get descku => _descku;
  num? get price => _price;
  num? get discount => _discount;
  String? get category => _category;
  String? get subcategory => _subcategory;
  String? get image => _image;
  String? get user => _user;
  String? get date => _date;
  String? get branch => _branch;
  num? get deleted => _deleted;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['order_id'] = _orderId;
    map['order_note'] = _orderNote;
    map['item_id'] = _itemId;
    map['id'] = _id;
    map['order_qty'] = _orderQty;
    map['ip_address'] = _ipAddress;
    map['note'] = _note;
    map['order_number'] = _orderNumber;
    map['status'] = _status;
    map['en'] = _en;
    map['ku'] = _ku;
    map['ar'] = _ar;
    map['descen'] = _descen;
    map['descar'] = _descar;
    map['descku'] = _descku;
    map['price'] = _price;
    map['discount'] = _discount;
    map['category'] = _category;
    map['subcategory'] = _subcategory;
    map['image'] = _image;
    map['user'] = _user;
    map['date'] = _date;
    map['branch'] = _branch;
    map['deleted'] = _deleted;
    return map;
  }

}