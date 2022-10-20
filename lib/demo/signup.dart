// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_learn/demo/login.dart';
import 'package:flutter_learn/src/utils/helper/validation.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late String _name, _email, _password;

  bool passwordVisible = false;
  checkAuthentication() async {
    _auth.authStateChanges().listen((user) async {
      if (user != null) {
        Navigator.pushReplacementNamed(context, "ProfilePage");
      }
    });
  }

  @override
  void initState() {
    super.initState();
    checkAuthentication();
  }

  signUp() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      try {
        // ignore: deprecated_member_use
        await _auth.currentUser?.updateProfile(displayName: _name);
      } catch (e) {
        showError(e.toString());
      }
    }
  }

  showError(String errormessage) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('ERROR'),
            content: Text(errormessage),
            actions: <Widget>[
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'))
            ],
          );
        });
  }

  navigateToLoginScreen() async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Login()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sign Up Screen'),
        ),
        body: Column(
          children: <Widget>[
            Container(
              height: 100,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  _userNameForm(),
                  const SizedBox(
                    height: 20,
                  ),
                  _emailForm(),
                  const SizedBox(
                    height: 20,
                  ),
                  _passwordForm(),
                  const SizedBox(
                    height: 20,
                  ),
                  _signupButton(),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: navigateToLoginScreen,
                    child: const Text('Aleady have an account?login',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        )),
                  )
                ],
              ),
            ),
          ],
        ));
  }

  Widget _userNameForm() {
    return TextFormField(
        //controller: _name,
        cursorColor: Colors.redAccent,
        keyboardType: TextInputType.text,
        autofocus: true,
        textInputAction: TextInputAction.next,
        validator: (value) {
          return Validators.validateName(value);
        },
        onSaved: (input) => _name = input!,
        inputFormatters: [
          LengthLimitingTextInputFormatter(30),
          FilteringTextInputFormatter.allow(
            RegExp(r'[A-Za-z ]'),
          )
        ],
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.people),
          labelText: "Username",
          enabledBorder: myinputborder(),
          focusedBorder: myfocusborder(),
          constraints: const BoxConstraints(maxWidth: 350),
        ));
  }

  Widget _emailForm() {
    return TextFormField(
        cursorColor: Colors.redAccent,
        keyboardType: TextInputType.emailAddress,
        autofocus: true,
        textInputAction: TextInputAction.next,
        onSaved: (input) => _email = input!,
        validator: (value) {
          return Validators.validateEmail(value);
        },
        inputFormatters: [
          LengthLimitingTextInputFormatter(50),
          FilteringTextInputFormatter.allow(
            RegExp(r'[A-Za-z0-9@._]'),
          )
        ],
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.mail),
          labelText: "Email",
          enabledBorder: myinputborder(),
          focusedBorder: myfocusborder(),
          constraints: const BoxConstraints(maxWidth: 350),
        ));
  }

  Widget _passwordForm() {
    return TextFormField(
      obscureText: true,
      onSaved: (input) => _password = input!,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.lock),
        labelText: "Password",
        enabledBorder: myinputborder(),
        focusedBorder: myfocusborder(),
        constraints: const BoxConstraints(maxWidth: 350),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              passwordVisible = !passwordVisible;
            });
          },
          icon: passwordVisible
              ? const Icon(
                  Icons.remove_red_eye_outlined,
                )
              : const Icon(
                  Icons.remove_red_eye,
                ),
        ),
      ),
    );
  }

  OutlineInputBorder myinputborder() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(
        color: Colors.redAccent,
        width: 3,
      ),
    );
  }

  OutlineInputBorder myfocusborder() {
    return const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
          color: Colors.greenAccent,
          width: 3,
        ));
  }

  Widget _signupButton() {
    return ElevatedButton(
      onPressed: signUp,
      style: ElevatedButton.styleFrom(
          side: const BorderSide(
            width: 2,
            color: Color.fromARGB(255, 11, 11, 11),
          ),
          elevation: 3,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: const Color.fromARGB(255, 234, 11, 11),
          padding:
              const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10) //
          ),
      child: const Text(
        'Sign Up',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 8, 8, 8),
        ),
      ),
    );
  }
}
