import 'package:flutter/material.dart';
import '../style/theme.dart' as Theme;
import 'package:http/http.dart' as http;
import 'dart:convert';

class AdminPost extends StatefulWidget {
  @override
  _AdminPostState createState() => _AdminPostState();
}

class _AdminPostState extends State<AdminPost> {
  TextEditingController adminpost = new TextEditingController();
  TextEditingController tags = new TextEditingController();
  var now = new DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post News"),
        backgroundColor: Theme.Colors.darkColor,
      ),
      body: Container(
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
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
                    // post[tags.text] = adminpost.text + "\n" + now.toString();
                    // print(post);
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

      if (newsfeed[tags.text] != null) {
        newsfeed[tags.text].add(adminpost.text + "\n\n" + now.toString());
      } else {
        newsfeed[tags.text] = [adminpost.text + "\n\nDate" + now.toString()];
      }

      http.Client().put(dburl, body: json.encode(data)).then((_) {
        print("done");
      });
    });
  }
}
