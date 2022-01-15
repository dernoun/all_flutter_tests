import 'package:flutter/material.dart';

class ManageState extends StatefulWidget {
  @override
  _ManageStateState createState() => _ManageStateState();
}

class _ManageStateState extends State<ManageState> {
  bool _istap = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (_istap) _istap = !_istap;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: _istap ? Colors.grey : Colors.green,
                      border: Border.all(
                        width: 10,
                        color: Colors.white70,
                      ),
                    ),
                    width: 140,
                    height: 140,
                    child: Center(
                        child: _istap
                            ? Text(
                                'Inactive',
                                style: TextStyle(
                                    fontSize: 22.0, color: Colors.white),
                              )
                            : Text(
                                'Active',
                                style: TextStyle(
                                    fontSize: 22.0, color: Colors.white),
                              )),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (!_istap) _istap = !_istap;
                    });
                  },
                  child: Container(
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: _istap ? Colors.green : Colors.grey,
                          border: Border.all(
                            width: 10,
                            color: Colors.white60,
                          )),
                      width: 140,
                      height: 140,
                      child: Center(
                          child: _istap
                              ? Text(
                                  'Active',
                                  style: TextStyle(
                                      fontSize: 22.0, color: Colors.white),
                                )
                              : Text(
                                  'Inactive',
                                  style: TextStyle(
                                      fontSize: 22.0, color: Colors.white),
                                ))),
                )
              ],
            ),
          ),
        ));
  }
}
