import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kisanseva/models/crop_model.dart';
import 'package:kisanseva/screens/smartConnect/addCrop.dart';
import 'package:kisanseva/screens/smartConnect/crop_template.dart';
import 'package:kisanseva/models/app_localization.dart';
import 'package:kisanseva/screens/smartConnect/BidPage.dart';
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
                // physics: NeverScrollableScrollPhysics(),
                itemCount: snapshot.data.documents.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  DocumentSnapshot crop = snapshot.data.documents[index];
                  CropModel cropModel = CropModel.fromJson(crop.data);
                  return CropTemplate(cropModel: cropModel);
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

// product(String s, String t, String imgURL, BuildContext context) {
//   return Container(
//     height: 250,
//     width: 150,
//     decoration: BoxDecoration(
//         border: Border.all(
//           color: Colors.white,
//           width: 5,
//         ),
//         borderRadius: BorderRadius.all(Radius.circular(20))),
//     child: Column(
//       children: <Widget>[
//         Padding(
//           padding: EdgeInsets.only(top: 5, bottom: 5),
//           child: Container(
//               width: 70,
//               decoration: BoxDecoration(
//                   border: Border.all(color: Colors.green, width: 3),
//                   borderRadius: BorderRadius.all(Radius.circular(20))),
//               child: Container(
//                 height: 200,
//                 width: 150,
//                 decoration: BoxDecoration(
//                     border: Border.all(
//                       color: Colors.white,
//                       width: 5,
//                     ),
//                     borderRadius: BorderRadius.all(Radius.circular(20))),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Column(
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.only(top: 5, bottom: 5),
//                           child: Container(
//                               width: 70,
//                               child: Image.network(
//                                 crops[index].imageUrl,
//                                 fit: BoxFit.scaleDown,
//                                 width: 400,
//                                 height: 180,
//                               )),
//                         ),
//                       ],
//                     ),
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(top: 20.0),
//                           child: Container(
//                             height: 50,
//                             width: 120,
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Text(crops[index].desc),
//                             ),
//                             decoration: BoxDecoration(
//                                 border: Border.all(
//                                   color: Colors.blue,
//                                   width: 2,
//                                 ),
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(10))),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.only(left: 20.0),
//                               child: Container(
//                                 width: 50,
//                                 height: 50,
//                                 decoration: BoxDecoration(
//                                   border: Border.all(
//                                     color: Colors.blue,
//                                     width: 2,
//                                   ),
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(10)),
//                                 ),
//                                 child: Align(
//                                   alignment: Alignment.center,
//                                   child: Padding(
//                                     padding: const EdgeInsets.all(3.0),
//                                     child: Text(
//                                       crops[index].msp,
//                                       style: TextStyle(
//                                           fontSize: 10,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               width: 10,
//                             ),
//                             Container(
//                               width: 80,
//                               height: 30,
//                               decoration: BoxDecoration(
//                                 border: Border.all(
//                                   color: Colors.blue,
//                                   width: 2,
//                                 ),
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(5)),
//                               ),
//                               child: Padding(
//                                 padding: const EdgeInsets.all(3.0),
//                                 child: Text("Quantity"),
//                               ),
//                             )
//                           ],
//                         ),
//                         RaisedButton(
//                           color: Colors.blue,
//                           elevation: 3,
//                           onPressed: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => bidPage(
//                                       crops[index].imageUrl,
//                                       crops[index].msp,
//                                       crops[index].imageUrl)),
//                             );
//                           },
//                           child: new Text(
//                             'BID',
//                             style: new TextStyle(
//                                 fontSize: 12.0, color: Colors.white),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               child: ClipOval(
//                   child: Image.network(
//                 imgURL,
//                 fit: BoxFit.cover,
//                 width: 50,
//                 height: 60,
//               ))),
//         ),
//         Container(
//           height: 60,
//           width: 120,
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(t),
//           ),
//           decoration: BoxDecoration(
//               border: Border.all(
//                 color: Colors.white,
//                 width: 2,
//               ),
//               borderRadius: BorderRadius.all(Radius.circular(5))),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(top: 4.0),
//           child: Container(
//             width: 50,
//             height: 20,
//             decoration: BoxDecoration(
//               border: Border.all(
//                 color: Colors.white,
//                 width: 2,
//               ),
//             ),
//             child: Align(
//               alignment: Alignment.center,
//               child: Padding(
//                 padding: const EdgeInsets.all(3.0),
//                 child: Text(
//                   s,
//                   style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),
//           ),
//         ),
//         RaisedButton(
//           color: Colors.blue,
//           elevation: 3,
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                   builder: (context) => bidPage(imgURL, "MSP", "Desc")),
//             );
//           },
//           child: new Text(
//            (AppLocalizations.of(context)
//                                             .translate('BID')) ,
//             style: new TextStyle(fontSize: 12.0, color: Colors.white),
//           ),
//         ),
//       ],
//     ),
//   );
// }
