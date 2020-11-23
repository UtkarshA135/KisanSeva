import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:kisanseva/models/app_localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'screens/splash.dart';
import 'package:provider/provider.dart';
import 'services/firebaseUserProvider.dart';
import 'package:kisanseva/models/language.dart';

void main() {
  // Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<FirebaseUserProvider>(
        create: (context) => FirebaseUserProvider()),
  ], child: MyApp()));
}

class MyApp extends StatefulWidget {
  MyApp({Key key, this.title}) : super(key: key);

  final String title;
  static void setLocale(BuildContext context, Locale locale) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>();
    state.setLocale(locale);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale;
  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

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
    return GetMaterialApp(
      navigatorKey: _navigatorKey,
      title: 'Farmer App',
      debugShowCheckedModeBanner: false,

      locale: _locale,
      //   debugShowCheckedModeBanner: false,

      supportedLocales: [
        Locale('en', 'US'),
        Locale('hi', 'IN'),
      ],

      localizationsDelegates: [
        AppLocalizations.delegate,

        // Built-in localization of basic text for Material widgets
        GlobalMaterialLocalizations.delegate,
        // Built-in localization for text direction LTR/RTL
        GlobalWidgetsLocalizations.delegate,
      ],
      // Returns a locale which will be used by the app
      localeResolutionCallback: (locale, supportedLocales) {
        // Check if the current device locale is supported
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        // If the locale of the device is not supported, use the first one
        // from the list (English, in this case).
        return supportedLocales.first;
      },
      /* darkTheme: ThemeData(
              brightness: Brightness.dark, primarySwatch: Colors.deepOrange),*/
      theme: ThemeData(primarySwatch: Colors.green),
      home: SplashScreen(),
    );
  }
}
