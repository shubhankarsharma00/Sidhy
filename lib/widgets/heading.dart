import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  final String text;
  Heading(this.text);
  @override
  Widget build(BuildContext context) {
    return Padding(child: Text(
      text,
      style:
          TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
    ), padding: EdgeInsets.all(20.0),
    );
  }
}
