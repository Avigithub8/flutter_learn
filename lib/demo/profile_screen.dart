import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:authentification/Start.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late User user;
  bool isloggedin = false;

  checkAuthentification() async {
    _auth.authStateChanges().listen((user) {
      if (user == null) {
        Navigator.of(context).pushReplacementNamed("/");
      }
    });
  }

  getUser() async {
    User? firebaseUser = _auth.currentUser;
    await firebaseUser?.reload();
    firebaseUser = _auth.currentUser;

    if (firebaseUser != null) {
      setState(() {
        user = firebaseUser!;
        isloggedin = true;
      });
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();

    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
  }

  navigateToWelcome() {
    signOut();
    Navigator.of(context).pushReplacementNamed('/');
  }

  @override
  void initState() {
    super.initState();
    checkAuthentification();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile Screen'),
        ),
        body: Container(
          child: !isloggedin
              ? const CircularProgressIndicator()
              : Column(
                  children: <Widget>[
                    const SizedBox(height: 40.0),
                    Container(
                      height: 200,
                    ),
                    Text(
                      "Hello ${user.displayName} you are Logged in as ${user.email}",
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    ElevatedButton(
                      onPressed: navigateToWelcome,
                      style: ElevatedButton.styleFrom(
                          side: const BorderSide(
                              width: 2, color: Color.fromARGB(255, 7, 7, 7)), //
                          elevation: 3, //
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          backgroundColor:
                              const Color.fromARGB(255, 17, 227, 24),
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
        ));
  }
}
