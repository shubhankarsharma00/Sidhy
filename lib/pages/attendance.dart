import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/heading.dart';
import '../widgets/charts.dart';
import '../auth.dart';
import '../style/theme.dart' as Theme;
import 'package:wave/wave.dart';
import 'package:wave/config.dart';
import '../widgets/alertDialog.dart';

class AttendancePage extends StatefulWidget {
  @override
  _AttendancePageState createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manage Attendance"),
        backgroundColor: Theme.Colors.darkColor,
      ),
      body: Container(
        child: Card(
          child: Column(
            children: <Widget>[
              ListTile(
                title: Container(
                  height: 100.0,
                  child: Heading("Attendance Count"),
                ),
              ),
              ChartWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
