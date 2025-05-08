import 'package:flutter/material.dart';
import 'package:quick_help/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:quick_help/firebase_options.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  // Load .env
  await dotenv.load();

  // Ensure that plugin services are initialized before running the app
  WidgetsFlutterBinding.ensureInitialized();
  
  //Firebase Initialization
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  //Run the app
  runApp(const App());
}
