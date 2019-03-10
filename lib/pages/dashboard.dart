import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/heading.dart';
import '../widgets/charts.dart';
import '../auth.dart';
import '../style/theme.dart' as Theme;
import 'package:wave/wave.dart';
import 'package:wave/config.dart';
import '../widgets/alertDialog.dart';

class DashBoard extends StatefulWidget {
  final BaseAuth auth;

  DashBoard(this.auth);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  Widget alertDialog = AlertDialoge();
  final List<String> newsfeed = [
    "Math Class at 2:30 PM cancelled!",
    "Football Match at 6PM today"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DASHBOARD"),
        backgroundColor: Theme.Colors.accentColor,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.eject),
            onPressed: () {
              widget.auth.signOut();
              Navigator.pushReplacementNamed(context, "/");
            },
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialoge());
            },
          )
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: Theme.Colors.primaryColor,
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                decoration:
                    BoxDecoration(color: Theme.Colors.darkColor),
                accountName: Text("User"),
                accountEmail: Text(widget.auth.currentUser().email),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Theme.Colors.accentColor,
                  child: Text(
                    widget.auth.currentUser().email.substring(0, 1),
                    style: TextStyle(fontSize: 40.0, color: Colors.white),
                  ),
                ),
              ),
              ListTile(
                title: Text("Dashboard"),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text("ClassRoom"),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/askdoubt');
                },
              ),
              ListTile(
                title: Text("Admin Post"),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.pop(context);
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialoge(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(gradient: Theme.Colors.primaryGradientDark),
        child: ListView(
          // padding: EdgeInsets.all(10.0),
          children: <Widget>[
            Heading(
              "Ongoing Class",
              color: Theme.Colors.lightColor,
            ),
            _ongoingClass(),
            Heading(
              "Stats",
              color: Theme.Colors.lightColor,
            ),
            _stats(context),
            Heading(
              "News Feed",
              color: Theme.Colors.lightColor,
            ),
            _newsFeed(),
            SizedBox(height: 50.0),
            _bottomWave(),
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

  Widget _stats(BuildContext context) {
    return InkWell(
      child: Card(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Container(
                height: 100.0,
                child: Heading("Attendance Count"),
              ),
            ),
            // ChartWidget(),
            Image.asset("assets/chart.png"),
          ],
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, "/attendance");
      },
    );
  }

  Widget _newsFeed() {
    return Column(
      children: newsfeed.map((String news) {
        return Card(child: ListTile(title: Heading(news)));
      }).toList(),
    );
  }

  Widget _bottomWave() {
    return SizedBox(
      height: 100.0,
      child: WaveWidget(
        config: CustomConfig(
          gradients: [
            [Colors.red, Color(0xEEF44336)],
            [Colors.orange, Color(0x66FF9800)],
            [Colors.yellow, Color(0x55FFEB3B)],
            [Colors.red[800], Color(0x77E57373)],
          ],
          durations: [35000, 19440, 10800, 6000],
          heightPercentages: [0.20, 0.23, 0.05, 0.10],
          blur: MaskFilter.blur(BlurStyle.solid, 10),
          gradientBegin: Alignment.bottomLeft,
          gradientEnd: Alignment.topRight,
        ),
        // backgroundColor: Colors.blue,
        size: Size(double.infinity, double.infinity),
      ),
    );
  }
}
