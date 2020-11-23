

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:kisanseva/models/app_localization.dart';
import 'package:kisanseva/screens/Yield/result.dart';
class Yield extends StatefulWidget {
  @override
  _YieldState createState() => _YieldState();
}

class _YieldState extends State<Yield> {
  @override
  Widget build(BuildContext context) {
    return FirebaseRealtimeDemoScreen();
  }
}


class FirebaseRealtimeDemoScreen extends StatefulWidget {

  @override
  _FirebaseRealtimeDemoScreenState createState() => _FirebaseRealtimeDemoScreenState();
}

class _FirebaseRealtimeDemoScreenState extends State<FirebaseRealtimeDemoScreen> {
  
      GlobalKey<FormState> _key = new GlobalKey();
FirebaseUser user;
  bool _validate = false;

  double ahumid, atemp, rainfall,sph,shumid;

  final databaseReference = FirebaseDatabase.instance.reference();
@override
  void initState() {
    // TODO: implement initState
    getuser();
    super.initState();
  }
  getuser()
async{
  user = await FirebaseAuth.instance.currentUser();
}  @override
  Widget build(BuildContext context) {
    readData();

    return Scaffold(
      appBar: AppBar(
        title: Text(  AppLocalizations.of(context)
                                            .translate ('Crop Prediction'), ),
        centerTitle: true,
      ),
      body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
            
              children: <Widget>[
                Center(
                  child : Text(AppLocalizations.of(context)
                                            .translate ("Lets Predict your crop"),
                  style: TextStyle(
                    fontSize: 25
                  )
                  
                  ))
                  
              
                ,
                SizedBox(height:5.0),

             new Form(
              key: _key,
              autovalidate: _validate,
              child: FormUI(),
            ),
              ],
            ),
          )
      ), //center
    );
  }

 Widget FormUI() {
    return new Column(
      children: <Widget>[
        new TextFormField(
          keyboardType: TextInputType.number,
          decoration: new InputDecoration(hintText: AppLocalizations.of(context)
                                            .translate ('Air Humidity')),
          maxLength: 32,
          validator: validateName,
          onSaved: (String val) {
            ahumid = double.parse(val);
          },
        ),
        new TextFormField(
            decoration: new InputDecoration(hintText: AppLocalizations.of(context)
                                            .translate ('Air Temperature')),
            keyboardType: TextInputType.number,
            maxLength: 10,
            validator: validateMobile,
            onSaved: (String val) {
              atemp= double.parse(val);
            }),
        new TextFormField(
            decoration: new InputDecoration(hintText: AppLocalizations.of(context)
                                            .translate ('Rainfall')),
            keyboardType: TextInputType.number,
            maxLength: 32,
            validator: validateEmail,
            onSaved: (String val) {
              rainfall= double.parse(val);
            }),
              new TextFormField(
          keyboardType: TextInputType.number,
          decoration: new InputDecoration(hintText:AppLocalizations.of(context)
                                            .translate ('Soil Humidity') ),
          maxLength: 32,
          validator: validateName,
          onSaved: (String val) {
            shumid = double.parse(val);
          },
        ),
          new TextFormField(
          keyboardType: TextInputType.number,
          decoration: new InputDecoration(hintText: AppLocalizations.of(context)
                                            .translate ('Soil pH') ),
          maxLength: 15,
          validator: validateName,
          onSaved: (String val) {
            sph = double.parse(val);
          },
        ),
        new SizedBox(height: 15.0),
        new RaisedButton(
          onPressed: _sendToServer,
          child: new Text(AppLocalizations.of(context)
                                            .translate ('Send')),
        )
      ],
    );
  }

  Future <void> createData(){
    databaseReference.child("Realtime").update({
      'Air Humidity': ahumid,
      'Air Temp':atemp,
      'Rainfall': rainfall,
      'Soil Humidity':shumid,
      'Soil pH':sph
      
    });
    
  }

  void readData(){
    databaseReference.child("Realtime").once().then((DataSnapshot snapshot) {

      print('Data : ${snapshot.value}');
    });
  }

  void updateData(){
    databaseReference.child('flutterDevsTeam1').update({
      'description': 'CEO'
    });
    databaseReference.child('flutterDevsTeam2').update({
      'description': 'Team Lead'
    });
    databaseReference.child('flutterDevsTeam3').update({
      'description': 'Senior Software Engineer'
    });
  }

  void deleteData(){
    databaseReference.child('flutterDevsTeam1').remove();
    databaseReference.child('flutterDevsTeam2').remove();
    databaseReference.child('flutterDevsTeam3').remove();

  }

  String validateName(String value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Name is Required";
    
    }
    return null;
  }

  String validateMobile(String value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Mobile is Required";
    
    }
    return null;
  }

  String validateEmail(String value) {
    String pattern =r'(^[0-9]*$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Email is Required";
    }else {
      return null;
    }
  }

  _sendToServer()async {
    if (_key.currentState.validate()) {
      // No any error in validation
      _key.currentState.save();
        await createData();
        await  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Result()),
  );
    } else {
      // validation error
      setState(() {
        _validate = true;
      });
    }
  }
}