import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kisanseva/screens/smartConnect/display_crop_ctrl.dart';
import 'package:url_launcher/url_launcher.dart';

class BidPage extends StatefulWidget {
  final String imgUrl, MSP, desc, cropName;

  const BidPage(this.imgUrl, this.MSP, this.desc, this.cropName);

  @override
  _BidPageState createState() => _BidPageState();
}

// ignore: camel_case_types
class _BidPageState extends State<BidPage> {
  final displayCropController = Get.put(DisplayCropCtrl());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                  height: 200,
                  width: 200,
                  child: Image.network(
                    widget.imgUrl,
                    fit: BoxFit.fill,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1.2,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Selling Price: ${widget.MSP}",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //   children: [Icon(Icons.timer), Text("1H 21m")],
                    // )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                "Crop name ",
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                "Quantity ",
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                "Description",
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(10.0),
            //   child: Container(
            //     height: 60,
            //     width: MediaQuery.of(context).size.width,
            //     decoration: BoxDecoration(
            //       border: Border.all(color: Colors.black, width: 1),
            //     ),
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         Row(
            //           children: [
            //             Padding(
            //               padding: const EdgeInsets.only(left: 10, right: 80.0),
            //               child: Text(
            //                 "Rs.30000/tonne",
            //                 style: TextStyle(
            //                     fontWeight: FontWeight.bold, fontSize: 18),
            //               ),
            //             ),
            //             Text("42",
            //                 style: TextStyle(
            //                     fontWeight: FontWeight.bold, fontSize: 18))
            //           ],
            //         ),
            //         Row(
            //           children: [
            //             Padding(
            //               padding: const EdgeInsets.only(left: 25, right: 85.0),
            //               child: Text("Latest Bid",
            //                   style: TextStyle(
            //                       fontWeight: FontWeight.w500, fontSize: 14)),
            //             ),
            //             Text("Current Bids",
            //                 style: TextStyle(
            //                     fontWeight: FontWeight.w500, fontSize: 14))
            //           ],
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 10,
            ),
            // Container(
            //   width: MediaQuery.of(context).size.width * 0.8,
            //   child: TextField(
            //     keyboardType: TextInputType.number,
            //     decoration: InputDecoration(
            //         border: OutlineInputBorder(
            //             borderRadius: BorderRadius.circular(10)),
            //         hintText: 'Enter Your BID!'),
            //   ),
            // ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () {
                  call(displayCropController.cropModel.ownerContactInfo);
                },
                elevation: 4,
                color: Colors.green[400],
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.phone),
                    Text("Contact Owner"),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  call(String x) async {
    await launch('tel:$x');
  }
}
