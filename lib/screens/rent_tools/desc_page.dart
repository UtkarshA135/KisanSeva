import 'package:flutter/material.dart';

class DescPage extends StatelessWidget {
  final String name;
  final String description;
  final String cost;
  final String img_url;

  const DescPage({
    Key key,
    this.name,
    this.description,
    this.cost,
    this.img_url,
  }) : super(key: key);
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
                image: NetworkImage(img_url),
                height: 130,
                width: 130,
                fit: BoxFit.contain,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                name,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "$cost/hr",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(description),
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
