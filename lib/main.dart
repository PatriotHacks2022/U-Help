import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swipe_shop_flutter/screens/landing_page.dart';
import 'package:swipe_shop_flutter/utils/google_sign_in/google_auth.dart';
import 'package:swipe_shop_flutter/utils/apple_sign_in/apple_sign_in_available.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final appleSignInAvailable = await AppleSignIsAvailable.check();
  runApp(Provider<AppleSignIsAvailable>.value(
    value: appleSignInAvailable,
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.light(),
      title: 'Flutter Authentication',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.red,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(
              fontSize: 24.0,
            ),
            padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
          ),
        ),
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 46.0,
            color: Colors.red,
            fontWeight: FontWeight.w500,
          ),
          bodyText1: TextStyle(fontSize: 18.0),
        ),
      ),
      home: FutureBuilder(
        future: Authentication.initializeFirebase(context: context),
        builder: (BuildContext context, snapshot) {
          return const LandingPage();
        },
      ),
    );
  }
}
