// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_learn/src/modules/profile/profile_screen.dart';
// import 'package:flutter_learn/src/modules/signin/view/login.dart';
// import 'package:flutter_learn/src/modules/signup/view/registration.dart';
// import 'package:flutter_learn/src/modules/splash_screen/splash_screen.dart';
// import 'package:flutter_learn/src/modules/tutorial/view/tutorial_screen.dart';
// import 'package:flutter_learn/src/modules/tutorial/view/tutorial_screen.dart';
// import 'package:flutter_learn/src/routes/app_routes.dart';
// import 'package:flutter_test/flutter_test.dart';

// void main() {
//   testWidgets('testing tutorial', (widgetTester) async {
//     Widget widget = MaterialApp(
//       title: 'Testing',
//       theme: ThemeData(
//         useMaterial3: true,
//         primarySwatch: Colors.blue,
//       ),
//       home: const TutorialScreen(),
//       routes: {
//         "TutorialScreen": (context) {
//           return const TutorialScreen();
//         },
//         "LoginScreen": (context) {
//           return const LoginScreen();
//         },
//         "RegistrationScreen": (context) {
//           return const RegistrationScreen();
//         },
//         "ProfileScreen": (context) {
//           return const ProfileScreen();
//         },
//       },
//     );
//     await widgetTester.pumpWidget(widget);
//     await widgetTester.pumpAndSettle();
//     await widgetTester.pump(const Duration(seconds: 2));
//     await widgetTester.pumpAndSettle();
//     await widgetTester.longPress(find.byType(GestureDetector).first);
//     await widgetTester.tap(find.byType(ElevatedButton));
//   });
// }
