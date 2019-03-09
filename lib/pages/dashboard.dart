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
                Navigator.pushReplacementNamed(context,"/");
            },
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(gradient: Theme.Colors.primaryGradient),
        child: ListView(
          padding: EdgeInsets.all(10.0),
          children: <Widget>[_ongoingClass(), _newsFeed(), _stats()],
        ),
      ),
    );
  }

  Widget _ongoingClass() {
    return InkWell(child: Card(
      child: Container(
        height: 100.0,
        child: Heading("Ongoing Class:"),
      ),
      
    ),
    onTap: (){
      Navigator.pushNamed(context, '/askdoubt');
    },);
  }

  Widget _stats() {
    return ListTile(
      title: Card(
        child: Container(
          height: 100.0,
        ),
      ),
    );
  }

  Widget _newsFeed() {
    return Column(
      children: newsfeed.map((String news) {
        return ListTile(title: Card(child: Heading(news)));
      }).toList(),
    );
  }
}
