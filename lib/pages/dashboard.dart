import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // Navigate back to first screen when tapped!
            Navigator.pushReplacementNamed(context,"/");
          },
          child: Text('LOGOUT!'),
        ),
      ),
    );
  }
}
