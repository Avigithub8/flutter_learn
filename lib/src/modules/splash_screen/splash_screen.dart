import 'dart:async';

import 'package:flutter/material.dart';
// import 'package:flutter_learn/src/constant/app_constant.dart';
import 'package:flutter_learn/src/modules/preference/preference.dart';
// import 'package:flutter_learn/src/modules/preference/preference_helper.dart';
import 'package:flutter_learn/src/routes/app_routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    _navigateToNextScreen(context);
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Text(
              "Spash Screen",
              style: TextStyle(fontSize: 50),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToNextScreen(BuildContext context) {
    Future.delayed(const Duration(seconds: 6), () {
      bool isTutorialViewed = Preference.isTutorialView ?? false;
      if (isTutorialViewed) {
        Navigator.pushNamed(context, AppRoute.screenSecond);
      } else {
        Navigator.pushNamed(context, AppRoute.screenFourth);
      }
    });
  }
}
