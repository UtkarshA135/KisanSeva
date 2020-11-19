import 'package:flutter/material.dart';
import 'package:kisanseva/screens/smartConnect/BidPage.dart';

import 'productModel.dart';

// ignore: camel_case_types
class connect extends StatefulWidget {
  @override
  _connectState createState() => _connectState();
}

class _connectState extends State<connect> {
  @override
  Widget build(BuildContext context) {

// ignore: unused_local_variable
List listViewData = [
  ListViewModel(
    MSP: "MSP",
    desc: "Product Description",
    img_URL: "https://static.hanos.com/sys-master/productimages/h3e/h60/9264319365150/34191901.jpg_914Wx914H",
                                        
  ),
  ListViewModel(
    MSP: "MSP",
    desc: "Product Description",
    img_URL: "https://www.kampexport.com/sites/kampexport.com/files/images/legume/image/tomates_256_1.jpg",
  ),
  ListViewModel(
    MSP: "MSP",
    desc: "Product Description",
    img_URL: "https://shakhattownmall.com/admin/uploads/(56)2.jpg",
  ),
  ListViewModel(
    MSP: "MSP",
    desc: "Product Description",
    img_URL: "https://images.freshop.com/5181/a9e5889ca99e956d3d685747696415ed_medium.png",
  ),
  ListViewModel(
    MSP: "MSP",
    desc: "Product Description",
    img_URL: "https://static.hanos.com/sys-master/productimages/h8d/h43/8896013631518/342.30207.jpg_256Wx256H",
  ),
  ListViewModel(
    MSP: "MSP",
    desc: "Product Description",
    img_URL: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSIIHtgkZeeOKMRbdaYMlpfsRLZvWJhyyKW4w&usqp=CAU",
  ),
  ListViewModel(
    MSP: "MSP",
    desc: "Product Description",
    img_URL:"https://www.searates.com/design/images/temperature/tangerines.jpg",
  ),
  ListViewModel(
    MSP: "MSP",
    desc: "Product Description",
    img_URL: "https://agro-v.com/images/content/products/categories/zernovye_sypuchie/pshenitsa_kormovaya_6_klass.png",
  ),
];

    // List<Widget> items = [
    //   product(
    //       "MSP",
    //       "Product Description",
    //       "https://static.hanos.com/sys-master/productimages/h3e/h60/9264319365150/34191901.jpg_914Wx914H",
    //       context),
    //   product(
    //       "MSP",
    //       "Product Description",
    //       "https://www.kampexport.com/sites/kampexport.com/files/images/legume/image/tomates_256_1.jpg",
    //       context),
    // ];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Container(
        child: ListView.builder(
          itemCount: listViewData.length,
          itemBuilder: (context, int i) => Column(
        children: [
          product(listViewData[i].MSP,listViewData[i].desc, listViewData[i].img_url, context)
        ],
      ),)
      ),
    );
  }
}

product(String s, String t, String img_url, BuildContext context) {
  return Container(
    height: 250,
    width: 150,
    decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
          width: 5,
        ),
        borderRadius: BorderRadius.all(Radius.circular(20))),
    child: Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 5, bottom: 5),
          child: Container(
              width: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.amber,
                  width: 4,
                ),
              ),
              child: ClipOval(
                  child: Image.network(
                img_url,
                fit: BoxFit.cover,
                width: 50,
                height: 60,
              ))),
        ),
        Container(
          height: 60,
          width: 120,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(t),
          ),
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
              borderRadius: BorderRadius.all(Radius.circular(5))),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Container(
            width: 50,
            height: 20,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Text(
                  s,
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
        RaisedButton(
          color: Colors.blue,
          elevation: 3,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => bidPage(
                      "https://static.hanos.com/sys-master/productimages/h3e/h60/9264319365150/34191901.jpg_914Wx914H",
                      "MSP",
                      "Desc")),
            );
          },
          child: new Text(
            'BID',
            style: new TextStyle(fontSize: 12.0, color: Colors.white),
          ),
        ),
      ],
    ),
  );
}
