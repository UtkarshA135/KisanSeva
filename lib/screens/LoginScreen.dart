import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kisanseva/main.dart';
import 'package:kisanseva/models/app_localization.dart';
import 'package:kisanseva/models/language.dart';
import 'package:kisanseva/screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:kisanseva/services/authservice.dart';
import 'package:kisanseva/services/firebaseUserProvider.dart';
import 'package:kisanseva/utils/style.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FirebaseUser user;
   void initState() {
    // TODO: implement initState
    user= Provider.of<FirebaseUserProvider>(context, listen: false)
        .user; 
    super.initState();
  }
  final formKey = new GlobalKey<FormState>();
final CollectionReference userCollection = Firestore.instance.collection('users');
  String phoneNo, verificationId, smsCode;

  bool codeSent = false;
/*Widget getImageAsset(){
  AssetImage assetImage = AssetImage("assets/welcome.jpg");
  Image image = Image(image: assetImage,width:1000.0,height:600.0,fit: BoxFit.cover,);
  return Container(child: image,);
}*/
  @override
  Widget build(BuildContext context) {
    /*  Widget _signInButton() {
      return OutlineButton(
        splashColor: Colors.grey,
        onPressed: () {
          signInWithGoogle().whenComplete(() {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            );
          });
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        highlightElevation: 0,
        borderSide: BorderSide(color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(image: AssetImage('assets/google.jpg',),height: 30,width: 30,),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Google',
                  style: TextStyle(
                      fontSize: 23,
                      color: Colors.black,
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }*/
/*
    return Scaffold(
      body: Form(
          key: formKey,
          child:Center(
        child: ListView(
          children: <Widget>[
           //  getImageAsset(),
              Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 25.0),
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    
                    decoration: InputDecoration(hintText: ' Enter your phone number',prefixText: '+91',prefixIcon: Icon(Icons.phone),enabledBorder: OutlineInputBorder(
          borderSide:BorderSide(color: Colors.grey)),
                border: OutlineInputBorder(),
          ),
                    onChanged: (val) {
                      setState(() {
                        this.phoneNo = '+91'+val;
                      });
                    },
                  )),
                  codeSent ? Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 25.0),
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(hintText: 'Enter OTP',prefixIcon: Icon(Icons.vpn_key),enabledBorder: OutlineInputBorder(
          borderSide:BorderSide(color: Colors.grey)),
          border: OutlineInputBorder(),),
                    onChanged: (val) {
                      setState(() {
                        this.smsCode = val;
                      });
                    },
                  )) : Container(),
              Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 25.0,top: 10),
                  child: RaisedButton(
                      child: Center(child: codeSent ? Text('Continue',style: TextStyle(fontSize: 20),):Text('Verify',style: TextStyle(fontSize: 20),)),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0),),
                      
                      onPressed: () {
                        AuthService().savePhoneNumber(this.phoneNo);
                        codeSent ? AuthService().signInWithOTP(smsCode, verificationId):verifyPhone(phoneNo);
                      })),
            SizedBox(height: 20,),
            Center(
              child: Text('Or Sign In With',
                style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 20,),
            _signInButton()
            ],
          )),
     ) );
  }
  Future<void> verifyPhone(phoneNo) async {
    final PhoneVerificationCompleted verified = (AuthCredential authResult) {
      AuthService().signIn(authResult);
    };
    final PhoneVerificationFailed verificationfailed =
        (AuthException authException) {
      print('${authException.message}');
    };
    final PhoneCodeSent smsSent = (String verId, [int forceResend]) {
      this.verificationId = verId;
      setState(() {
        this.codeSent = true;
      });
    };
    final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId) {
      this.verificationId = verId;
    };
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNo,
        timeout: const Duration(seconds: 5),
        verificationCompleted: verified,
        verificationFailed: verificationfailed,
        codeSent: smsSent,
        codeAutoRetrievalTimeout: autoTimeout);
  
}*/
    return Scaffold(
        backgroundColor: Color(0XFF3F51b5),
        body: Form(
            key: formKey,
            child: Center(
                child: ListView(children: <Widget>[
              SizedBox(
                height: 70,
              ),
              _topheader(),
              Expanded(
                  child: Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 32),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                        color: Colors.grey[50],
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      child: SingleChildScrollView(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                            SizedBox(height: 40),
                            _labelText(('Phone Number')),
                            Padding(
                                padding:
                                    EdgeInsets.only(left: 25.0, right: 25.0),
                                child: TextFormField(
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                    hintText:     AppLocalizations.of(context)
                                            .translate ('Enter your phone number')  ,
                                    prefixText: '+91',
                                    prefixIcon: Icon(Icons.phone),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey)),
                                    border: OutlineInputBorder(),
                                  ),
                                  onChanged: (val) {
                                    setState(() {
                                      this.phoneNo = '+91' + val;
                                    });
                                  },
                                )),
                            codeSent
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                        SizedBox(height: 40),
                                        _labelText("Enter OTP"),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 25.0, right: 25.0),
                                            child: TextFormField(
                                              keyboardType: TextInputType.phone,
                                              decoration: InputDecoration(
                                                hintText:     AppLocalizations.of(context)
                                            .translate ('Enter OTP')  ,
                                                prefixIcon: Icon(Icons.vpn_key),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color:
                                                                Colors.grey)),
                                                border: OutlineInputBorder(),
                                              ),
                                              onChanged: (val) {
                                                setState(() {
                                                  this.smsCode = val;
                                                });
                                              },
                                            ))
                                      ])
                                : Container(),
                            SizedBox(height: 20),
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                height: 46,
                                width: 160,
                                child: RaisedButton(
                                  onPressed: () {
                                    AuthService().savePhoneNumber(this.phoneNo);
                                    codeSent
                                        ? AuthService().signInWithOTP(
                                            smsCode, verificationId)
                                        : verifyPhone(phoneNo);
                                      
                                          saveData();
                                  },
                                  child: codeSent
                                      ? Text(
                                            AppLocalizations.of(context)
                                            .translate ('Continue'), 
                                          style: TextStyle(fontSize: 20),
                                        )
                                      : Text(
                                         AppLocalizations.of(context)
                                            .translate ('Verify')  , 
                                          style: TextStyle(fontSize: 20),
                                        ),
                                  color: Color(0XFF303f9f),
                                  textColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 12),
                                         Align(
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
                  ),
                            SizedBox(height: 18),
                          ]))))
            ]))));
  }

  /* _loginSocialMediaBtn(IconData icon, Color bgColor) {
      return SizedBox.fromSize(
        size: Size(54, 54), //button width and height
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Material(
            elevation: 16,
            shadowColor: Colors.black,
            color: bgColor,
            child: InkWell(
              splashColor: Colors.white12,
              onTap: () {
                signInWithGoogle().whenComplete(() {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
              );
            });
              },
              child: Center(
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ),
          ),
        ),
      );
    }
*/
  Future<void> verifyPhone(phoneNo) async {
    final PhoneVerificationCompleted verified = (AuthCredential authResult) {
      AuthService().signIn(authResult);
    };

    final PhoneVerificationFailed verificationfailed =
        (AuthException authException) {
      print('${authException.message}');
    };

    final PhoneCodeSent smsSent = (String verId, [int forceResend]) {
      this.verificationId = verId;
      setState(() {
        this.codeSent = true;
      });
    };

    final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId) {
      this.verificationId = verId;
    };
    

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNo,
        timeout: const Duration(seconds: 5),
        verificationCompleted: verified,
        verificationFailed: verificationfailed,
        codeSent: smsSent,
        codeAutoRetrievalTimeout: autoTimeout);
  }
saveData()
async{
          SharedPreferences prefs=await SharedPreferences.getInstance();
    String phno  = prefs.getString('Phone Number');
   await userCollection.document(user.uid).setData({
    "phno" :phno
    });
}
  _inputTextField(hintText, bool obscuretext) {
    return Container(
      height: 56,
      padding: EdgeInsets.fromLTRB(16, 3, 16, 6),
      margin: EdgeInsets.all(8),
      decoration: raisedDecoration,
      child: Center(
        child: TextField(
          obscureText: obscuretext,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: TextStyle(
                color: Colors.black38,
              )),
        ),
      ),
    );
  }

  _labelText(title) {
    return Padding(
      padding: EdgeInsets.only(left: 24),
      child: Text(
         AppLocalizations.of(context)
                                            .translate(title),
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: Colors.black,
          fontSize: 16,
        ),
      ),
    );
  }
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

  _topheader() {
    return Padding(
      padding: EdgeInsets.all( 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            AppLocalizations.of(context)
                                            .translate('Create\nYour\nAccount'),
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 28,
            ),
          ),
          Image.asset(
            'assets/register.png',
            height: 170,
            fit: BoxFit.fitHeight,
          )
        ],
      ),
    );
  }
}
