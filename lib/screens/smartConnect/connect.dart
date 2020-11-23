import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kisanseva/models/crop_model.dart';
import 'package:kisanseva/screens/smartConnect/addCrop.dart';
import 'package:kisanseva/screens/smartConnect/crop_template.dart';

import 'BidPage.dart';

class Crop {
  String imageUrl;
  String desc;
  String msp;

  Crop({this.imageUrl, this.desc, this.msp});
}

List crops = [
  Crop(
    imageUrl:
        "https://static.hanos.com/sys-master/productimages/h3e/h60/9264319365150/34191901.jpg_914Wx914H",
    desc: "Lore Ipsum",
    msp: "30000",
  ),
  Crop(
    imageUrl:
        "https://www.kampexport.com/sites/kampexport.com/files/images/legume/image/tomates_256_1.jpg",
    desc: "Lore Ipsum",
    msp: "30000",
  ),
  Crop(
    imageUrl: "https://shakhattownmall.com/admin/uploads/(56)2.jpg",
    desc: "Lore Ipsum",
    msp: "30000",
  ),
  Crop(
    imageUrl:
        "https://images.freshop.com/5181/a9e5889ca99e956d3d685747696415ed_medium.png",
    desc: "Lore Ipsum",
    msp: "30000",
  ),
  Crop(
    imageUrl:
        "https://static.hanos.com/sys-master/productimages/h8d/h43/8896013631518/342.30207.jpg_256Wx256H",
    desc: "Lore Ipsum",
    msp: "30000",
  ),
  Crop(
    imageUrl:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSIIHtgkZeeOKMRbdaYMlpfsRLZvWJhyyKW4w&usqp=CAU",
    desc: "Lore Ipsum",
    msp: "30000",
  ),
  Crop(
    imageUrl:
        "https://static.hanos.com/sys-master/productimages/h3e/h60/9264319365150/34191901.jpg_914Wx914H",
    desc: "Lore Ipsum",
    msp: "30000",
  ),
  Crop(
    imageUrl:
        "https://static.hanos.com/sys-master/productimages/h3e/h60/9264319365150/34191901.jpg_914Wx914H",
    desc: "Lore Ipsum",
    msp: "30000",
  ),
  Crop(
    imageUrl:
        "https://static.hanos.com/sys-master/productimages/h3e/h60/9264319365150/34191901.jpg_914Wx914H",
    desc: "Lore Ipsum",
    msp: "30000",
  ),
];

class connect extends StatefulWidget {
  @override
  _connectState createState() => _connectState();
}

// ignore: camel_case_types
class _connectState extends State<connect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Smart Connect")),
        body: StreamBuilder<dynamic>(
          stream: Firestore.instance.collection('crop').snapshots(),
          // stream: displayRentToolsCtrl.rentToolsStrems(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              //do something with the data
              return ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: snapshot.data.documents.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  DocumentSnapshot crop = snapshot.data.documents[index];
                  CropModel cropModel = CropModel.fromJson(crop.data);
                  return cropTemplate(cropModel: cropModel);
                },
              );
            } else if (snapshot.hasError) {
              //do something with the error
              return Text(snapshot.error.toString());
            }
            //the data is not ready, show a loading indicator
            return Center(child: CircularProgressIndicator());
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.green,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddCrop(),
              ),
            );
          },
        ));
  }
}
