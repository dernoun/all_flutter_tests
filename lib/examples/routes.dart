import 'package:flutter/material.dart';
import 'package:startup_namer/examples/awesome_dialog.dart';
import 'package:startup_namer/examples/refresh_indicator.dart';
import 'package:startup_namer/screens/json_user.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    //Get arguments passed in Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => WelcomePage());
      case '/second':
        return MaterialPageRoute(builder: (_) => MyAppRefreshIndicator());
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
