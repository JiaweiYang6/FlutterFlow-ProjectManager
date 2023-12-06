import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBKvB1TxO05cWIXotIlJG320riUygXaQbk",
            authDomain: "todolist-f46ea.firebaseapp.com",
            projectId: "todolist-f46ea",
            storageBucket: "todolist-f46ea.appspot.com",
            messagingSenderId: "1055837112834",
            appId: "1:1055837112834:web:1bca1aa805acd94c20f51b"));
  } else {
    await Firebase.initializeApp();
  }
}
