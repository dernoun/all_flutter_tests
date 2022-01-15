import 'package:flutter/material.dart';
import 'package:startup_namer/examples/json_parse_bg_test.dart';
import 'package:startup_namer/model/json_model.dart';
import 'package:http/http.dart' as http;
import 'package:startup_namer/screens/json_post.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Social Network'),
        ),
        body: Container(
          child: FutureBuilder<List<User>>(
            future: fetchUsers(http.Client()),
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);
              return snapshot.hasData
                  ? UserList(users: snapshot.data)
                  : Center(
                      child: CircularProgressIndicator(),
                    );
            },
          ),
        ),
      ),
    );
  }
}

class UserList extends StatelessWidget {
  final List<User> users;

  UserList({Key key, this.users}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => PostList(),
                  settings: RouteSettings(
                    arguments: users[index],
                  ),
                ),
              );
            },
            title: Text(
              users[index].name,
            ),
            subtitle: Text(
              users[index].email,
            ),
            leading: Icon(
              Icons.face,
              color: Colors.blue,
            ),
          ),
        );
      },
    );
  }
}

enum Entitys { SHIP, PORT }
