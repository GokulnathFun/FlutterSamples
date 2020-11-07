import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.data' as http;


void main() {
  runApp(MaterialApp(
    home: PostData(),
  ));
}


class PostData extends StatefulWidget {
  @override
  _PostDataState createState() => _PostDataState();
}

class _PostDataState extends State<PostData> {

  final String url= 'https://swapi.dev/api/starships/';
   List data;

   Future<String> getSWData() async{
     var res = await http.get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

     setState(() {
       var resBody = json.decode(res.body);
       data = resBody['results'];
     });

     return 'success';
   }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StarShips'),
        backgroundColor: Colors.amberAccent,
      ),
      body: ListView.builder(

      ),
    );
  }
}


