import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/book_details_screen.dart';
import 'screens/sign_in_screen.dart';
import 'screens/sign_up_screen.dart';
import 'screens/home_screen.dart';

void main() async {
  // force status bar style to assume light mode style constantly
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarBrightness: Brightness.light));

  // Initialize FlutterFire
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App and Up Challenge',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue, primarySwatch: Colors.blue),
      initialRoute: SignInScreen.routeName,
      routes: {
        '/': (context) => HomePage(),
        BookDetailsScreen.routeName: (context) => const BookDetailsScreen(),
        SignInScreen.routeName: (context) => const SignInScreen(),
        SignUpScreen.routeName: (context) => const SignUpScreen(),
      },
    );
  }
}
