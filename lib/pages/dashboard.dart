import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/heading.dart';
import '../auth.dart';
import '../style/theme.dart' as Theme;

class DashBoard extends StatefulWidget {
  final BaseAuth auth;
  DashBoard(this.auth);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final List<String> newsfeed = [
    "Math Class at 2:30 PM cancelled!",
    "Football Match at 6PM today"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DASHBOARD"),
        backgroundColor: Colors.blue,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.eject),
            onPressed: () {
              widget.auth.signOut();
              Navigator.pushReplacementNamed(context, "/");
            },
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(gradient: Theme.Colors.primaryGradientDark),
        child: ListView(
          padding: EdgeInsets.all(10.0),
          children: <Widget>[
            Heading("Ongoing Class"),
            _ongoingClass(),
            Heading("News Feed"),
            _newsFeed(),
            Heading("Stats"),
            _stats(),
            SizedBox(height: 100.0),
          ],
        ),
      ),
    );
  }

  Widget _ongoingClass() {
    return InkWell(
      child: Card(
        child: ListTile(
          title: Container(
            height: 100.0,
            child: Heading("Theory Of Computation"),
          ),
          trailing: Heading("3-4PM"),
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, '/askdoubt');
      },
    );
  }

  Widget _stats() {
    return Card(
      child: ListTile(
        title: Container(
          height: 100.0,
          child: Heading("Attendence Count"),
        ),
      ),
    );
  }

  Widget _newsFeed() {
    return Column(
      children: newsfeed.map((String news) {
        return Card(child: ListTile(title: Heading(news)));
      }).toList(),
    );
  }
}
