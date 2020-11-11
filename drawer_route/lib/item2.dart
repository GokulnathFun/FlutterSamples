import 'package:flutter/material.dart';

// ignore: camel_case_types
class item2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item 2'),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child: Text('Go Back'),
        ),
      ),
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
              SizedBox(
                height: 10.0,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xEBEBE3),
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
                    color: Colors.grey
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
    );
  }
}
