import 'package:flutter/material.dart';
import 'screens/splash.dart';
import 'package:provider/provider.dart';
import 'services/firebaseUserProvider.dart';

void main() => runApp(MultiProvider(providers: [
      ChangeNotifierProvider<FirebaseUserProvider>(
          create: (context) => FirebaseUserProvider()),
    ], child: MyApp()));

class MyApp extends StatefulWidget {
  MyApp({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  bool isBuyer = true;
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<FirebaseUserProvider>(context, listen: false)
        .user; //initialising firebaseuserprovider
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      title: 'Food App',
      debugShowCheckedModeBanner: false,
      /* darkTheme: ThemeData(
          brightness: Brightness.dark, primarySwatch: Colors.deepOrange),*/
      theme: ThemeData(primarySwatch: Colors.green),
      home: SplashScreen(),
    );
  }
}
