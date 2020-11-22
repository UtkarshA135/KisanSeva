import 'package:flutter/material.dart';
import 'package:kisanseva/models/rent_tools_model.dart';

class DescPage extends StatelessWidget {
  final RentToolsModel rentToolsModel;

  const DescPage({Key key, this.rentToolsModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Image(
                image: NetworkImage(rentToolsModel.toolImage),
                height: 130,
                width: 130,
                fit: BoxFit.contain,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                rentToolsModel.toolName,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                rentToolsModel.toolPricePerDay,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(rentToolsModel.toolDescription),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RaisedButton(
                      onPressed: () {},
                      shape: StadiumBorder(),
                      child: Center(
                        child: Row(
                          children: [
                            Icon(Icons.call),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Contact",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    RaisedButton(
                      onPressed: () {},
                      shape: StadiumBorder(),
                      child: Center(
                        child: Row(
                          children: [
                            Icon(Icons.check),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Book",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
