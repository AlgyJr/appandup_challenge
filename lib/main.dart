import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'utils/providers/books_provider.dart';
import 'utils/services/auth_service.dart';
import 'screens/book_details_screen.dart';
import 'screens/sign_in_screen.dart';
import 'screens/sign_up_screen.dart';
import 'screens/home_screen.dart';

void main() async {
  // force status bar style to assume light mode style constantly
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarBrightness: Brightness.light));

  // Initialize FlutterFire
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  if (kIsWeb) {
    initializeFacebookWeb();
  }

  runApp(const MyApp());
}

void initializeFacebookWeb() {
  // initialiaze the facebook javascript SDK
  FacebookAuth.i.webInitialize(
    appId: "2896938917283017",
    cookie: true,
    xfbml: true,
    version: "v9.0",
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(lazy: false, create: (_) => AuthService()),
        ChangeNotifierProvider(create: (context) => BooksProvider()),
      ],
      child: MaterialApp(
        title: 'App and Up Challenge',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.blue, primarySwatch: Colors.blue),
        routes: {
          HomePage.routeName: (context) =>
              Consumer<AuthService>(builder: (context, authServices, child) {
                if (authServices.isLoggedIn()) {
                  return HomePage();
                } else {
                  return const SignInScreen();
                }
              }),
          BookDetailsScreen.routeName: (context) => const BookDetailsScreen(),
          SignInScreen.routeName: (context) => const SignInScreen(),
          SignUpScreen.routeName: (context) => const SignUpScreen(),
        },
      ),
    );
  }
}
