import 'package:flutter/material.dart';
import 'package:kisanseva/screens/rent_tools/my_home_page.dart';
import 'package:kisanseva/screens/smartConnect/smartConnect.dart';
import 'package:kisanseva/services/authservice.dart';

import 'smartConnect/connect.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.limeAccent,
          title: Text(
            "Kisan Seva",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(
                Icons.exit_to_app,
                color: Colors.black,
              ),
              onPressed: () async {
                AuthService().signOut();
                Navigator.pushReplacement(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => AuthService().handleAuth()));
              },
            )
          ]),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => smartConnect()));
                },
                child: Text("Smart Connect"),
              )
            ],
          ),
          Center(
            child: RaisedButton(
              color: Colors.yellow,
              child: Text("Rent Tools"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage()),
                );
              },
            ),
          ),
        ],
      ),
    ));
  }
}
