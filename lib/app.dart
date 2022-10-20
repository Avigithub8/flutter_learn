import 'package:flutter/material.dart';
import 'package:flutter_learn/src/modules/http/home_screen.dart';
import 'package:flutter_learn/src/modules/http_list/view/http_api_ui.dart';
// import 'package:flutter_learn/src/modules/http/home_screen.dart';
// import 'package:flutter_learn/src/modules/http_list/view/http_api_ui.dart';
import 'package:flutter_learn/src/modules/testproject/home_screen.dart';
//import 'package:flutter_learn/src/modules/testproject/home_screen.dart';
// import 'package:flutter_learn/demo/profile_screen.dart';
// import 'package:flutter_learn/demo/login.dart';
// import 'package:flutter_learn/demo/signup.dart';
// import 'package:flutter_learn/demo/welcome_screen.dart';
// import 'package:flutter_learn/home.dart';
// import 'package:flutter_learn/src/modules/googlemap/current_location.dart';
// import 'package:flutter_learn/src/modules/googlemap/home_screen_map.dart';
// import 'package:flutter_learn/src/modules/googlemap/simple_google_map.dart';
// import 'package:flutter_learn/src/modules/http/home_screen.dart';

// import 'package:flutter_learn/demo/first_screen.dart';
// import 'package:flutter_learn/demo/fourth_screen.dart';
// import 'package:flutter_learn/demo/screen1.dart';
// import 'package:flutter_learn/demo/screen2.dart';
// import 'package:flutter_learn/demo/screen3.dart';
// import 'package:flutter_learn/demo/screen4.dart';
// import 'package:flutter_learn/demo/second_screen.dart';
// import 'package:flutter_learn/demo/third_screen.dart';
//import 'package:flutter_learn/home.dart';
// import 'package:flutter_learn/src/modules/signin/view/login.dart';
// import 'package:flutter_learn/src/modules/signup/view/registration.dart';
// import 'package:flutter_learn/src/modules/profile/profile_screen.dart';
// import 'package:flutter_learn/src/modules/splash_screen/splash_screen.dart';
// import 'package:flutter_learn/src/modules/testproject/home_screen.dart';
// import 'package:flutter_learn/src/modules/tutorial/view/tutorial_screen.dart';
// import 'package:flutter_learn/src/routes/app_routes.dart';
//import 'routes/route.dart' as route;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mail App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //debugShowCheckedModeBanner: false,
      // home: const LoginScreen(),
      // routes: {
      //   "LoginScreen": (context) {
      //     return const LoginScreen();
      //   },
      //   "RegistrationScreen": (context) {
      //     return const RegistrationScreen();
      //   },
      //   "ProfileScreen": (context) {
      //     return const ProfileScreen();
      //   },
      //   "TutorialScreen": (context) {
      //     return const TutorialScreen();
      //   },
      // },

      // home: const WelcomeScreen(),
      // routes: {
      //   "Login": (context) => const Login(),
      //   "SignUp": (context) => const SignUp(),
      //   "ProfilePage": (context) => const ProfilePage(),
      // },

      // onGenerateRoute: AppRoute.controller,

      // initialRoute: AppRoute.screenSplash,
      // routes: {
      //   AppRoute.screenSplash: (context) => const SplashScreen(),
      //   AppRoute.screenFirst: (context) => const LoginScreen(),
      //   AppRoute.screenSecond: (context) => const RegistrationScreen(),
      //   AppRoute.screenThird: (context) => const ProfileScreen(),
      //   AppRoute.screenFourth: (context) => const TutorialScreen(),
      // },

      //home: const HomeScreen(),
      // home: const HomeScreenMap(),
      // routes: {
      //   "SimpleGoogleMapScreen": (context) => const SimpleGoogleMapScreen(),
      //   //"CurrentLocationScreen": (context) => const CurrentLocationScreen(),
      //   // "ProfilePage": (context) => const ProfilePage(),
      // },
      home: const HomeScreenHttp(),
      routes: {
        "HttpScreen": (context) => const HttpScreen(),
      },
    );
  }
}

















 //home: const MyHomePage(title: 'Mail App Home Page'),
      // home: const Screen1(),
      // routes: {
      //   "firstScreen": (context) {
      //     return const Screen1();
      //   },
      //   "secondScreen": (context) {
      //     return const Screen2();
      //   },
      //   "thirdScreen": (context) {
      //     return const Screen3();
      //   },
      //   "fourScreen": (context) {
      //     return const Screen4();
      //   }
      // },

      // onGenerateRoute: route.controller,
      // initialRoute: route.screenFirst,
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => const FirstScreen(),
      //   '/second': (context) => const SecondScreen(),
      //   '/third': (context) => const ThirdScreen(),
      //   '/fourth': (context) => const FourthScreen(),
      // },

      // home: const HomePage(),
      // routes: {
      //   "Login": (context) => const Login(),
      //   "SignUp": (context) => const SignUp(),
      //   "start": (context) => const Start(),
      // },