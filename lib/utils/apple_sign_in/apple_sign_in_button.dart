import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:swipe_shop_flutter/app.dart';
import 'package:swipe_shop_flutter/utils/apple_sign_in/apple_authentication.dart';
import 'package:swipe_shop_flutter/utils/sign_in_buttons/flutter_signin_button.dart';

class AppleSignInButton extends StatefulWidget {
  const AppleSignInButton({Key? key}) : super(key: key);

  @override
  _AppleSignInButtonState createState() => _AppleSignInButtonState();
}

class _AppleSignInButtonState extends State<AppleSignInButton> {
  bool _isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: _isSigningIn
          ? const CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
      )
          : SignInButton(
        Buttons.AppleDark,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        onPressed: () async {
          setState(() {
            _isSigningIn = true;
          });
          User? user =
          await AppleAuthentication.signInWithApple(context: context);

          setState(() {
            _isSigningIn = false;
          });

          if (user != null) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => App()/*EmailVerificationPage(
                  user: user,
                ),*/
              ),
            );
          }
        },
      ),
    );
  }
}
