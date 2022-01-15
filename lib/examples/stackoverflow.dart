import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Photo {
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  Photo({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  Photo.fromJson(Map<String, dynamic> json) {
    albumId = json['albumId'];
    id = json['id'];
    title = json['title'];
    url = json['url'];
    thumbnailUrl = json['thumbnailUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['albumId'] = this.albumId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['url'] = this.url;
    data['thumbnailUrl'] = this.thumbnailUrl;
    return data;
  }
}

class Post {
  int userId;
  int id;
  String title;
  String body;

  Post({this.userId, this.id, this.title, this.body});

  Post.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}

class UserModel {
  int id;
  String name;
  String username;
  String email;
  Address address;
  String phone;
  String website;
  Company company;

  UserModel(
      {this.id,
      this.name,
      this.username,
      this.email,
      this.address,
      this.phone,
      this.website,
      this.company});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
    phone = json['phone'];
    website = json['website'];
    company =
        json['company'] != null ? new Company.fromJson(json['company']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['username'] = this.username;
    data['email'] = this.email;
    if (this.address != null) {
      data['address'] = this.address.toJson();
    }
    data['phone'] = this.phone;
    data['website'] = this.website;
    if (this.company != null) {
      data['company'] = this.company.toJson();
    }
    return data;
  }
}

class Address {
  String street;
  String suite;
  String city;
  String zipcode;
  Geo geo;

  Address({this.street, this.suite, this.city, this.zipcode, this.geo});

  Address.fromJson(Map<String, dynamic> json) {
    street = json['street'];
    suite = json['suite'];
    city = json['city'];
    zipcode = json['zipcode'];
    geo = json['geo'] != null ? new Geo.fromJson(json['geo']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['street'] = this.street;
    data['suite'] = this.suite;
    data['city'] = this.city;
    data['zipcode'] = this.zipcode;
    if (this.geo != null) {
      data['geo'] = this.geo.toJson();
    }
    return data;
  }
}

class Geo {
  String lat;
  String lng;

  Geo({this.lat, this.lng});

  Geo.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    return data;
  }
}

class Company {
  String name;
  String catchPhrase;
  String bs;

  Company({this.name, this.catchPhrase, this.bs});

  Company.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    catchPhrase = json['catchPhrase'];
    bs = json['bs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['catchPhrase'] = this.catchPhrase;
    data['bs'] = this.bs;
    return data;
  }
}

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<UserModel> _users;
  bool _loading;

  @override
  void initState() {
    super.initState();

    _loading = true;
    fetchUsers(http.Client()).then((users) {
      setState(() {
        _users = users;
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_loading ? 'Loading...' : 'Users'),
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          itemCount: _users == null ? 0 : _users.length,
          itemBuilder: (context, index) {
            UserModel user = _users[index];
            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                ListTile(
                  title: Text(user.name),
                  subtitle: Text(user.address.geo.lat),
                  trailing: Text(user.address.city),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

Future<List<UserModel>> fetchUsers(http.Client client) async {
  final response =
      await client.get('https://jsonplaceholder.typicode.com/users');

  return parseUsers(response.body);
}

List<UserModel> parseUsers(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<UserModel>((json) => UserModel.fromJson(json)).toList();
}
