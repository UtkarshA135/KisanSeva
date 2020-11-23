import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kisanseva/main.dart';
import 'package:kisanseva/models/app_localization.dart';
import 'package:kisanseva/models/language.dart';
import 'package:get/get.dart';
import 'package:kisanseva/models/rent_tools_model.dart';
import 'package:kisanseva/screens/rent_tools/display_rent_tools_ctrl.dart';
import 'package:kisanseva/screens/rent_tools/rent_tools_template.dart';
import 'package:kisanseva/screens/weather/screens/homeScreen.dart';
import 'package:kisanseva/services/authservice.dart';
import 'package:logger/logger.dart';

import 'add_new.dart';
import 'desc_page.dart';

class DisplayRentTools extends StatelessWidget {
  final displayRentToolsCtrl = Get.put(DisplayRentToolsCtrl());
  final logger = Logger();


  @override
  Widget build(BuildContext context) {
    void _changeLanguage(Language language) {
      Locale _temp;
      switch (language.languageCode) {
        case 'en':
          _temp = Locale(language.languageCode, 'US');
          break;
        case 'hi':
          _temp = Locale(language.languageCode, 'IN');
          break;
      }
      MyApp.setLocale(context, _temp);
    }

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
      drawer: Drawer(
          child: Align(
        alignment: Alignment(0.9, -0.9),
        child: DropdownButton(
          underline: SizedBox(),
          icon: Icon(Icons.language),
          iconSize: 40,
          items: Language.languageList()
              .map<DropdownMenuItem>((lang) => DropdownMenuItem(
                    child: Text(lang.name),
                    value: lang,
                  ))
              .toList(),
          onChanged: (language) {
            _changeLanguage(language);
          },
        ),
      )),
      appBar: AppBar(
        title: Text((AppLocalizations.of(context).translate("Rent Tools"))),
        actions: [
          DropdownButton(
            // underline: SizedBox(),
            icon: Icon(Icons.language, color: Colors.black),
            iconSize: 24,
            items: Language.languageList()
                .map<DropdownMenuItem>((lang) => DropdownMenuItem(
                      child: Text(lang.name),
                      value: lang,
                    ))
                .toList(),
            onChanged: (language) {
              _changeLanguage(language);
            },
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
          ),
          // IconButton(
          //   icon: Icon(
          //     Icons.cloud,
          //     color: Colors.black,
          //   ),
          //   onPressed: () async {
          //     //  AuthService().signOut();
          //     Navigator.push(context,
          //         new MaterialPageRoute(builder: (context) => WHomescreen()));
          //   },
          // ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Padding(
              //   padding: EdgeInsets.all(10),
              //   child: Container(
              //     padding: EdgeInsets.symmetric(
              //       horizontal: 15,
              //     ),
              //     decoration: BoxDecoration(
              //         color: Colors.white,
              //         borderRadius: BorderRadius.circular(35),
              //         boxShadow: [
              //           BoxShadow(
              //             color: Colors.black54,
              //             offset: Offset(1.0, 1.0),
              //             blurRadius: 10.0,
              //           ),
              //         ]),
              //     child: TextFormField(
              //       decoration: InputDecoration(
              //           icon: Icon(Icons.search),
              //           hintText: AppLocalizations.of(context)
              //                               .translate ("Search..."),
              //           border: InputBorder.none),
              //     ),
              //   ),
              // ),
              // Text(
              //   AppLocalizations.of(context).translate("Categories"),
              //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              // ),
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
                        child: TextButton(
                          onPressed: () {
                            displayRentToolsCtrl.selectedCategory.value = "All";
                            // displayRentToolsCtrl.rentToolsStrems();
                            logger.d(
                                "displayRentToolsCtrl.selectedCategory.value is ${displayRentToolsCtrl.selectedCategory.value} ");
                          },
                          child: Obx(() => Text(
                                AppLocalizations.of(context).translate("All"),
                                style: displayRentToolsCtrl
                                            .selectedCategory.value ==
                                        "All"
                                    ? TextStyle(
                                        color: Colors.black,
                                      )
                                    : TextStyle(
                                        color: Colors.green,
                                      ),
                              )),
                        ),
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
                        child: TextButton(
                          onPressed: () {
                            displayRentToolsCtrl.selectedCategory.value =
                                "Tractors";
                            // displayRentToolsCtrl.rentToolsStrems();
                            logger.d(
                                "displayRentToolsCtrl.selectedCategory.value is ${displayRentToolsCtrl.selectedCategory.value} ");
                          },
                          child: Obx(() => Text(
                                AppLocalizations.of(context)
                                    .translate("Tractors"),
                                style: displayRentToolsCtrl
                                            .selectedCategory.value ==
                                        "Tractors"
                                    ? TextStyle(
                                        color: Colors.black,
                                      )
                                    : TextStyle(
                                        color: Colors.green,
                                      ),
                              )),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 85,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.yellow,
                      ),
                      child: Center(
                        child: TextButton(
                          onPressed: () {
                            displayRentToolsCtrl.selectedCategory.value =
                                "Harvestors";
                            // displayRentToolsCtrl.rentToolsStrems();
                            logger.d(
                                "displayRentToolsCtrl.selectedCategory.value is ${displayRentToolsCtrl.selectedCategory.value} ");
                          },
                          child: Obx(() => Text(
                                AppLocalizations.of(context)
                                    .translate("Harvestors"),
                                style: displayRentToolsCtrl
                                            .selectedCategory.value ==
                                        "Harvestors"
                                    ? TextStyle(
                                        color: Colors.black,
                                      )
                                    : TextStyle(
                                        color: Colors.green,
                                      ),
                              )),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 85,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.yellow,
                      ),
                      child: Center(
                        child: TextButton(
                          onPressed: () {
                            displayRentToolsCtrl.selectedCategory.value =
                                "Pesticides";
                            // displayRentToolsCtrl.rentToolsStrems();
                            logger.d(
                                "displayRentToolsCtrl.selectedCategory.value is ${displayRentToolsCtrl.selectedCategory.value} ");
                          },
                          child: Obx(() => Text(
                                AppLocalizations.of(context)
                                    .translate("Pesticides"),
                                style: displayRentToolsCtrl
                                            .selectedCategory.value ==
                                        "Pesticides"
                                    ? TextStyle(
                                        color: Colors.black,
                                      )
                                    : TextStyle(
                                        color: Colors.green,
                                      ),
                              )),
                        ),
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
                        child: TextButton(
                          onPressed: () {
                            displayRentToolsCtrl.selectedCategory.value =
                                "Others";
                            // displayRentToolsCtrl.rentToolsStrems();
                            logger.d(
                                "displayRentToolsCtrl.selectedCategory.value is ${displayRentToolsCtrl.selectedCategory.value} ");
                          },
                          child: Obx(() => Text(
                                AppLocalizations.of(context)
                                    .translate("Others"),
                                style: displayRentToolsCtrl
                                            .selectedCategory.value ==
                                        "Others"
                                    ? TextStyle(
                                        color: Colors.black,
                                      )
                                    : TextStyle(
                                        color: Colors.green,
                                      ),
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Obx(() {
                displayRentToolsCtrl.selectedCategory.value;
                return StreamBuilder<dynamic>(
                  // stream: Firestore.instance.collection('rentTools').snapshots(),
                  stream: displayRentToolsCtrl.rentToolsStrems(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      //do something with the data
                      return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data.documents.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          DocumentSnapshot rentTools =
                              snapshot.data.documents[index];
                          RentToolsModel rentToolsModel =
                              RentToolsModel.fromJson(rentTools.data);
                          return RentToolsTemplate(
                              rentToolsModel: rentToolsModel);
                        },
                      );
                    } else if (snapshot.hasError) {
                      //do something with the error
                      return Text(snapshot.error.toString());
                    }
                    //the data is not ready, show a loading indicator
                    return Center(child: CircularProgressIndicator());
                  },
                );
              })

              // GridView.builder(
              //   physics: NeverScrollableScrollPhysics(),
              //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //       crossAxisCount: 2),
              //   shrinkWrap: true,
              //   itemCount: items.length,
              //   itemBuilder: (context, index) {
              //     // return items[index];
              //     return RentToolsTemplate(rentToolsModel: model);
              //   },
              // )
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
