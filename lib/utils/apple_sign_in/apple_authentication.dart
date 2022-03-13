import 'dart:convert';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:swipe_shop_flutter/screens/email_verification_page.dart';

import '../../app.dart';

class AppleAuthentication{

  /// Generates a cryptographically secure random nonce, to be included in a
  /// credential request.
  static String generateNonce([int length = 32]) {
    const charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  /// Returns the sha256 hash of [input] in hex notation.
  static String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  static Future<void> addUser(String ?name, String ?uid) async{
    // Create a CollectionReference called users that references the firestore collection
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    try{
      var doc = await users.doc(uid).get();
      if(!doc.exists){
        return users.doc(uid).set(
            {
              'fullname':name,
            }
        ).then((value) => print("User Added"))
            .catchError((error) => print("Failed to add user: $error"));
      }
    }catch (e){
      throw e;
    }
  }

  static Future<User?> signInWithApple({required BuildContext context}) async {
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);

    try{
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        webAuthenticationOptions: WebAuthenticationOptions(
          clientId:
          'com.mazellc.swipeShopFlutter',
          redirectUri: Uri.parse(
            'https://swipeshop-47ef0.firebaseapp.com/__/auth/handler',
          ),
        ),
        nonce: nonce,
        state: 'example-state',
      );

// Create an `OAuthCredential` from the credential returned by Apple.
      final oauthCredential = OAuthProvider("apple.com").credential(
        idToken: credential.identityToken,
        rawNonce: rawNonce,
      );


// Sign in the user with Firebase. If the nonce we generated earlier does
// not match the nonce in `appleCredential.identityToken`, sign in will fail.
      final authResult =
      await _firebaseAuth.signInWithCredential(oauthCredential);
      // this means an account has been created with us?
      final displayName =
          '${credential.givenName} ${credential.familyName}';
      final userEmail = '${credential.email}';
      print(displayName);
      final firebaseUser = authResult.user;

      if(credential.email != null){
        await firebaseUser!.updateDisplayName(displayName);
        await firebaseUser.updateEmail(userEmail);
      }

      if(firebaseUser != null){
        
        await addUser(displayName, firebaseUser.uid);
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => App()//
          ),
        );
      }

      return firebaseUser;
    }catch(exception){
      print(exception);
    }

    return null;
  }
}