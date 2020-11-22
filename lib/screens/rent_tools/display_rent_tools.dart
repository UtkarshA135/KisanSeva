import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kisanseva/models/rent_tools_model.dart';
import 'package:kisanseva/screens/rent_tools/rent_tools_template.dart';
import 'package:kisanseva/services/authservice.dart';

import 'add_new.dart';
import 'desc_page.dart';

class DisplayRentTools extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> items = [];
    //   card("Harvestor", "hdva wfdhgfwgd", "300",
    //       "https://tiimg.tistatic.com/fp/1/833/harvestor-864.jpg", context),
    //   card(
    //       "Pesticide Sprayer",
    //       "hdva wfdhgfwgd",
    //       "100",
    //       "https://4.imimg.com/data4/ED/VM/MY-9707575/knapsack-sprayers-500x500.jpg",
    //       context),
    //   card(
    //       "Plough",
    //       "hdva wfdhgfwgd",
    //       "100",
    //       "https://3.imimg.com/data3/TY/KI/MY-2259091/subsoil-plough-500x500.jpg",
    //       context),
    //   card("Tractor", "hdva wfdhgfwgd", "200",
    //       "https://etimg.etb2bimg.com/photo/76508031.cms", context),
    //   card("Harvestor", "hdva wfdhgfwgd", "300",
    //       "https://tiimg.tistatic.com/fp/1/833/harvestor-864.jpg", context),
    //   card(
    //       "Pesticide Sprayer",
    //       "hdva wfdhgfwgd",
    //       "100",
    //       "https://4.imimg.com/data4/ED/VM/MY-9707575/knapsack-sprayers-500x500.jpg",
    //       context),
    //   card(
    //       "Plough",
    //       "hdva wfdhgfwgd",
    //       "100",
    //       "https://3.imimg.com/data3/TY/KI/MY-2259091/subsoil-plough-500x500.jpg",
    //       context)
    // ];

    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text("SmartFarm"),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            color: Colors.white,
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.black,
            ),
            onPressed: () async {
              AuthService().signOut();
              Navigator.pushReplacement(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => AuthService().handleAuth()));
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(35),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black54,
                          offset: Offset(1.0, 1.0),
                          blurRadius: 10.0,
                        ),
                      ]),
                  child: TextFormField(
                    decoration: InputDecoration(
                        icon: Icon(Icons.search),
                        hintText: "Search...",
                        border: InputBorder.none),
                  ),
                ),
              ),
              Text(
                "Categories",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 75,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      width: 75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.yellow,
                      ),
                      child: Center(
                        child: Text("Tractors"),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.yellow,
                      ),
                      child: Center(
                        child: Text("Harvestors"),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.yellow,
                      ),
                      child: Center(
                        child: Text("Pesticides"),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.yellow,
                      ),
                      child: Center(
                        child: Text("Others"),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return items[index];
                  // return RentToolsTemplate(rentToolsModel: model);
                },
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddItem(),
            ),
          );
        },
      ),
    );
  }
}
