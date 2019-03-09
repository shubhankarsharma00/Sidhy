import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/heading.dart';
import '../widgets/charts.dart';
import '../auth.dart';
import '../style/theme.dart' as Theme;
import 'package:wave/wave.dart';
import 'package:wave/config.dart';

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
          // padding: EdgeInsets.all(10.0),
          children: <Widget>[
            Heading("Ongoing Class"),
            _ongoingClass(),
            Heading("Stats"),
            _stats(),
            Heading("News Feed"),
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

  Widget _stats() {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            title: Container(
              height: 100.0,
              child: Heading("Attendence Count"),
            ),
          ),
          ChartWidget(),
        ],
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

  Widget _bottomWave(){
    return SizedBox(
              height: 100.0,
              child: WaveWidget(
                config: CustomConfig(
                  gradients: [
                    [Colors.red, Color(0xEEF44336)],
                    [Colors.red[800], Color(0x77E57373)],
                    [Colors.orange, Color(0x66FF9800)],
                    [Colors.yellow, Color(0x55FFEB3B)]
                  ],
                  durations: [35000, 19440, 10800, 6000],
                  heightPercentages: [0.20, 0.23, 0.25, 0.30],
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
