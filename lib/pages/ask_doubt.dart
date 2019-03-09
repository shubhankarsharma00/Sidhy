import 'package:flutter/material.dart';
import 'package:flutter_fluid_slider/flutter_fluid_slider.dart';

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
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 40.0),
          Text("Send User Confidence Level"),
          SizedBox(height: 40.0),
          FluidSlider(
            value: _value,
            onChanged: (double newValue) {
              setState(() {
                _value = newValue;
              });
            },
            min: 0.0,
            max: 100.0,
          ),
          RaisedButton(
            child: Text("Submit"),
            onPressed: () {},
          ),
          SizedBox(height: 50.0),
          Text("Ask a Doubt"),
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
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
