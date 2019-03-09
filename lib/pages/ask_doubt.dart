import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_fluid_slider/flutter_fluid_slider.dart';
import 'package:http/http.dart' as http;
import '../style/theme.dart' as Theme;

class AskDoubt extends StatefulWidget {
  @override
  _AskDoubtState createState() => _AskDoubtState();
}

class _AskDoubtState extends State<AskDoubt> {
  double _value = 0.0;
  String _question;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ask a Doubt"),
        backgroundColor: Theme.Colors.darkColor,
      ),
      body: Container(
        color: Theme.Colors.primaryColorDarker,
        child: ListView(
          padding: EdgeInsets.all(10.0),
          children: <Widget>[
            Card(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 10.0),
                    Text(
                      "Send Your Confidence Level",
                      style: TextStyle(fontSize: 18.0),
                    ),
                    SizedBox(height: 100.0),
                    FluidSlider(
                      value: _value,
                      sliderColor: Theme.Colors.accentColor,
                      onChanged: (double newValue) {
                        setState(() {
                          _value = newValue;
                        });
                      },
                      min: 0.0,
                      max: 100.0,
                    ),
                    SizedBox(height: 10.0),
                    RaisedButton(child: Text("Submit"), onPressed: increment),
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 10.0),
                    Text("Ask a Doubt",style: TextStyle(fontSize: 18.0)),
                    SizedBox(height: 40.0),
                    TextField(
                      maxLines: 5,
                      onChanged: (String text) {
                        setState(() {
                          _question = text;
                        });
                      },
                    ),
                    SizedBox(height: 20.0),
                    RaisedButton(
                      child: Text("Submit"),
                      onPressed: () {
                        submitDoubt();
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void increment() {
    final String dburl = "https://sidhy-33818.firebaseio.com/confidence.json";
    http.Client().get(dburl).then((http.Response res) {
      String range;
      if (_value < 25) {
        range = "0-25";
      } else if (_value < 50) {
        range = "25-50";
      } else if (_value < 75) {
        range = "50-75";
      } else {
        range = "75-100";
      }
      Map<String, dynamic> nums = json.decode(res.body);
      nums[range]++;
      http.Client().put(dburl, body: json.encode(nums)).then((_) {
        print("done");
      });
    });
  }

  void submitDoubt() {
     final String dburl = "https://sidhy-33818.firebaseio.com/.json";
     http.Client().get(dburl).then((http.Response res){
       Map<String, dynamic> data = json.decode(res.body);
       List<dynamic> qs = data['question'];
       qs.add(_question);
        http.Client().put(dburl, body: json.encode(data)).then((_) {
        print("done");
      });
     });
  }
}
