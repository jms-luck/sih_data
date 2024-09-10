import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBC84uanbfW4gpSRXBEQ7btW4E0Bp4ZPAs",
            authDomain: "login-cedfa.firebaseapp.com",
            projectId: "login-cedfa",
            storageBucket: "login-cedfa.appspot.com",
            messagingSenderId: "725882502913",
            appId: "1:725882502913:web:bea48c8bcaf396ba00e500",
            measurementId: "G-YK63FTQ8L5"));
  } else {
    await Firebase.initializeApp();
  }
}
