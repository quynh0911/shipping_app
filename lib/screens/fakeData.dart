import 'package:flutter_application/models/address.dart';
import 'package:flutter_application/models/item.dart';
import 'package:flutter_application/models/owner.dart';
import 'package:flutter_application/models/user.dart';

import '../models/product_type.dart';
import '../models/store.dart';

import '../models/product.dart';
import '../models/item.dart';
import '../models/order.dart';

List<String> type = ['che', 'he'];

var FAKE_PRODUCT_MARKET = [
  Product(
      id: 1,
      image: 'assets/images/tao_pho.jpg',
      actived: true,
      description: 'Ngon',
      name: 'Tào phớ',
      price: 10000,
      store: FAKE_STORE[0],
      types: FAKE_PRODUCT_TYPE,
      imageContentType: 'jpg'),
  Product(
      id: 2,
      image: 'assets/images/tao_pho.jpg',
      actived: false,
      description: 'Ngon',
      name: 'Tào phớ',
      price: 100000,
      store: FAKE_STORE[0],
      types: FAKE_PRODUCT_TYPE,
      imageContentType: 'jpg'),
  Product(
      id: 3,
      image: 'assets/images/tao_pho.jpg',
      actived: false,
      description: 'Ngon',
      name: 'Tào phớ',
      price: 1000000,
      store: FAKE_STORE[0],
      types: FAKE_PRODUCT_TYPE,
      imageContentType: 'jpg'),
  Product(
      id: 4,
      image: 'assets/images/tao_pho.jpg',
      actived: true,
      description: 'Ngon',
      name: 'Tào phớ',
      price: 10000,
      store: FAKE_STORE[0],
      types: FAKE_PRODUCT_TYPE,
      imageContentType: 'jpg'),
  Product(
      id: 5,
      image: 'assets/images/tra_chanh.jpg',
      actived: true,
      description: 'Ngon',
      name: 'Trà chanh',
      price: 10000,
      store: FAKE_STORE[0],
      types: FAKE_PRODUCT_TYPE,
      imageContentType: 'jpg'),
  Product(
      id: 6,
      image: 'assets/images/tao_pho.jpg',
      actived: true,
      description: 'Ngon',
      name: 'Tào phớ',
      price: 10000,
      store: FAKE_STORE[0],
      types: FAKE_PRODUCT_TYPE,
      imageContentType: 'jpg'),
  Product(
      id: 7,
      image: 'assets/images/tao_pho.jpg',
      actived: true,
      description: 'Ngon',
      name: 'Tào phớ',
      price: 10000,
      store: FAKE_STORE[0],
      types: FAKE_PRODUCT_TYPE,
      imageContentType: 'jpg')
];

var FAKE_STORE = [
  ProductStore(
      id: 1,
      address: 'ztdddddddcs',
      district: "BACGIANG",
      name: 'fjsddj',
      latitude: 30.513004,
      longitude: 114.42027,
      openTime: "18:00",
      closeTime: "18:40",
      phone: '0528996555')
];

//var FAKE_LOCATION = [Location(latitude: 123, longtitude: 12345)];

List<Items> FAKE_CART_LIST = [
  Items(id: 6, name: 'Tào phớ', price: 10000, amount: 1),
  Items(id: 5, name: 'Trà chanh', price: 10000, amount: 1),
  Items(id: 4, name: 'Tào phớ', price: 10000, amount: 1),
  Items(id: 3, name: 'Tào phớ', price: 10000, amount: 1),
  Items(id: 2, name: 'Tào phớ', price: 10000, amount: 1),
  Items(id: 1, name: 'Tào phớ', price: 10000, amount: 1),
];

List<ProductType> FAKE_PRODUCT_TYPE = [
  ProductType(id: 1, name: 'che'),
  ProductType(id: 2, name: 'Thực phẩm tươi sống'),
  ProductType(id: 3, name: 'Đồ khô')
];

var FAKE_USER = User(
  firstName: "Nguyễn",
  lastName: "Bá",
  phone: "0123456789",
  avatar: "assets/icons/user.png",
  address: "d",
  authorities: ["ROLE_USER"],
  email: "Ad",
);

var FAKE_SHIPPER = User(
  firstName: "Trần",
  lastName: "Đạo",
  phone: "0987654321",
  avatar: "assets/icons/default_shipper.png",
  address: "d",
  authorities: ["ROLE_USER"],
  email: "Ad",
);

List<User> FAKE_LIST_SHIPPERS = [
  User(
    firstName: "Trần",
    lastName: "Đạo",
    phone: "0987654321",
    avatar: "assets/icons/shipper_default.png",
    address: "d",
    authorities: ["ROLE_USER"],
    email: "Ad",
    activated: true,
  ),
  User(
    firstName: "Trần",
    lastName: "Đạo",
    phone: "0987654321",
    avatar: "assets/icons/shipper_default.png",
    address: "d",
    authorities: ["ROLE_USER"],
    email: "Ad",
    activated: true,
  ),
  User(
    firstName: "Trần",
    lastName: "Đạo",
    phone: "0987654321",
    avatar: "assets/icons/shipper_default.png",
    address: "d",
    authorities: ["ROLE_USER"],
    email: "Ad",
    activated: false,
  )
];

List<Order> FAKE_ORDER = [
  Order(
    description: 'Giao hai hộp quà cho khách',
    items: FAKE_CART_LIST,
    orderDate: DateTime.parse("02-09-2021"),
    orderState: 'WAITING_TO_ACCEPT',
    orderType: 'MARKET',
    receiverAddress: 'Tan Mai, Hoang Mai',
    receiverLatitude: 1.0002,
    receiverLongitude: 1.0005,
    receiverName: 'Nguyen Van A',
    receiverPhone: '0123456789',
    senderAddress: 'Hai Ba Trung, Hoang Mai',
    senderLatitude: 2.0001,
    senderLongitude: 5.0001,
    senderName: 'Tran Van B',
    senderPhone: '9876543210',
    shipPrice: 10000,
    totalPrice: 120000,
  ),
  Order(
    description: 'Giao hai hộp quà cho khách',
    items: FAKE_CART_LIST,
    orderDate: DateTime.parse("02-09-2021"),
    orderState: 'WAITING_TO_ACCEPT',
    orderType: 'MARKET',
    receiverAddress: 'Tan Mai, Hoang Mai',
    receiverLatitude: 1.0002,
    receiverLongitude: 1.0005,
    receiverName: 'Nguyen Van A',
    receiverPhone: '0123456789',
    senderAddress: 'Hai Ba Trung, Hoang Mai',
    senderLatitude: 2.0001,
    senderLongitude: 5.0001,
    senderName: 'Tran Van B',
    senderPhone: '9876543210',
    shipPrice: 10000,
    totalPrice: 120000,
  ),
];
List<Address> FAKE_ADDRESSES = [
  Address(
      latitude: 21.002853,
      longitude: 105.857845,
      name: "Nguyễn Trần Bá Đạo",
      phone: "0976684528",
      description: "Thanh Nhàn, Hai Bà Trưng, Hà Nội"),
  Address(
      latitude: 21.002853,
      longitude: 105.857845,
      name: "Nguyễn Trần Bá Đạo",
      phone: "0976684528",
      description: "Thanh Nhàn, Hai Bà Trưng, Hà Nội"),
  Address(
      latitude: 21.002853,
      longitude: 105.857845,
      name: "Nguyễn Trần Bá Đạo",
      phone: "0976684528",
      description: "Thanh Nhàn, Hai Bà Trưng, Hà Nội"),
// ];
];
List<String> FAKE_COMMENT_IMAGES = [
  "assets/images/unnamed.jpg",
  "assets/images/unnamed.jpg",
  "assets/images/unnamed.jpg",
  "assets/images/unnamed.jpg",
  "assets/images/unnamed.jpg",
  "assets/images/unnamed.jpg",
];
