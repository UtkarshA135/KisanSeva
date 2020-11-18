import 'package:flutter/material.dart';

// ignore: camel_case_types
class smartConnect extends StatefulWidget {
  @override
  _smartConnectState createState() => _smartConnectState();
}

// ignore: camel_case_types
class _smartConnectState extends State<smartConnect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Smart Connect"),
        ),
        body: Container(
          child: Container(
            margin: new EdgeInsets.only(left: 20.0, top: 20.0),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 4.0,
                  spreadRadius: 5.0,
                  offset: Offset(1, 1), // shadow direction: bottom right
                )
              ],
            ),
            child: ListView(
              children: [
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 10, top: 20, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            height: 220,
                            width: 150,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                  width: 5,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
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
                                        "https://static.hanos.com/sys-master/productimages/h3e/h60/9264319365150/34191901.jpg_914Wx914H",
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
                                    child: Text("Product Description"),
                                  ),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 2,
                                      ),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5))),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Container(
                                        width: 50,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 2,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text("MSP"),
                                        ),
                                      ),
                                      new InkWell(
                                        onTap: () {},
                                        child: new Container(
                                          width: 60,
                                          height: 40.0,
                                          decoration: new BoxDecoration(
                                            color: Colors.blueAccent,
                                            border: new Border.all(
                                                color: Colors.white,
                                                width: 2.0),
                                            borderRadius:
                                                new BorderRadius.circular(10.0),
                                          ),
                                          child: new Center(
                                            child: new Text(
                                              'BID',
                                              style: new TextStyle(
                                                  fontSize: 12.0,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 220,
                            width: 150,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                  width: 5,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
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
                                        "https://www.kampexport.com/sites/kampexport.com/files/images/legume/image/tomates_256_1.jpg",
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
                                    child: Text("Product Description"),
                                  ),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 2,
                                      ),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5))),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Container(
                                        width: 50,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 2,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text("MSP"),
                                        ),
                                      ),
                                      new InkWell(
                                        onTap: () {},
                                        child: new Container(
                                          width: 60,
                                          height: 40.0,
                                          decoration: new BoxDecoration(
                                            color: Colors.blueAccent,
                                            border: new Border.all(
                                                color: Colors.white,
                                                width: 2.0),
                                            borderRadius:
                                                new BorderRadius.circular(10.0),
                                          ),
                                          child: new Center(
                                            child: new Text(
                                              'BID',
                                              style: new TextStyle(
                                                  fontSize: 12.0,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10, top: 20, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            height: 220,
                            width: 150,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                  width: 5,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
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
                                        "https://shakhattownmall.com/admin/uploads/(56)2.jpg",
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
                                    child: Text("Product Description"),
                                  ),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 2,
                                      ),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5))),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Container(
                                        width: 50,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 2,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text("MSP"),
                                        ),
                                      ),
                                      new InkWell(
                                        onTap: () {},
                                        child: new Container(
                                          width: 60,
                                          height: 40.0,
                                          decoration: new BoxDecoration(
                                            color: Colors.blueAccent,
                                            border: new Border.all(
                                                color: Colors.white,
                                                width: 2.0),
                                            borderRadius:
                                                new BorderRadius.circular(10.0),
                                          ),
                                          child: new Center(
                                            child: new Text(
                                              'BID',
                                              style: new TextStyle(
                                                  fontSize: 12.0,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 220,
                            width: 150,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                  width: 5,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
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
                                        "https://images.freshop.com/5181/a9e5889ca99e956d3d685747696415ed_medium.png",
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
                                    child: Text("Product Description"),
                                  ),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 2,
                                      ),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5))),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Container(
                                        width: 50,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 2,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text("MSP"),
                                        ),
                                      ),
                                      new InkWell(
                                        onTap: () {},
                                        child: new Container(
                                          width: 60,
                                          height: 40.0,
                                          decoration: new BoxDecoration(
                                            color: Colors.blueAccent,
                                            border: new Border.all(
                                                color: Colors.white,
                                                width: 2.0),
                                            borderRadius:
                                                new BorderRadius.circular(10.0),
                                          ),
                                          child: new Center(
                                            child: new Text(
                                              'BID',
                                              style: new TextStyle(
                                                  fontSize: 12.0,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10, top: 20, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            height: 220,
                            width: 150,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                  width: 5,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
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
                                        "https://static.hanos.com/sys-master/productimages/h8d/h43/8896013631518/342.30207.jpg_256Wx256H",
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
                                    child: Text("Product Description"),
                                  ),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 2,
                                      ),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5))),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Container(
                                        width: 50,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 2,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text("MSP"),
                                        ),
                                      ),
                                      new InkWell(
                                        onTap: () {},
                                        child: new Container(
                                          width: 60,
                                          height: 40.0,
                                          decoration: new BoxDecoration(
                                            color: Colors.blueAccent,
                                            border: new Border.all(
                                                color: Colors.white,
                                                width: 2.0),
                                            borderRadius:
                                                new BorderRadius.circular(10.0),
                                          ),
                                          child: new Center(
                                            child: new Text(
                                              'BID',
                                              style: new TextStyle(
                                                  fontSize: 12.0,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 220,
                            width: 150,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                  width: 5,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
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
                                        "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSIIHtgkZeeOKMRbdaYMlpfsRLZvWJhyyKW4w&usqp=CAU",
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
                                    child: Text("Product Description"),
                                  ),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 2,
                                      ),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5))),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Container(
                                        width: 50,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 2,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text("MSP"),
                                        ),
                                      ),
                                      new InkWell(
                                        onTap: () {},
                                        child: new Container(
                                          width: 60,
                                          height: 40.0,
                                          decoration: new BoxDecoration(
                                            color: Colors.blueAccent,
                                            border: new Border.all(
                                                color: Colors.white,
                                                width: 2.0),
                                            borderRadius:
                                                new BorderRadius.circular(10.0),
                                          ),
                                          child: new Center(
                                            child: new Text(
                                              'BID',
                                              style: new TextStyle(
                                                  fontSize: 12.0,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10, top: 20, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            height: 220,
                            width: 150,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                  width: 5,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
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
                                        "https://www.searates.com/design/images/temperature/tangerines.jpg",
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
                                    child: Text("Product Description"),
                                  ),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 2,
                                      ),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5))),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Container(
                                        width: 50,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 2,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text("MSP"),
                                        ),
                                      ),
                                      new InkWell(
                                        onTap: () {},
                                        child: new Container(
                                          width: 60,
                                          height: 40.0,
                                          decoration: new BoxDecoration(
                                            color: Colors.blueAccent,
                                            border: new Border.all(
                                                color: Colors.white,
                                                width: 2.0),
                                            borderRadius:
                                                new BorderRadius.circular(10.0),
                                          ),
                                          child: new Center(
                                            child: new Text(
                                              'BID',
                                              style: new TextStyle(
                                                  fontSize: 12.0,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 220,
                            width: 150,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                  width: 5,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
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
                                        "https://agro-v.com/images/content/products/categories/zernovye_sypuchie/pshenitsa_kormovaya_6_klass.png",
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
                                    child: Text("Product Description"),
                                  ),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 2,
                                      ),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5))),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Container(
                                        width: 50,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 2,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text("MSP"),
                                        ),
                                      ),
                                      new InkWell(
                                        onTap: () {},
                                        child: new Container(
                                          width: 60,
                                          height: 40.0,
                                          decoration: new BoxDecoration(
                                            color: Colors.blueAccent,
                                            border: new Border.all(
                                                color: Colors.white,
                                                width: 2.0),
                                            borderRadius:
                                                new BorderRadius.circular(10.0),
                                          ),
                                          child: new Center(
                                            child: new Text(
                                              'BID',
                                              style: new TextStyle(
                                                  fontSize: 12.0,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
