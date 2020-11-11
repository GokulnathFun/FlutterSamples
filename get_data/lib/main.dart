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
  String url = "https://reqres.in/api/unknown";
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
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading: Icon(Icons.supervised_user_circle, size: 50.0,),
                          title:  Text('Id - ${data[index]['id']}', style: TextStyle(fontSize: 20.0),),
                          subtitle: Text(
                              'Name :  ${data[index]['name']}  \n'
                              'Year :  ${data[index]['year']}  \n'
                              'Color :  ${data[index]['color']}  \n'
                              'pantone_value :  ${data[index]['pantone_value']}  \n', style: TextStyle(fontSize: 17.0),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            FlatButton(
                              onPressed: null,
                              color: Colors.blue,
                              textColor: Colors.white,
                              disabledTextColor: Colors.white,
                              disabledColor: Colors.blue,
                              padding: EdgeInsets.all(8.0),
                              splashColor: Colors.blueAccent,
                              child: Text('Edit'),
                            ),
                          ],
                        ),
                      ],
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

    if(response.statusCode == 200){
      setState(() {
        var convertDataToJson = json.decode(response.body);
        data = convertDataToJson['data'];
      });
      print('success');
      return "Success";

    }
    else{
      return "Failed";
    }



  }
}