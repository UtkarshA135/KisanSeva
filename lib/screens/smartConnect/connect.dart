import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    imageUrl:
        "https://shakhattownmall.com/admin/uploads/(56)2.jpg",
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
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: crops.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(10),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.green, width: 3),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              // child: ListTile(
              //   dense: true,
              //   leading: Image.network(crops[index].imageUrl),
              //   title: Text(crops[index].msp),
              //   subtitle: Text(crops[index].desc),
              child: Container(
                height: 200,
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
                            crops[index].imageUrl,
                            fit: BoxFit.cover,
                            width: 50,
                            height: 60,
                          ))),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 50,
                          width: 120,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(crops[index].desc),
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.blue,
                                width: 2,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.blue,
                              width: 2,
                            ),
                            borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Text(
                                crops[index].msp,
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    RaisedButton(
                      color: Colors.blue,
                      elevation: 3,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => bidPage(
                                  crops[index].imageUrl,
                                  crops[index].msp,
                                  crops[index].imageUrl)),
                        );
                      },
                      child: new Text(
                        'BID',
                        style:
                            new TextStyle(fontSize: 12.0, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
