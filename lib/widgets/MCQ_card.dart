import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../style/theme.dart' as Theme;
import 'dart:convert';
import 'dart:async';

class MCQCard extends StatefulWidget {
  @override
  _MCQCardState createState() => _MCQCardState();
}

class _MCQCardState extends State<MCQCard> {
  var _timeRemaining = Duration(seconds: 20);
  bool _submitted = false;
  String _selected;
  String _correctAns;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), everySecond);
  }

  void everySecond() {
    if(!mounted) return;
    setState(() {
      _timeRemaining -= Duration(seconds: 1);
    });
    if(_timeRemaining.inSeconds > 0)
      Timer(Duration(seconds: 1), everySecond);
    else
      _checkans();
  }

  void _checkans(){
    _correctAns = "C";
  }

  String _getTimeRem() {
    String a = (_timeRemaining.inMinutes.toString());
    String b = (_timeRemaining.inSeconds%60).toString();
    if (a.length < 2) a = '0' + a;
    if (b.length < 2) b = '0' + b;
    return a + ":" + b;
  }

  Color _getColor(String s) {
    if (!_submitted) {
      return Colors.blue;
    } else {
      if(_correctAns == null){
        if (s == _selected) {
          return Colors.orange;
        } else {
          return Colors.grey;
        }
      } else {
        if (_correctAns == _selected){
          if (s == _selected){
            return Colors.green;
          } else {
            return Colors.grey;
          }
        } else {
          if (s == _selected){
            return Colors.red;
          } else {
            return (s == _correctAns) ? Colors.green : Colors.grey;
          }
        }
      }
    }
  }

  void _pressFAB(String s) {
    final String dburl = "https://sidhy-33818.firebaseio.com/votes";
    setState(() {
      _selected = s;
      _submitted = true;
    });
    http.Client().get(dburl + ".json").then((http.Response res) {
      print("FAB $s: ${res.body}");
      int num = json.decode(res.body)[s];
      http.Client().put(dburl + "/$s.json", body: json.encode(num+1)).then((_) {
        setState(() {
          print("muh.");
        });
      });
    });
  }

  Widget _buildFAB(String s) {
    return Expanded(
      child: FloatingActionButton(
        heroTag: null,
        child: Text(s),
        backgroundColor: _getColor(s),
        onPressed: () {
          if (!_submitted) _pressFAB(s);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 10.0),
            Text("MCQ Question", style: TextStyle(fontSize: 18.0)),
            SizedBox(height: 30.0),
            Text(
              _getTimeRem(),
              style: TextStyle(fontSize: 32.0),
            ),
            SizedBox(height: 30.0),
            Row(
              children: <Widget>[
                _buildFAB("A"),
                _buildFAB("B"),
                _buildFAB("C"),
                _buildFAB("D"),
              ],
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
