import 'package:flutter/material.dart';
import 'package:test_flutter/pages/dashboard.dart';
import 'pages/login_page.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'TheGorgeousLogin',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),

      // Start the app with the "/" named route. In our case, the app will start
      // on the FirstScreen Widget
      initialRoute: '/',
      routes: {
        // When we navigate to the "/" route, build the FirstScreen Widget
        '/': (context) => LoginPage(),
        // When we navigate to the "/second" route, build the DashBoard Widget
        '/dashboard': (context) => DashBoard(),
      },
    );
  }
}

