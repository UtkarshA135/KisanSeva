import 'package:flutter/material.dart';
import 'package:kisanseva/models/crop_model.dart';

import 'BidPage.dart';

class cropTemplate extends StatelessWidget {
  final CropModel cropModel;

  const cropTemplate({Key key, this.cropModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
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
                  cropModel.cropImage,
                  fit: BoxFit.cover,
                  width: 50,
                  height: 60,
                ))),
          ),
          Row(
            children: [
              Container(
                height: 60,
                width: 120,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(cropModel.cropDescription),
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
                        cropModel.msp,
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.bold),
                      ),
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
                    builder: (context) => bidPage(cropModel.cropImage,
                        cropModel.msp, cropModel.cropDescription)),
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
}
