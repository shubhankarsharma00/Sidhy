import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/heading.dart';
import '../auth.dart';


class DashBoard extends StatefulWidget {
  final BaseAuth auth;
  DashBoard(this.auth);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DASHBOARD"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.eject),
            onPressed: () {
              widget.auth.signOut();
                Navigator.pushReplacementNamed(context,"/");
            },
          )
        ],
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
    return InkWell(child: Card(
      child: Container(
        height: 100.0,
      ),
      
    ),
    onTap: (){
      Navigator.pushNamed(context, '/askdoubt');
    },);
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
