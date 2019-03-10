import 'package:flutter/material.dart';
import '../style/theme.dart' as Theme;

class Heading extends StatelessWidget {
  final String text;
  final Color color;
  Heading(this.text, {this.color = Theme.Colors.darkColor});
  @override
  Widget build(BuildContext context) {
    return Padding(child: Text(
      text,
      style:
          TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: color),
    ), padding: EdgeInsets.all(20.0),
    );
  }
}
