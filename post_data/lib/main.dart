import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'user_model.dart';


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
  Welcome _user;

  final TextEditingController  nameController = TextEditingController();
  final TextEditingController  jobController = TextEditingController();

  //Future response
  Future<Welcome> createUser(String name, String jobTitle) async{

    final String url = 'https://reqres.in/api/users';

    final response = await http.post(url, body: {
      "name": name,
      "job": jobTitle
    });

    if(response.statusCode == 201){
      final String responseString = response.body;
      print (responseString);
      return welcomeFromJson(responseString);
    }
    else{
      return null;
    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  hintText: 'Name',
                ),
                controller: nameController,

              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Job',
                ),
                controller: jobController,
              ),

              SizedBox(height: 32),

              //_user == null ? Container() : Text("The user ${_user.name}, ${_user.id} is created Successfully"),

              _user == null ? Container() : output(_user),

              FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                padding: EdgeInsets.all(8.0),
                splashColor: Colors.blueAccent,
                onPressed: () async {
                  final String name = nameController.text;
                  final String jobTitle = jobController.text;

                  final Welcome user = await createUser(name, jobTitle);
                  setState(() {
                    _user = user;
                  });


                },
                child: Text(
                  "Flat Button",
                  style: TextStyle(fontSize: 20.0),
                ),
              )
            ],
          ),

        ),
      ),
    );
  }
}


output(user){
  return Center(
    child: Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Name : ${user.name}'),
            subtitle: Text(
                'The user is created Successfully. \n'
                    'Job id : ${user.id}\n'
                    'Created time : ${user.createdAt}\n'
            ),
          ),
        ],
      ),
    ),
  );

}