import 'package:flutter/material.dart';
import 'package:flutter_learn/src/modules/profile/profile_screen.dart';
import 'package:flutter_learn/src/modules/signin/view/login.dart';
import 'package:flutter_learn/src/modules/signup/view/registration.dart';
import 'package:flutter_learn/src/modules/splash_screen/splash_screen.dart';
import 'package:flutter_learn/src/modules/tutorial/view/tutorial_screen.dart';

// Control our page route flow

class AppRoute {
  static const String screenSplash = 'SplashScreen';
  static const String screenFirst = 'LoginScreen';
  static const String screenSecond = 'RegistrationScreen';
  static const String screenThird = 'ProfileScreen';
  static const String screenFourth = 'TutorialScreen';
  static Route<dynamic> controller(RouteSettings settings) {
    switch (settings.name) {
      case screenSplash:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case screenFirst:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case screenSecond:
        return MaterialPageRoute(
            builder: (context) => const RegistrationScreen());
      case screenThird:
        return MaterialPageRoute(builder: (context) => const ProfileScreen());
      case screenFourth:
        return MaterialPageRoute(builder: (context) => const TutorialScreen());
      default:
        throw ('This route name does not exit');
    }
  }
}
