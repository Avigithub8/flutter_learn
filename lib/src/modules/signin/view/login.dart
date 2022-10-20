import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:flutter_learn/src/authentication/singnup/registration.dart';
//import 'package:flutter_learn/src/modules/profile/profile_screen.dart';
import 'package:flutter_learn/src/modules/signin/controller/signin_bloc.dart';
//import 'package:flutter_learn/src/modules/signin/view_model/signin_model.dart';
//import 'package:flutter_learn/src/modules/signup/controller/signup_bloc.dart';

import 'package:flutter_learn/src/routes/app_routes.dart';
//import 'package:flutter_learn/src/utils/custon_widget/snack_bar.dart';
import 'package:flutter_learn/src/utils/helper/validation.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // ignore: unused_field
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool passwordVisible = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  final SigninBloc _signinBloc = SigninBloc();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  void initState() {
    email.text = "";
    password.text = "";
    super.initState();
  }

  navigateToProfile() {
    if (_signinBloc.state.responseModel?.data != null) {
      Navigator.pushNamed(context, AppRoute.screenThird,
          arguments: _signinBloc.state.responseModel?.data);
    }
  }

  navigateToTutorial() {
    // Navigator.of(context).pushNamed(
    //   'TutorialScreen',
    // );
    Navigator.pushNamed(context, AppRoute.screenFirst);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      padding: const EdgeInsets.only(
        top: 250,
        left: 30,
        right: 30,
        bottom: 20,
      ),
      child: Form(
        key: _formKey,
        child: ListView(children: [
          _emailFormField(),
          const SizedBox(
            height: 20,
          ),
          _passwordFormField(),
          const SizedBox(
            height: 40,
          ),
          _loginButton(),
          const SizedBox(
            height: 20,
          ),
          _goToHome(),
          const SizedBox(
            height: 20,
          ),
          _goToTutorial(),
        ]),
      ),
    ));
  }

  OutlineInputBorder _myinputborder() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(
        color: Colors.redAccent,
        width: 3,
      ),
    );
  }

  OutlineInputBorder _myfocusborder() {
    return const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
          color: Colors.greenAccent,
          width: 3,
        ));
  }

  Widget _emailFormField() {
    return TextFormField(
        controller: email,
        cursorColor: Colors.redAccent,
        keyboardType: TextInputType.emailAddress,
        autofocus: true,
        //focusNode: _emailFocus,
        textInputAction: TextInputAction.next,
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
          enabledBorder: _myinputborder(),
          focusedBorder: _myfocusborder(),
          constraints: const BoxConstraints(maxWidth: 350),
        ));
  }

  Widget _passwordFormField() {
    return TextFormField(
      controller: password,
      obscureText: true,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.lock),
        labelText: "Password",
        enabledBorder: _myinputborder(),
        focusedBorder: _myfocusborder(),
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
      //onPressed: _signinBloc.login(String email,String password) ,            //navigateToProfile;
      // else {
      //   AppSnackBar.showSnackBar(
      //     context: context,
      //     message: _signinBloc.state.responseModel?.statusMessage ?? "",
      //   );
      // }
      onPressed: () {
        //_signinBloc.login(email, password);
      },
      style: ElevatedButton.styleFrom(
        side: const BorderSide(
          width: 2,
          color: Color.fromARGB(255, 11, 11, 11),
        ),
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: const Color.fromARGB(255, 39, 228, 22),
        padding: const EdgeInsets.only(top: 10, bottom: 10),
      ),
      child: const Text('Sign In',
          style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold)),
    );
  }

  Widget _goToTutorial() {
    return ElevatedButton(
      onPressed: navigateToTutorial,
      child: const Text(' Go To Tutorial ',
          style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold)),
    );
  }

  Widget _goToHome() {
    return Row(
      children: [
        const Padding(padding: EdgeInsets.only(left: 50)),
        const Text("Create your account?"),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              'RegistrationScreen',
            );
          },
          child: const Text(
            'Sign Up',
            style: TextStyle(
              color: Color.fromARGB(255, 135, 13, 228),
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }
}
