import 'package:flutter/material.dart';
import 'package:startup_namer/examples/json_parse_bg_test.dart';
import 'package:startup_namer/model/json_model.dart';
import 'package:http/http.dart' as http;
import 'package:startup_namer/screens/json_photo.dart';

class PostList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final User user = ModalRoute.of(context).settings.arguments;
    print(user.toJson());
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
      ),
      body: Container(
        child: FutureBuilder<List<Post>>(
          future: fetchPosts(http.Client(), user.id),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? UserPost(posts: snapshot.data)
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
      ),
    );
  }
}

class UserPost extends StatelessWidget {
  final List<Post> posts;

  const UserPost({Key key, this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: ListTile(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    settings: RouteSettings(
                      arguments: posts[index],
                    ),
                    builder: (BuildContext context) {
                      return PostPhotos();
                    })),
            title: Text(posts[index].title),
            subtitle: Text(posts[index].body),
            isThreeLine: true,
          ),
        );
      },
    );
  }
}
