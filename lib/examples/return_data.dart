import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Returning Data Demo'),
        ),
        body: Center(
          child: SelectionButton(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          onTap: (newIndex) {
            setState(() {
              _index = newIndex;
            });
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              title: Text('home'),
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              title: Text('home'),
              icon: Icon(Icons.add_to_home_screen),
            ),
            BottomNavigationBarItem(
              title: Text('home'),
              icon: Icon(Icons.hourglass_empty),
            ),
          ],
        ),
      ),
    );
  }
}

class SelectionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        _navigateAndDisplaySelection(context);
      },
      child: Text('Pick an option, any option!'),
    );
  }

  _navigateAndDisplaySelection(context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SecondScreen(),
      ),
    );
    Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text("$result")));
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Pick an option'),
      ),
      body: Center(
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
              color: Colors.lightBlue,
              child: Text('Yep!'),
              onPressed: () {
                Navigator.pop(context, 'Yep!');
              },
            ),
            RaisedButton(
              color: Colors.lightBlue,
              child: Text('Nop'),
              onPressed: () {
                Navigator.pop(context, 'Nop');
              },
            )
          ],
        ),
      ),
    );
  }
}
