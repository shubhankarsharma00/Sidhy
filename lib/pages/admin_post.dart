import 'package:flutter/material.dart';
import '../style/theme.dart' as Theme;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class AdminPost extends StatefulWidget {
  @override
  _AdminPostState createState() => _AdminPostState();
}

class _AdminPostState extends State<AdminPost> {
  TextEditingController adminpost = new TextEditingController();
  TextEditingController tags = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post News"),
        backgroundColor: Theme.Colors.accentColor,
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            SizedBox(height: 30.0),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Text("Enter Description"),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: adminpost,
                textAlign: TextAlign.left,
                maxLines: 5,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Text("Enter Tag"),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: tags,
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: RaisedButton(
                child: Text("Submit"),
                onPressed: () {
                  setState(() {
                    postNewsfeed();
                    Navigator.pop(context);
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  void postNewsfeed() {
    final String dburl = "https://sidhy-93bdb.firebaseio.com/.json";
    http.Client().get(dburl).then((http.Response res) {
      Map<String, dynamic> data = json.decode(res.body);
      Map<String, dynamic> newsfeed = data['NewsFeed'];

      DateTime now = new DateTime.now();
      String formattedDate = DateFormat('kk:mm:ss \n EEE d MMM').format(now);

      if (newsfeed[tags.text] != null) {
        newsfeed[tags.text].add(adminpost.text + "\n\nPosted by admin on " + formattedDate);
      } else {
        newsfeed[tags.text] = [adminpost.text + "\n\nPosted by admin " + formattedDate];
      }

      http.Client().put(dburl, body: json.encode(data)).then((_) {
        print("done");
      });
    });
  }
}
