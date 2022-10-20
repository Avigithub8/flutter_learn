import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:google_sign_in/google_sign_in.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential> googleSignIn() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    if (googleUser != null) {
      GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      if (googleAuth.idToken != null && googleAuth.accessToken != null) {
        final AuthCredential credential = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

        final UserCredential user =
            await _auth.signInWithCredential(credential);

        // ignore: use_build_context_synchronously
        await Navigator.pushReplacementNamed(context, "ProfilePage");

        return user;
      } else {
        throw StateError('Missing Google Auth Token');
      }
    } else {
      throw StateError('Sign in Aborted');
    }
  }

  navigateToLogin() async {
    Navigator.pushReplacementNamed(context, "Login");
  }

  navigateToRegister() async {
    Navigator.pushReplacementNamed(context, "SignUp");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          const SizedBox(height: 35.0),
          Container(
            height: 200,
          ),
          const SizedBox(height: 20),
          _headingButton(),
          const SizedBox(height: 10.0),
          _smallheadingText(),
          const SizedBox(height: 30.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _loginButton(),
              const SizedBox(width: 20.0),
              _registerButton(),
            ],
          ),
          const SizedBox(height: 40.0),
          _googleButton(),
        ],
      ),
    );
  }

  Widget _headingButton() {
    return RichText(
        text: const TextSpan(
            text: 'Welcome to ',
            style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.black),
            children: <TextSpan>[
          TextSpan(
              text: 'My App',
              style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange))
        ]));
  }

  Widget _smallheadingText() {
    return const Text(
      'You can login via email and goole signin',
      style: TextStyle(
        color: Colors.black,
        fontSize: 12,
      ),
    );
  }

  Widget _loginButton() {
    return ElevatedButton(
      onPressed: navigateToLogin,
      style: ElevatedButton.styleFrom(
          side: const BorderSide(
              width: 2, color: Color.fromARGB(255, 7, 7, 7)), //
          elevation: 3, //
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: const Color.fromARGB(255, 17, 227, 24),
          padding:
              const EdgeInsets.only(left: 40, right: 40, top: 10, bottom: 10)),
      child: const Text(
        'LOGIN',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _registerButton() {
    return ElevatedButton(
      onPressed: navigateToRegister,
      style: ElevatedButton.styleFrom(
          side: const BorderSide(
              width: 2, color: Color.fromARGB(255, 7, 7, 7)), //
          elevation: 3, //
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: const Color.fromARGB(255, 227, 17, 17),
          padding:
              const EdgeInsets.only(left: 40, right: 40, top: 10, bottom: 10)),
      child: const Text(
        'REGISTER',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _googleButton() {
    return ElevatedButton(
        onPressed: googleSignIn,
        style: ElevatedButton.styleFrom(
            side: const BorderSide(
                width: 2, color: Color.fromARGB(255, 7, 7, 7)), //
            elevation: 3, //
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            backgroundColor: const Color.fromARGB(255, 79, 9, 218),
            padding: const EdgeInsets.only(
                left: 40, right: 40, top: 15, bottom: 15)),
        child: const Text(
          "Sign In with Google",
          style: TextStyle(
            fontSize: 20,
          ),
        ));
  }
}
