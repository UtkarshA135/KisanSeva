import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
class Result extends StatefulWidget {
  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
    final databaseReference = FirebaseDatabase.instance.reference();
     double ahumid, atemp, rainfall,sph,shumid;
     String crop;
  @override
  void initState() {
    // TODO: implement initState
   readData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : Text("Your Result"),
       centerTitle :true
      ),
      body:  Padding(padding:EdgeInsets.fromLTRB(20,20,20,20),
      child :
      Center(
    
       child: Card(
         child: Column(children: [
          crop!=null ?Center(child :Text("Predicted Crop : $crop")): Center(child :Text("Loading.....")),
          crop!=null? Image(image : AssetImage("assets/mango.jpg")):Container()
         ],),
      ),),
    ));
  }
    void readData()async{
    await databaseReference.child("Realtime").once().then((DataSnapshot snapshot) {
      Map<dynamic, dynamic> values = snapshot.value;
     
    setState(() {
    /*  ahumid = values['Air Humidity'];
      atemp=values['Air Temp'];
      rainfall=values['Rainfall'];
      shumid=values['Soil Humidity'];
      sph=values['Soil pH'];*/
   
    });
   
    });
    await databaseReference.child("croppredicted").once().then((DataSnapshot snapshot) {
      Map<dynamic, dynamic> values = snapshot.value;
    
    setState(() {
     
      crop=values['crop'];
    });
 
   print(crop);
    });
  }
}