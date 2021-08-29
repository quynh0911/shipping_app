class District {
  int? _id;
  String? _name;

  District({int? id, String? name}) {
    this._id = id;
    this._name = name;
  }

  int? get id => _id;
  set id(int? id) => this._id = id;
  String? get name => this._name;
  set name(String? name) => this._name = name;
  District.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    return data;
  }
}
