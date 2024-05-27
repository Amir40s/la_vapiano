/// success : true
/// orders : [{"id":460,"name":"saqlain","mobile":"03356912850","address":"Jaranwala","en":"Greek Salad","order_qty":2,"price":"8000","ip_address":"03356912850","order_number":"574529","note":"Order Note","date_time":"2024-05-01 21:01:15","status":"Pending","payment":"Debt"},{"id":461,"name":"saqlain","mobile":"03356912850","address":"address","en":"Greek Salad","order_qty":2,"price":"8000","ip_address":"03356912850","order_number":"922807","note":"Order Note","date_time":"2024-05-08 12:12:43","status":"Pending","payment":"Debt"}]

class OrderHistoryModel {
  OrderHistoryModel({
      bool? success, 
      List<Orders>? orders,}){
    _success = success;
    _orders = orders;
}

  OrderHistoryModel.fromJson(dynamic json) {
    _success = json['success'];
    if (json['orders'] != null) {
      _orders = [];
      json['orders'].forEach((v) {
        _orders?.add(Orders.fromJson(v));
      });
    }
  }
  bool? _success;
  List<Orders>? _orders;
OrderHistoryModel copyWith({  bool? success,
  List<Orders>? orders,
}) => OrderHistoryModel(  success: success ?? _success,
  orders: orders ?? _orders,
);
  bool? get success => _success;
  List<Orders>? get orders => _orders;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    if (_orders != null) {
      map['orders'] = _orders?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 460
/// name : "saqlain"
/// mobile : "03356912850"
/// address : "Jaranwala"
/// en : "Greek Salad"
/// order_qty : 2
/// price : "8000"
/// ip_address : "03356912850"
/// order_number : "574529"
/// note : "Order Note"
/// date_time : "2024-05-01 21:01:15"
/// status : "Pending"
/// payment : "Debt"

class Orders {
  Orders({
      num? id, 
      String? name, 
      String? mobile, 
      String? address, 
      String? en, 
      num? orderQty, 
      String? price, 
      String? ipAddress, 
      String? orderNumber, 
      String? note, 
      String? dateTime, 
      String? status, 
      String? payment,}){
    _id = id;
    _name = name;
    _mobile = mobile;
    _address = address;
    _en = en;
    _orderQty = orderQty;
    _price = price;
    _ipAddress = ipAddress;
    _orderNumber = orderNumber;
    _note = note;
    _dateTime = dateTime;
    _status = status;
    _payment = payment;
}

  Orders.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _mobile = json['mobile'];
    _address = json['address'];
    _en = json['en'];
    _orderQty = json['order_qty'];
    _price = json['price'];
    _ipAddress = json['ip_address'];
    _orderNumber = json['order_number'];
    _note = json['note'];
    _dateTime = json['date_time'];
    _status = json['status'];
    _payment = json['payment'];
  }
  num? _id;
  String? _name;
  String? _mobile;
  String? _address;
  String? _en;
  num? _orderQty;
  String? _price;
  String? _ipAddress;
  String? _orderNumber;
  String? _note;
  String? _dateTime;
  String? _status;
  String? _payment;
Orders copyWith({  num? id,
  String? name,
  String? mobile,
  String? address,
  String? en,
  num? orderQty,
  String? price,
  String? ipAddress,
  String? orderNumber,
  String? note,
  String? dateTime,
  String? status,
  String? payment,
}) => Orders(  id: id ?? _id,
  name: name ?? _name,
  mobile: mobile ?? _mobile,
  address: address ?? _address,
  en: en ?? _en,
  orderQty: orderQty ?? _orderQty,
  price: price ?? _price,
  ipAddress: ipAddress ?? _ipAddress,
  orderNumber: orderNumber ?? _orderNumber,
  note: note ?? _note,
  dateTime: dateTime ?? _dateTime,
  status: status ?? _status,
  payment: payment ?? _payment,
);
  num? get id => _id;
  String? get name => _name;
  String? get mobile => _mobile;
  String? get address => _address;
  String? get en => _en;
  num? get orderQty => _orderQty;
  String? get price => _price;
  String? get ipAddress => _ipAddress;
  String? get orderNumber => _orderNumber;
  String? get note => _note;
  String? get dateTime => _dateTime;
  String? get status => _status;
  String? get payment => _payment;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['mobile'] = _mobile;
    map['address'] = _address;
    map['en'] = _en;
    map['order_qty'] = _orderQty;
    map['price'] = _price;
    map['ip_address'] = _ipAddress;
    map['order_number'] = _orderNumber;
    map['note'] = _note;
    map['date_time'] = _dateTime;
    map['status'] = _status;
    map['payment'] = _payment;
    return map;
  }

}