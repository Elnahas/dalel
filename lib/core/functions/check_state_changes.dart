import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

void checkStateChanges() {
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if(user == null){
      if (kDebugMode) {
        print("user out");
      }
    }
    else{
      if (kDebugMode) {
        print("user in");
      }
    }
  });
}