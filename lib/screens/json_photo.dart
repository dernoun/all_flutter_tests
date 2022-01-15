import 'package:flutter/material.dart';
import 'package:startup_namer/examples/json_parse_bg_test.dart';
import 'package:startup_namer/model/json_model.dart';
import 'package:http/http.dart' as http;

class PostPhotos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Post post = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title),
      ),
      body: Container(
        child: FutureBuilder<List<Photo>>(
          future: fetchPhotos(client: http.Client(), postId: post.id),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? PhotosList(photos: snapshot.data)
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
      ),
    );
  }
}

class PhotosList extends StatelessWidget {
  final List<Photo> photos;

  PhotosList({Key key, this.photos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: photos.length,
      itemBuilder: (context, index) {
        return Image.network(photos[index].thumbnailUrl);
      },
    );
  }
}
