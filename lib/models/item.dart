class Items {
  late int _amount;
  late int _id;
  late String _name;
  late int _price;

  Items(
      {required int amount,
      required int id,
      required String name,
      required int price}) {
    this._amount = amount;
    this._id = id;
    this._name = name;
    this._price = price;
  }

  int get amount => this._amount;
  set amount(int amount) => this._amount = amount;
  int get id => this._id;
  set id(int id) => this._id = id;
  String get name => this._name;
  set name(String name) => this._name = name;
  int get price => this._price;
  set price(int price) => this._price = price;

  Items.fromJson(Map<String, dynamic> json) {
    _amount = json['amount'];
    _id = json['id'];
    _name = json['name'];
    _price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this._amount;
    data['id'] = this._id;
    data['name'] = this._name;
    data['price'] = this._price;
    return data;
  }
}
