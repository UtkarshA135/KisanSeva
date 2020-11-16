import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kisanseva/services/authservice.dart';



class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return initScreen(context);
  }


  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = Duration(seconds: 3);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) => AuthService().handleAuth(),
    )
    );
  }

  initScreen(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(backgroundColor: Colors.white,
        body: Center(
          child: Container(height: height/2,width: width/1.2,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/farmer.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        )
    );
  }
}