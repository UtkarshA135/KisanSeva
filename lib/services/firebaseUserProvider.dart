import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';


class FirebaseUserProvider extends ChangeNotifier{
  FirebaseUser user;

  FirebaseUserProvider(){
    _getUser();
  }
  
  _getUser()async {
    this.user = await FirebaseAuth.instance.currentUser();
    // this.user = await UserCredential.;
    notifyListeners();
        print('user active');
  }
}