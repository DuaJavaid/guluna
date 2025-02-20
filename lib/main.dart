import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_page/login_screen.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
  await Firebase.initializeApp(options:FirebaseOptions( apiKey: "AIzaSyACeEr74RPxRdwc-H45VpyuH4h5NCKB64w",
  authDomain: "ecommerce-cbdb6.firebaseapp.com",
  projectId: "ecommerce-cbdb6",
  storageBucket: "ecommerce-cbdb6.firebasestorage.app",
  messagingSenderId: "474168558860",
  appId: "1:474168558860:web:b1f5925d8b31207340b529"));
  }
  else{
      await Firebase.initializeApp();
  }
  runApp(const GullunaApp());
}

class GullunaApp extends StatelessWidget {
  const GullunaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:MyLogin(), // Start with login page
    );
  }
}
