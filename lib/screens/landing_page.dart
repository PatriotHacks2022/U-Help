import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swipe_shop_flutter/screens/login_page.dart';
import 'package:swipe_shop_flutter/screens/registration_page.dart';
import 'package:swipe_shop_flutter/utils/apple_sign_in/apple_sign_in_button.dart';
import 'package:swipe_shop_flutter/utils/google_sign_in/google_sign_in_button.dart';
import 'package:swipe_shop_flutter/utils/apple_sign_in/apple_sign_in_available.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}


/// The state for the home page.
class _LandingPageState extends State<LandingPage> {

  @override
  Widget build(BuildContext context) {
    final appleSignInAvailable =
    Provider.of<AppleSignIsAvailable>(context, listen: false);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    //Image.asset('assets/logos/test_logos/Logo_test1.png'),
                    const SizedBox(height: 150),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        // makes buttons round.
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        // makes button height 50 and matches width
                        minimumSize: const Size.fromHeight(50),
                      ),
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const RegisterationPage(),
                        ),
                      ),
                      child: const Text(
                        'Create new account',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    // space out the buttons.
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0.0,
                        primary: Colors.red.withOpacity(0.2),
                        shadowColor: Colors.transparent,
                        // makes buttons round.
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        // makes button height 50 and matches width
                        minimumSize: const Size.fromHeight(50),
                      ),
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      ),
                      child: const Text(
                        'Sign in',
                        style: TextStyle(fontSize: 16, color: Colors.red),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    const Text(
                      'or',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    if (appleSignInAvailable.isAvailable)
                      const AppleSignInButton(), // this shouldn't show up in android
                    const GoogleSignInButton(),
                    const SizedBox(height: 24.0),
                    SizedBox(
                      width: 265,
                      child:RichText(
                        textAlign: TextAlign.justify,
                        text: const TextSpan(
                          // Note: Styles for TextSpans must be explicitly defined.
                          // Child text spans will inherit styles from parent
                          style: TextStyle(
                            fontSize: 10.0,
                            color: Colors.grey,
                          ),
                          children: <TextSpan>[
                            TextSpan(text: 'By continuing you agree to our '),
                            TextSpan(
                              text: 'Terms of Service',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                                text: '. App services are subject to our '),
                            TextSpan(
                              text: 'Privacy Policy',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ),
    );
  }
}