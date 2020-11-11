import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

void main() {
  runApp(new MaterialApp(
    home: new HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String url = "https://swapi.co/api/people/";
  List data;

  /*onCreate*/
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getJSONData(); //method
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text("my JSON app")),
      body: new ListView.builder(
        // itemCount: 1,
        //itemCount: data==null ? 0 :data.length ,
        itemCount: data == null ? 0 : data.length,

        itemBuilder: (BuildContext context, int index) {
          return new Container(
            child: new Center(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  new Card(
                    child: new Container(
                      child: new Text(data[index]['name'] ?? ''),
                      padding: EdgeInsets.all(20),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  /*method*/ //RT is Future<String>
  Future<String> getJSONData() async {
    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
    print(response.body);
    debugPrint(response.body);

    setState(() {
      var convertDataToJson = json.decode(response.body);
      data = convertDataToJson['results'];
    });

    return "Success";
  }
}