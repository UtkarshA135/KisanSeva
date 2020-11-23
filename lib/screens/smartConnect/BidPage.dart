import 'package:flutter/material.dart';

class bidPage extends StatefulWidget {
  final String imgUrl, MSP, desc;

  const bidPage(this.imgUrl, this.MSP, this.desc);

  @override
  _bidPageState createState() => _bidPageState();
}

// ignore: camel_case_types
class _bidPageState extends State<bidPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(),
        body: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.green,
              width: 5
            )
          ),
          child: Column(
            children: [
              Container(
                  height: 150,
                  width: 200,
                  child: Image.network(
                    widget.imgUrl,
                    fit: BoxFit.fill,
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 4.0, right: 4),
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
                        widget.MSP,
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [Icon(Icons.timer), Text("1H 21m")],
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Id cursus metus aliquam eleifend mi. Nullam non nisi est sit amet facilisis magna etiam. Adipiscing vitae proin sagittis nisl rhoncus mattis. Congue nisi vitae suscipit tellus mauris a. Tristique magna sit amet purus gravida quis blandit turpis cursus. Consectetur adipiscing elit ut aliquam purus. Rutrum quisque non tellus orci ac auctor augue mauris. Est lorem ipsum dolor sit amet. Tincidunt eget nullam non nisi. Porttitor massa id neque aliquam vestibulum morbi. In arcu cursus euismod quis viverra nibh. Sit amet mattis vulputate enim nulla."),
              ),
              Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 80.0),
                          child: Text(
                            "Rs.30000/tonne",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                        Text("42",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18))
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 25, right: 85.0),
                          child: Text("Latest Bid",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 14)),
                        ),
                        Text("Current Bids",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 14))
                      ],
                    ),
                  ],
                ),
              ),
              
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: 'Enter Your BID!'),
                ),
              ),
              RaisedButton(
                onPressed: () {},
                elevation: 4,
                color: Colors.green[400],
                child: Text("Place Your Bid!"),
              )
            ],
          ),
        ));
  }
}
