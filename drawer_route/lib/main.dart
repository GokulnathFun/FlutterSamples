import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
//import 'drawer.dart';
import 'item1.dart';
import 'item2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final title = 'Drawer & route';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => myHome(),
        '/item1': (context) => item1(),
        '/item2': (context) => item2(),
      },
    );
  }
}

// ignore: camel_case_types
class myHome extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: SafeArea(
        minimum: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Scaffold(
          appBar: AppBar(
            title: Text('Drawer & Route'),
            backgroundColor: Colors.amber,
          ),

        //--------body---------

          body: SafeArea(child: myHomeBody()),

        //-------drawer---------

          drawer: SafeArea(
            bottom: true,
            child: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  Container(
                    height: 300.0,
                    child: DrawerHeader(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '',
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.amber
                            ),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                          image: AssetImage("images/asunabg.png"),
                          alignment: Alignment.centerRight,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
              //Home Drawer
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                    ),
                    child: ListTile(
                      leading: Icon(Icons.home),
                      title: Text(
                        'Home',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, '/');
                      },
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(child: Divider(color: Colors.amber, thickness: 1.0,),)
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xEBEBE3)
                    ),
                    child: ListTile(
                      leading: Icon(Icons.sensor_door_sharp),
                      title: Text(
                          'Item1',
                          style: TextStyle(fontSize: 18.0),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, '/item1');
                      },
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(child: Divider(color: Colors.amber, thickness: 1.0,),)
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xEBEBE3)
                    ),
                    child: ListTile(
                      leading: Icon(Icons.sensor_door_sharp),
                      title: Text(
                          'Item2',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, '/item2');
                      },
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(child: Divider(color: Colors.amber, thickness: 1.0,),)
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


// ignore: camel_case_types
class myHomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 50,),
          Center(
            child: Row(
              children: [
                Container(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Hello World !',
                      style: TextStyle(color: Colors.black, fontSize: 40.0, fontWeight: FontWeight.bold,),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Container(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                '                    Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                style: TextStyle(color: Colors.black, fontSize: 18.0, wordSpacing: 2, fontStyle: FontStyle.normal, height: 1.5),
                textAlign: TextAlign.justify,

              ),
            ),
          ),

          SizedBox(height: 30.0),
          Container(
            child: Center(
              child: Image.asset("images/5.jpg"),
            ),
          ),
          SizedBox(height: 20,),
          Container(
            child: Center(
              child: ElevatedButton(
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue)),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => item1(title: 'Argument Passed from home'),
                    ),
                  );
                },
                child: Text('Go to item1'),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
