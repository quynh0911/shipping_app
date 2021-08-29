class Owner {
  late int _id;
  late String _login;

  Owner({required int id, required String login}) {
    this._id = id;
    this._login = login;
  }

  int get id => this._id;
  set id(int id) => _id = id;
  String get login => this._login;
  set login(String login) => _login = login;

  Owner.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _login = json['login'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['login'] = this._login;
    return data;
  }
}
