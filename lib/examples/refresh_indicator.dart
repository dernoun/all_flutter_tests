import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<Photo>> fetchPhotos(http.Client client) async {
  final response =
      await client.get('https://jsonplaceholder.typicode.com/photos');

  // Use the compute function to run parsePhotos in a separate isolate
  return compute(parsePhotos, response.body);
}

// A function that will convert a response body into a List<Photo>
List<Photo> parsePhotos(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
}

class Photo {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Photo({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      albumId: json['albumId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      url: json['url'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
    );
  }
}

class MyAppRefreshIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        child: FutureBuilder<List<Photo>>(
          future: fetchPhotos(http.Client()),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);

            return snapshot.hasData
                ? RefreshIndicator(
                    child: PhotosList(photos: snapshot.data, count: _count + 2),
                    onRefresh: _refreshhandle,
                  )
                : Center(child: CircularProgressIndicator());
          },
        ),
        padding: EdgeInsets.fromLTRB(1.0, 10.0, 1.0, 10.0),
      ),
    );
  }

  Future<Null> _refreshhandle() async {
    setState(() {
      _count++;
    });
    return null;
  }
}

class PhotosList extends StatelessWidget {
  final List<Photo> photos;
  final int count;
  PhotosList({Key key, this.photos, this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: count,
      itemBuilder: (context, index) {
        return Column(
          children: <Widget>[
            Container(
                constraints: BoxConstraints.expand(
                  height: Theme.of(context).textTheme.display1.fontSize * 1.1 +
                      200.0,
                ),
                color: Colors.white10,
                alignment: Alignment.center,
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        leading: Image.network(
                          photos[count - index - 1].thumbnailUrl,
                          fit: BoxFit.fitWidth,
                        ),
                        title: Text(photos[count - index - 1].title),
                        subtitle: Text(photos[count - index - 1].title),
                      ),
                      // ButtonTheme.bar(
                      //   // make buttons use the appropriate styles for cards
                      //   child: ButtonBar(
                      //     children: <Widget>[
                      //       FlatButton(
                      //         child: const Text('Open'),
                      //         onPressed: () {/* ... */},
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                )),
          ],
        );
      },
    );
  }
}
