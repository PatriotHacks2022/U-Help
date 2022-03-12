import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:swipe_shop_flutter/screens/email_verification_page.dart';
import 'package:swipe_shop_flutter/utils/firebase_authentication/fire_auth.dart';
import 'package:swipe_shop_flutter/utils/firebase_authentication/validator.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();

  bool _isProcessing = false;

  Future<FirebaseApp> _initializeFirebase() async {
    /// Instance of firebase app.
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    /// Instance of the firebase user
    User? user = FirebaseAuth.instance.currentUser;

    // if user is not null then show the profile page.
    if (user != null) {
      // show profile page.
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => EmailVerificationPage(
            user: user,
          ),
        ),
      );
    }

    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    GestureDetector gestureDetector = GestureDetector();
    gestureDetector = GestureDetector(
      onTap: () {
        _focusEmail.unfocus();
        _focusPassword.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 16.0),
              Row(
                children: const [
                  SizedBox(
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: FractionalOffset.centerRight,
                      child: CloseButton(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: const [
                        Text(
                          'Email',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 4.0),
                    SizedBox(
                      child: TextFormField(
                        controller: _emailTextController,
                        focusNode: _focusEmail,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) => Validator.validateEmail(
                          email: value,
                        ),
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(10.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          hintText: 'Email Address',
                        ),
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    Row(
                      children: const [
                        Text(
                          'Password',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 4.0),
                    SizedBox(
                      child: TextFormField(
                        obscureText: true,
                        controller: _passwordTextController,
                        focusNode: _focusPassword,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) => Validator.validatePassword(password: value),
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(10.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          hintText: 'Password',
                        ),
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Row(
                      children: [
                        Expanded(
                          child: Align(
                            alignment: FractionalOffset.centerLeft,
                            child: InkWell(
                              onTap: () {print("hello");},
                              child: const SizedBox(
                                height: 16,
                                child: Text(
                                  'Forgot Password?',
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red.withOpacity(0.2),
                        shadowColor: Colors.transparent,
                        // makes buttons round.
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        // makes button height 50 and matches width
                        minimumSize: const Size.fromHeight(50),
                      ),
                      onPressed: () async {
                        _focusEmail.unfocus();
                        _focusPassword.unfocus();

                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            _isProcessing = true;
                          });

                          User? user = await FireAuth.signInUsingEmailPassword(
                            email: _emailTextController.text,
                            password: _passwordTextController.text,
                          );

                          setState(() {
                            _isProcessing = false;
                          });

                          if (user != null) {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const HomePage(),//EmailVerificationPage(user: user),
                              ),
                            );
                          }
                        }
                      },
                      child: const Text(
                        'Sign In',
                        style: TextStyle(fontSize: 16, color: Colors.red),
                      ),
                    ),
                    const SizedBox(height:16.0),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
    return gestureDetector;
  }
}
