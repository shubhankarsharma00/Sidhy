import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/heading.dart';
import '../widgets/charts.dart';
import '../auth.dart';
import '../style/theme.dart' as Theme;
import 'package:wave/wave.dart';
import 'package:wave/config.dart';
import '../widgets/steppertouch.dart';
import '../widgets/alertDialog.dart';

class AttendancePage extends StatefulWidget {
  @override
  _AttendancePageState createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  Map<String, int> attendance = {"TOC": 12, "Maths": 20, "Physics": 11};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manage Attendance"),
        backgroundColor: Theme.Colors.accentColor,
      ),
      body: ListView(children: <Widget>[
        ListTile(
          title: Container(
            height: 100.0,
            child: Heading("Attendance Count",),
          ),
        ),
        Card(
          child: ChartWidget(attendance),
        ),
        SizedBox(height: 20.0),
        _makeCards(),
      ]),
    );
  }

  Widget _subjectCard(String s) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 0.0),
      child: Card(
        child: ListTile(
            title: Text(s),
            trailing: StepperTouch(
              color1: Theme.Colors.primaryColor,
              color2: Theme.Colors.accentColor,
              initialValue: attendance[s],
              onChanged: (int x) {
                setState(() {
                  attendance[s] = x;
                });
              },
            )),
      ),
    );
  }

  Widget _makeCards() {
    List<String> subjects = attendance.keys.toList();
    return Column(
      children: subjects.map((sub) => _subjectCard(sub)).toList(),
    );
  }
}
