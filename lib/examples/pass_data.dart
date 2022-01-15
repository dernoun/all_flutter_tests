import 'package:flutter/material.dart';
import 'package:startup_namer/model/todo_model.dart';

class PassData extends StatefulWidget {
  @override
  _PassDataState createState() => _PassDataState();
}

class _PassDataState extends State<PassData> {
  final todos = new List<Todo>.generate(20, (i) {
    return Todo(
      id: 'Todo $i',
      description: 'A description of what needs to be done for Todo $i',
    );
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: ListView.builder(
            itemCount: todos.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(todos[index].id),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(),
                      settings: RouteSettings(
                        arguments: todos[index],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Todo todo = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.id),
      ),
      body: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(todo.description),
        ),
      ),
    );
  }
}
