import '../helpers/search_helper.dart';

class User implements SearchList {
  int? id;
  String? name;
  String? username;
  String? email;
  String? phone;
  String? website;

  User({
    id,
    name,
    username,
    email,
    phone,
    website,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];

    phone = json['phone'];
    website = json['website'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['username'] = username;
    data['email'] = email;
    data['phone'] = phone;
    data['website'] = website;

    return data;
  }

  @override
  get fiedlOneSearch => id;

  @override
  get fieldTwoSearch => name;
}
