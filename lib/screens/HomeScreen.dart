import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kisanseva/models/app_localization.dart';
import 'package:kisanseva/screens/Yield/yield.dart';
import 'package:kisanseva/screens/diseaseDetection/modalHelper.dart';
import 'package:kisanseva/screens/feed/feed_page.dart';
import 'package:kisanseva/screens/rent_tools/display_rent_tools.dart';
import 'package:kisanseva/screens/smartConnect/smartConnect.dart';
import 'package:kisanseva/services/authservice.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'smartConnect/connect.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.limeAccent,
            title: Text(
              "Kisan Seva",
              style: TextStyle(color: Colors.black),
            ),
            centerTitle: true,
            actions: [
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
            ]),
        // body: Column(
        //   children: [
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         RaisedButton(
        //           onPressed: () {
        //             Navigator.push(
        //                 context,
        //                 MaterialPageRoute(
        //                     builder: (context) => smartConnect()));
        //           },
        //           child: Text("Smart Connect"),
        //         )
        //       ],
        //     ),
        //     Center(
        //       child: RaisedButton(
        //         color: Colors.yellow,
        //         child: Text("Rent Tools"),
        //         onPressed: () {
        //           Navigator.push(
        //             context,
        //             MaterialPageRoute(builder: (context) => MyHomePage()),
        //           );
        //         },
        //       ),
        //     ),
        //   ],
        // ),
        bottomNavigationBar: nav_bar(),
      ),
    );
  }

  nav_bar() {
    return PersistentTabView(
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears.
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style1, // Choose the nav bar style with this property.
    );
  }

  List<Widget> _buildScreens() {
    return [
      DisplayRentTools(),
      // Container(), //TODO add disease detection
      // MyHomePage(),
      Disease(), //TODO add disease detection
      // Container(),
      Yield(),
      connect(), //TODO add yield prediction
      // MyHomePage(),
      //  Disease(), //TODO add disease detection
      // smartConnect(), //TODO add yield prediction
      Feed() //TODO add feed
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.build,
        ),
        title: ( AppLocalizations.of(context)
                                            .translate ("Tools") ),
        activeColor: Colors.green,
        inactiveColor: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.local_florist),
        title: (AppLocalizations.of(context)
                                            .translate ("Diseases")),
        activeColor: Colors.green,
        inactiveColor: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.attach_money),
        title: (AppLocalizations.of(context)
                                            .translate ("Yield")),
        activeColor: Colors.green,
        inactiveColor: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.store),
        title: (AppLocalizations.of(context)
                                            .translate ("Connect")),
        activeColor: Colors.green,
        inactiveColor: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.news_solid),
        title: (AppLocalizations.of(context)
                                            .translate ("Feed")),
        activeColor: Colors.green,
        inactiveColor: Colors.grey,
      ),
    ];
  }
}
