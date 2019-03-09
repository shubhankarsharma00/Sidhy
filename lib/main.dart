import 'package:flutter/material.dart';
import './pages/dashboard.dart';
import './pages/login_page.dart';
import './auth.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {

  final BaseAuth auth = new Auth();

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'SIDHY',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),

      // Start the app with the "/" named route. In our case, the app will start
      // on the FirstScreen Widget
      initialRoute: '/',
      routes: {
        // When we navigate to the "/" route, build the FirstScreen Widget
        '/': (context) => LoginPage(auth),
        // When we navigate to the "/second" route, build the DashBoard Widget
        '/dashboard': (context) => DashBoard(auth),
      },
    );
  }
}

