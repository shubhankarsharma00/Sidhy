import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../style/theme.dart' as Theme;
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../widgets/subjectCard.dart';
import '../widgets/heading.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DASHBOARD"),
      ),
      body: Container(
        child: ListView(
          padding: EdgeInsets.all(10.0),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Heading("Ongoing Class"),
                  _ongoingClass(),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Heading("Stats"),
                  _stats(),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Heading("News Feed"),
                  _newsFeed(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _ongoingClass() {
    return Card(
      child: Container(
        height: 100.0,
      ),
    );
  }

  Widget _stats() {
    return Card(
      child: Container(
        height: 100.0,
      ),
    );
  }

  Widget _newsFeed() {
    return Card(
      child: Container(
        height: 100.0,
      ),
    );
  }
}
