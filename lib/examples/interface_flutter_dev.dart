
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Description ',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Flutter layout demo'),
          ),
          // body: Center(child: FavoriteWidget()),
          body: ListView(
            children: <Widget>[
              Image.asset(
                'images/lake.jpg',
                width: 600,
                height: 240,
                fit: BoxFit.cover,
              ),
              titleSection,
              iconsSection,
              textSection,
            ],
          ),
        ));
  }
}

Widget titleSection = Container(
  padding: const EdgeInsets.all(32),
  child: Row(
    children: [
      Expanded(
        /*1*/
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*2*/
            Container(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                'Oeschinen Lake Campground',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              'Kandersteg, Switzerland',
              style: TextStyle(
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      ),
      /*3*/
      FavoriteWidget(),
    ],
  ),
);

class BuildButtonColumn extends StatefulWidget {
  final Color color;
  final IconData icon;
  final String label;

  const BuildButtonColumn(this.color, this.icon, this.label);

  @override
  _BuildButtonColumnState createState() => _BuildButtonColumnState();
}

class _BuildButtonColumnState extends State<BuildButtonColumn> {
  bool _isFavorited = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: Icon(widget.icon,
              color: _isFavorited ? widget.color : Colors.red),
          onPressed: () {
            _changeIconWidget();
          },
        ),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            widget.label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: _isFavorited ? widget.color : Colors.red,
            ),
          ),
        )
      ],
    );
  }

  void _changeIconWidget() {
    setState(() {
      if (_isFavorited)
        _isFavorited = false;
      else
        _isFavorited = true;
    });
  }
}

Widget iconsSection = Container(
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      BuildButtonColumn(Colors.blue, Icons.phone, "CALL"),
      BuildButtonColumn(Colors.blue, Icons.near_me, "ROUTE"),
      BuildButtonColumn(Colors.blue, Icons.share, "SHARE"),
    ],
  ),
);

Widget textSection = Container(
  padding: const EdgeInsets.all(32),
  child: Text(
    'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
    'Alps. Situated 1,578 meters above sea level, it is one of the '
    'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
    'half-hour walk through pastures and pine forest, leads you to the '
    'lake, which warms to 20 degrees Celsius in the summer. Activities '
    'enjoyed here include rowing, and riding the summer toboggan run.',
    softWrap: true,
  ),
);

class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            icon: Icon(_isFavorited ? Icons.star : Icons.star_border),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 18,
          child: Container(
            child: Text('$_favoriteCount'),
          ),
        )
      ],
    );
  }

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _isFavorited = false;
        _favoriteCount -= 1;
      } else {
        _isFavorited = true;
        _favoriteCount += 1;
      }
    });
  }
}
