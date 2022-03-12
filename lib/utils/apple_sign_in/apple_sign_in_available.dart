import 'dart:io' show Platform;

import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AppleSignIsAvailable {
  AppleSignIsAvailable(this.isAvailable);
  final bool isAvailable;

  static Future<AppleSignIsAvailable> check() async {
    if(Platform.isAndroid){
      return AppleSignIsAvailable(false);
    }
    return AppleSignIsAvailable(await SignInWithApple.isAvailable());
  }
}