import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'auth/login_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(color: Colors.brown),
          // Other input decoration configurations
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.brown, // Change the cursor color here
          // Other text selection configurations
        ),
      ),
      home: LoginPage(),
    );
  }
}

// Your LoginPage and other code...