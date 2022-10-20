// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_learn/demo/signup.dart';
import 'package:flutter_learn/src/utils/helper/validation.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late String _email, _password;

  bool passwordVisible = false;

  checkAuthentification() async {
    _auth.authStateChanges().listen((user) {
      if (user != null) {
        print(user);

        Navigator.pushReplacementNamed(context, "ProfilePage");
      }
    });
  }

  @override
  void initState() {
    super.initState();
    checkAuthentification();
  }

  login() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      try {
        await _auth.signInWithEmailAndPassword(
            email: _email, password: _password);
      } catch (e) {
        showError(e.toString());
        print(e);
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

  navigateToSignUp() async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const SignUp()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login Screen'),
        ),
        body: Container(
          padding: const EdgeInsets.only(
            top: 150,
            left: 20,
          ),
          child: Column(
            children: <Widget>[
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    _emailFormField(),
                    const SizedBox(height: 20),
                    _passwordForm(),
                    const SizedBox(height: 20),
                    _loginButton(),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              GestureDetector(
                onTap: navigateToSignUp,
                child: const Text('Create an Account?Sign Up',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    )),
              )
            ],
          ),
        ));
  }

  Widget _emailFormField() {
    return TextFormField(
        cursorColor: Colors.redAccent,
        keyboardType: TextInputType.emailAddress,
        autofocus: true,
        //focusNode: _emailFocus,
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

  Widget _loginButton() {
    return ElevatedButton(
      onPressed: login,
      style: ElevatedButton.styleFrom(
          side: const BorderSide(
              width: 2, color: Color.fromARGB(255, 7, 7, 7)), //
          elevation: 3, //
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: const Color.fromARGB(255, 17, 227, 24),
          padding:
              const EdgeInsets.only(left: 40, right: 40, top: 10, bottom: 10)),
      child: const Text('LOGIN',
          style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold)),
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
}
