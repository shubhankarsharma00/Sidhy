import 'package:flutter/material.dart';
import '../style/theme.dart' as Theme;

class Heading extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final FontWeight wt;
  Heading(this.text, {this.color = Theme.Colors.darkColor, this.size = 16.0, this.wt = FontWeight.bold});
  @override
  Widget build(BuildContext context) {
    return Padding(
      child: Text(
        text,
        style: TextStyle(
          fontSize: size,
          fontWeight: wt,
          color: Theme.Colors.darkColor,
        ),
      ),
      padding: EdgeInsets.all(20.0),
    );
  }
}
