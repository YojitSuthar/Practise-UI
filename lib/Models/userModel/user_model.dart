class UserModel {
  String? name;
  String? address;
  String? phone;

  UserModel({this.name, this.address, this.phone});

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    address = json['Address'];
    phone = json['Phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = this.name;
    data['Address'] = this.address;
    data['Phone'] = this.phone;
    return data;
  }
}