import 'dart:convert';

import 'package:startup_namer/model/json_model.dart';
import 'package:http/http.dart' as http;

Future<List<User>> fetchUsers(http.Client client) async {
  final response =
      await client.get('https://jsonplaceholder.typicode.com/users');

  return parseUsers(response.body);
}

List<User> parseUsers(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<User>((json) => User.fromJson(json)).toList();
}

List<Post> parsePosts(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Post>((json) => Post.fromJson(json)).toList();
}

Future<List<Post>> fetchPosts(http.Client client, int userId) async {
  final response = await client
      .get('https://jsonplaceholder.typicode.com/posts?userId=$userId');

  return parsePosts(response.body);
}

List<Photo> parsePhotos(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
}

Future<List<Photo>> fetchPhotos({http.Client client, int postId}) async {
  final response = await client
      .get('https://jsonplaceholder.typicode.com/photos?albumId=$postId');

  return parsePhotos(response.body);
}
