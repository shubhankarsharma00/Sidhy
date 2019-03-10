import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:charts_flutter/flutter.dart';

class ChartWidget extends StatefulWidget {
  @override
  _ChartWidgetState createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget> {
  List<int> data;
  bool loaded = false;

  @override
  void initState() {
    super.initState();
    var client = new Client();
    client
        .get("https://test2-d84a7.firebaseio.com/stuff.json")
        .then((Response serverData) {
      Map<String, dynamic> stuff = jsonDecode(serverData.body);
      setState(() {
        data = stuff['data'].cast<int>();
        loaded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: loaded
          ? ChartDisplay(data)
          : SizedBox(
              height: 300.0,
              child: Center(
                child: CircularProgressIndicator(),
              )),
      height: 300.0,
    );
  }
}

class ChartDisplay extends StatelessWidget {
  final List<int> data;
  ChartDisplay(this.data);
  final colors = [
    MaterialPalette.red,
    MaterialPalette.teal,
    MaterialPalette.purple,
    MaterialPalette.green,
    MaterialPalette.indigo
  ];

  _series() {
    print(this.data);
    return [
      new Series(
        id: "data",
        data: this.data,
        domainFn: (int datum, int index) {
          return index.toString();
        },
        measureFn: (int datum, int index) {
          return datum;
        },
        colorFn: (int datum, int index) => colors[index].shadeDefault,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        child: BarChart(
          _series(),
        ),
        onTap: () {
          Navigator.pushNamed(context, '/attendance');
        },
      ),
      height: 300.0,
    );
  }
}
