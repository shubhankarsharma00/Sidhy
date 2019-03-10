import 'package:flutter/material.dart';
import '../widgets/heading.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../style/theme.dart' as Theme;
class NewsFeed extends StatefulWidget {
  @override
  _NewsFeedState createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {
  List<String> news = [];
  List<String> tags = [];
  String query="All";
  @override
  void initState() {
    super.initState();
    getNewsfeed();
  }

  @override
  Widget build(BuildContext context) {
    print(query);
    List<Widget>tagList=[RaisedButton(color:Theme.Colors.lightColor,child: Text("All"),onPressed: (){
      setState(() {
        query="All";
        getNewsfeed();
      });
    },)];
    tagList.addAll(tags.map((String tag){
      return RaisedButton(color:Theme.Colors.lightColor, onPressed: (){
        setState(() {
          query=tag;
          getNewsfeed();
        });
      },child: Text(tag),);
    }));
    List<Widget> lst = [
      ButtonBar(
        mainAxisSize: MainAxisSize.min,
       children:tagList ),
    ];
    lst.addAll(news.map((String news_new) {
      return Card(child: ListTile(title: Heading(news_new)));
    }).toList());

    return Column(
      children: lst,
    );
    //  Row(
    //     children:
    //   );
    // }
    //   children: news.map((String news_new) {
    //     return Card(child: ListTile(title: Heading(news_new)));
    //   }).toList(),
    // );
  }

  void getNewsfeed() {
    final String dburl = "https://sidhy-93bdb.firebaseio.com/.json";
    http.Client().get(dburl).then((http.Response res) {
      Map<String, dynamic> data = json.decode(res.body);
      Map<String, dynamic> newsfeed = data['NewsFeed'];

      setState(() {
        news=[];
        tags=[];
        for (String tag in newsfeed.keys) {
          tags.add(tag);
          if(tag==query || query=="All"){
            print(query);
            List<dynamic> newsarr = newsfeed[tag];
            for (String val in newsarr) {
              news.add(val);
            }
          }
        }
      });
      print(news);
    });
  }
}
