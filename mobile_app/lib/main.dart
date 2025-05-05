import 'package:flutter/material.dart';
import 'package:quick_help/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:quick_help/firebase_options.dart';


Future<void> main() async {
  
  //Firebase Initialization
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  //Run the app
  runApp(const App());
}
