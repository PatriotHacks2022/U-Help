import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:swipe_shop_flutter/screens/home_page.dart';
import 'package:swipe_shop_flutter/screens/login_page.dart';
import 'package:swipe_shop_flutter/screens/email_verification_page.dart';
import 'package:swipe_shop_flutter/utils/google_sign_in/google_auth.dart';
import 'package:swipe_shop_flutter/utils/firebase_authentication/fire_auth.dart';
import 'package:swipe_shop_flutter/utils/firebase_authentication/validator.dart';

class RegisterationPage extends StatefulWidget {
  const RegisterationPage({Key? key}) : super(key: key);

  @override
  _RegisterationPageState createState() => _RegisterationPageState();
}

class _RegisterationPageState extends State<RegisterationPage> {
  final _registerFormKey = GlobalKey<FormState>();

  final _firstNameTextController = TextEditingController();
  final _lastNameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  final _focusFirstName = FocusNode();
  final _focusLastName = FocusNode();
  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();

  bool _isProcessing = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _focusFirstName.unfocus();
        _focusLastName.unfocus();
        _focusEmail.unfocus();
        _focusPassword.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _registerFormKey,
              child: Column(
                children: [
                  Expanded(
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
                                'Create Account',
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
                        const SizedBox(height: 8.0),
                        Row(
                          children: const [
                            Text(
                              'First Name',
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
                            controller: _firstNameTextController,
                            focusNode: _focusFirstName,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) => Validator.validateName(
                              name: value,
                            ),
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(10.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                              hintText: 'First Name',
                            ),
                          ),
                        ),
                        const SizedBox(height: 12.0),
                        Row(
                          children: const [
                            Text(
                              'Last Name',
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
                            controller: _lastNameTextController,
                            focusNode: _focusLastName,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) => Validator.validateName(
                              name: value,
                            ),
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(10.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                              hintText: 'Last Name',
                            ),
                          ),
                        ),
                        const SizedBox(height: 12.0),
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
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
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
                            controller: _passwordTextController,
                            focusNode: _focusPassword,
                            obscureText: true,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              String? errorMsg =
                                  Validator.validatePassword(password: value);
                              return errorMsg;
                            },
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(10.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                              hintText: 'Minimum 8 characters',
                            ),
                          ),
                        ),
                        const SizedBox(height: 32.0),
                        Align(
                          alignment: FractionalOffset.bottomCenter,
                          child: _isProcessing
                              ? const CircularProgressIndicator()
                              : ElevatedButton(
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
                              setState(() {
                                _isProcessing = true;
                              });

                              if (_registerFormKey.currentState!
                                  .validate()) {
                                User? user = await FireAuth
                                    .registerUsingEmailPassword(
                                  name:
                                  '${_firstNameTextController.text} ${_lastNameTextController.text}',
                                  email: _emailTextController.text,
                                  password:
                                  _passwordTextController.text,
                                );

                                setState(() {
                                  _isProcessing = false;
                                });

                                if (user != null) {
                                  Navigator.of(context)
                                      .pushAndRemoveUntil(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                      //EmailVerificationPage(user: user),
                                      const HomePage(),
                                    ),
                                    ModalRoute.withName('/'),
                                  );
                                }
                              } else {
                                setState(() {
                                  _isProcessing = false;
                                });
                              }
                            },
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.red),
                            ),
                          ),
                        ),
                        const SizedBox(height:16.0),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
