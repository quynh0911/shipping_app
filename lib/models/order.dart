import 'package:flutter/cupertino.dart';
import 'package:flutter_application/models/item.dart';
import 'package:flutter_application/models/owner.dart';

class Order {
  String? _description;
  int? _id;
  late List<Items> _items;
  late DateTime _orderDate;
  late String _orderState;
  late String _orderType;
  late Owner? _owner;
  DateTime? _receiveTime;
  late String _receiverAddress;
  late double _receiverLatitude;
  late double _receiverLongitude;
  late String _receiverName;
  late String _receiverPhone;
  late String _senderAddress;
  late double _senderLatitude;
  late double _senderLongitude;
  late String _senderName;
  late String _senderPhone;
  late int _shipPrice;
  late Owner? _shipper;
  late int _totalPrice;
  Order(
      {String? description,
      int? id,
      required List<Items> items,
      required DateTime orderDate,
      required String orderState,
      required String orderType,
      Owner? owner,
      DateTime? receiveTime, //dd:mm:YY:hh
      required String receiverAddress,
      required double receiverLatitude,
      required double receiverLongitude,
      required String receiverName,
      required String receiverPhone,
      required String senderAddress,
      required double senderLatitude,
      required double senderLongitude,
      required String senderName,
      required String senderPhone,
      required int shipPrice,
      Owner? shipper,
      required int totalPrice}) {
    this._description = description;
    this._id = id;
    this._items = items;
    this._orderDate = orderDate;
    this._orderState = orderState;
    this._orderType = orderType;
    this._owner = owner;
    this._receiveTime = receiveTime;
    this._receiverAddress = receiverAddress;
    this._receiverLatitude = receiverLatitude;
    this._receiverLongitude = receiverLongitude;
    this._receiverName = receiverName;
    this._receiverPhone = receiverPhone;
    this._senderAddress = senderAddress;
    this._senderLatitude = senderLatitude;
    this._senderLongitude = senderLongitude;
    this._senderName = senderName;
    this._senderPhone = senderPhone;
    this._shipPrice = shipPrice;
    this._shipper = shipper;
    this._totalPrice = totalPrice;
  }

  String? get description => this._description;
  set description(String? description) => this._description = description;
  int? get id => this._id;
  set id(int? id) => this._id = id;
  List<Items> get items => this._items;
  set items(List<Items> items) => this._items = items;
  DateTime get orderDate => this._orderDate;
  set orderDate(DateTime orderDate) => this._orderDate = orderDate;
  String get orderState => this._orderState;
  set orderState(String orderState) => this._orderState = orderState;
  String get orderType => this._orderType;
  set orderType(String orderType) => this._orderType = orderType;
  Owner? get owner => this._owner;
  set owner(Owner? owner) => this._owner = owner;
  DateTime? get receiveTime => this._receiveTime;
  set receiveTime(DateTime? receiveTime) => this._receiveTime = receiveTime;
  String get receiverAddress => this._receiverAddress;
  set receiverAddress(String receiverAddress) =>
      this._receiverAddress = receiverAddress;
  double get receiverLatitude => this._receiverLatitude;
  set receiverLatitude(double receiverLatitude) =>
      this._receiverLatitude = receiverLatitude;
  double get receiverLongitude => this._receiverLongitude;
  set receiverLongitude(double receiverLongitude) =>
      this._receiverLongitude = receiverLongitude;
  String get receiverName => this._receiverName;
  set receiverName(String receiverName) => this._receiverName = receiverName;
  String get receiverPhone => this._receiverPhone;
  set receiverPhone(String receiverPhone) =>
      this._receiverPhone = receiverPhone;
  String get senderAddress => this._senderAddress;
  set senderAddress(String senderAddress) =>
      this._senderAddress = senderAddress;
  double get senderLatitude => this._senderLatitude;
  set senderLatitude(double senderLatitude) =>
      this._senderLatitude = senderLatitude;
  double get senderLongitude => this._senderLongitude;
  set senderLongitude(double senderLongitude) =>
      this._senderLongitude = senderLongitude;
  String get senderName => this._senderName;
  set senderName(String senderName) => this._senderName = senderName;
  String get senderPhone => this._senderPhone;
  set senderPhone(String senderPhone) => this._senderPhone = senderPhone;
  int get shipPrice => this._shipPrice;
  set shipPrice(int shipPrice) => this._shipPrice = shipPrice;
  Owner? get shipper => this._shipper;
  set shipper(Owner? shipper) => this._shipper = shipper;
  int get totalPrice => this._totalPrice;
  set totalPrice(int totalPrice) => this._totalPrice = totalPrice;

  Order.fromJson(Map<String, dynamic> json) {
    _description = json['description'];
    _id = json['id'];
    _items = json["items"].map<Items>((i) {
      return Items.fromJson(i);
    }).toList();
    _orderDate = DateTime.parse(json['orderDate']);
    _orderState = json['orderState'];
    _orderType = json['orderType'];
    _owner = json['owner'] = Owner.fromJson(json['owner']);
    _receiveTime = DateTime.tryParse(json['receiveTime']);
    _receiverAddress = json['receiverAddress'];
    _receiverLatitude = json['receiverLatitude'];
    _receiverLongitude = json['receiverLongitude'];
    _receiverName = json['receiverName'];
    _receiverPhone = json['receiverPhone'];
    _senderAddress = json['senderAddress'];
    _senderLatitude = json['senderLatitude'];
    _senderLongitude = json['senderLongitude'];
    _senderName = json['senderName'];
    _senderPhone = json['senderPhone'];
    _shipPrice = json['shipPrice'];
    _shipper = json['shipper'] = Owner.fromJson(json['shipper']);
    _totalPrice = json['totalPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this._description;
    data['id'] = this._id;
    data['items'] = this._items.map((v) => v.toJson()).toList();
    data['orderDate'] = this._orderDate.toIso8601String();
    data['orderState'] = this._orderState;
    data['orderType'] = this._orderType;
    if (this._owner != null) {
      data['owner'] = this._owner!.toJson();
    }
    if (receiveTime != null) {
      data['receiveTime'] = this._receiveTime!.toIso8601String();
    }
    data['receiverAddress'] = this._receiverAddress;
    data['receiverLatitude'] = this._receiverLatitude;
    data['receiverLongitude'] = this._receiverLongitude;
    data['receiverName'] = this._receiverName;
    data['receiverPhone'] = this._receiverPhone;
    data['senderAddress'] = this._senderAddress;
    data['senderLatitude'] = this._senderLatitude;
    data['senderLongitude'] = this._senderLongitude;
    data['senderName'] = this._senderName;
    data['senderPhone'] = this._senderPhone;
    data['shipPrice'] = this._shipPrice;
    if (this._shipper != null) {
      data['shipper'] = this._shipper!.toJson();
    }

    data['totalPrice'] = this._totalPrice;
    return data;
  }
}
