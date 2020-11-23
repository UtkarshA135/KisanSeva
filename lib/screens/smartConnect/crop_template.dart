import 'package:flutter/material.dart';
import 'package:kisanseva/models/crop_model.dart';

import 'BidPage.dart';

class CropTemplate extends StatelessWidget {
  final CropModel cropModel;

  const CropTemplate({Key key, this.cropModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.green, width: 3),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Container(
          height: 200,
          width: 150,
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 5,
              ),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Container(
                      // width: 70,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          cropModel.cropImage,
                          fit: BoxFit.cover,
                          width: 180,
                          height: 180,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        // height: 50,
                        // width: 120,
                        child: Text(
                          "Crop Name : ${cropModel.cropDescription}",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        // decoration: BoxDecoration(
                        //     // border: Border.all(
                        //     //   color: Colors.blue,
                        //     //   width: 2,
                        //     // ),
                        //     borderRadius: BorderRadius.all(Radius.circular(10))),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        // width: 50,
                        // height: 50,
                        // decoration: BoxDecoration(
                        // border: Border.all(
                        //   color: Colors.blue,
                        //   width: 2,
                        // ),
                        // borderRadius: BorderRadius.all(Radius.circular(10)),
                        // ),

                        child: Text(
                          "MSP : ${cropModel.msp} ",
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Container(
                        // width: 80,
                        // height: 30,
                        // decoration: BoxDecoration(
                        // border: Border.all(
                        //   color: Colors.blue,
                        //   width: 2,
                        // ),
                        // borderRadius: BorderRadius.all(Radius.circular(5)),
                        // ),
                        child: Text("Quantity :  ${cropModel?.cropQuantity}"),
                      ),
                      RaisedButton(
                        color: Colors.blue,
                        elevation: 3,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BidPage(
                                      cropModel.cropImage,
                                      cropModel.msp,
                                      cropModel.cropName,
                                      cropModel.cropDescription,
                                    )),
                          );
                        },
                        child: new Text(
                          'Details',
                          style: new TextStyle(
                              fontSize: 12.0, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    //Container(
    //   height: 150,
    //   width: 150,
    //   decoration: BoxDecoration(
    //       border: Border.all(
    //         color: Colors.white,
    //         width: 5,
    //       ),
    //       borderRadius: BorderRadius.all(Radius.circular(20))),
    //   child: Column(
    //     children: <Widget>[
    //       Padding(
    //         padding: EdgeInsets.only(top: 5, bottom: 5),
    //         child: Container(
    //             width: 70,
    //             decoration: BoxDecoration(
    //               shape: BoxShape.circle,
    //               border: Border.all(
    //                 color: Colors.amber,
    //                 width: 4,
    //               ),
    //             ),
    //             child: ClipOval(
    //                 child: Image.network(
    //               cropModel.cropImage,
    //               fit: BoxFit.cover,
    //               width: 50,
    //               height: 60,
    //             ))),
    //       ),
    //       Row(
    //         children: [
    //           Container(
    //             height: 60,
    //             width: 120,
    //             child: Padding(
    //               padding: const EdgeInsets.all(8.0),
    //               child: Text(cropModel.cropDescription),
    //             ),
    //             decoration: BoxDecoration(
    //                 border: Border.all(
    //                   color: Colors.white,
    //                   width: 2,
    //                 ),
    //                 borderRadius: BorderRadius.all(Radius.circular(5))),
    //           ),
    //           Padding(
    //             padding: const EdgeInsets.only(top: 4.0),
    //             child: Container(
    //               width: 50,
    //               height: 20,
    //               decoration: BoxDecoration(
    //                 border: Border.all(
    //                   color: Colors.white,
    //                   width: 2,
    //                 ),
    //               ),
    //               child: Align(
    //                 alignment: Alignment.center,
    //                 child: Padding(
    //                   padding: const EdgeInsets.all(3.0),
    //                   child: Text(
    //                     cropModel.msp,
    //                     style: TextStyle(
    //                         fontSize: 10, fontWeight: FontWeight.bold),
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //       RaisedButton(
    //         color: Colors.blue,
    //         elevation: 3,
    //         onPressed: () {
    //           Navigator.push(
    //             context,
    //             MaterialPageRoute(
    //                 builder: (context) => bidPage(cropModel.cropImage,
    //                     cropModel.msp, cropModel.cropDescription)),
    //           );
    //         },
    //         child: new Text(
    //           'BID',
    //           style: new TextStyle(fontSize: 12.0, color: Colors.white),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
