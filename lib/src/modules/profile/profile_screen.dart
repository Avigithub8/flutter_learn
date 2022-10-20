import 'package:flutter/material.dart';
import 'package:flutter_learn/src/modules/signup/controller/signup_bloc.dart';
import 'package:flutter_learn/src/routes/app_routes.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final SignupBloc _signupBloc = SignupBloc();

  navigatetoLogin() async {
    _signupBloc.signOut;
    Navigator.of(context).pushNamed(AppRoute.screenFirst);
  }

  //   navigatetoLogin()  {
  //   _signupBloc.signOut;
  //   Navigator.of(context).pushNamed(AppRoute.screenFirst);
  // }

  @override
  Widget build(BuildContext context) {
    final Map data = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
        child: Column(
          children: [
            Text(
              'This is ${data['email']}  Profile Screen and ${data['name']}',
              style: const TextStyle(
                color: Colors.amber,
                fontSize: 40,
              ),
            ),
            Text(
              'This is ${data["name"]}  Profile Screen and ${data['email']}',
              style: const TextStyle(
                color: Colors.amber,
                fontSize: 40,
              ),
            ),
            ElevatedButton(
              onPressed: navigatetoLogin,
              style: ElevatedButton.styleFrom(
                  side: const BorderSide(
                      width: 2, color: Color.fromARGB(255, 7, 7, 7)), //
                  elevation: 3, //
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  backgroundColor: const Color.fromARGB(255, 17, 227, 24),
                  padding: const EdgeInsets.only(
                      left: 40, right: 40, top: 10, bottom: 10)),
              child: const Text('Signout',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold)),
            )
          ],
        ),
      ),
    );
  }
}
