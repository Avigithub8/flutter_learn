import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:flutter_learn/src/modules/signin/view/login.dart';
import 'package:flutter_learn/src/bloc/bloc_builder.dart';
import 'package:flutter_learn/src/constant/app_constant.dart';
import 'package:flutter_learn/src/constant/app_style.dart';
//import 'package:flutter_learn/src/modules/profile/profile_screen.dart';
import 'package:flutter_learn/src/modules/signup/controller/signup_bloc.dart';
// import 'package:flutter_learn/src/modules/signup/view_model/signup_modal.dart';
import 'package:flutter_learn/src/routes/app_routes.dart';
import 'package:flutter_learn/src/utils/custon_widget/snack_bar.dart';
import 'package:flutter_learn/src/utils/helper/validation.dart';

import '../../signin/view_model/signin_model.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool passwordVisible = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isSignIn = false;
  bool google = false;

  final SignupBloc _signupBloc = SignupBloc();

  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  void initState() {
    username.text = "";
    email.text = "";
    password.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      padding: const EdgeInsets.only(
        top: 100,
        left: 30,
        right: 30,
        bottom: 10,
      ),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            _userNameForm(),
            const SizedBox(height: 20),
            _emailForm(),
            const SizedBox(height: 20),
            _passwordForm(),
            Container(height: 40),
            _signupButton(),
            const SizedBox(height: 40),
            _alreadyAccount(),
            const SizedBox(height: 40),
            _buildBuilder()
          ],
        ),
      ),
    ));
  }

  Widget _userNameForm() {
    return TextFormField(
        controller: username,
        cursorColor: Colors.redAccent,
        keyboardType: TextInputType.text,
        autofocus: true,
        textInputAction: TextInputAction.next,
        validator: (value) {
          return Validators.validateName(value);
        },
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
        controller: email,
        cursorColor: Colors.redAccent,
        keyboardType: TextInputType.emailAddress,
        autofocus: true,
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
          enabledBorder: myinputborder(),
          focusedBorder: myfocusborder(),
          constraints: const BoxConstraints(maxWidth: 350),
        ));
  }

  Widget _passwordForm() {
    return TextFormField(
      controller: password,
      obscureText: true,
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
      onPressed: () async {
        await _signupBloc.signUp(
            name: username.text, email: email.text, password: password.text);
        if (_signupBloc.state.appState == AppState.success) {
          // ignore: use_build_context_synchronously
          // Navigator.pushNamed(context, 'ProfileScreen',
          //     arguments: _signupBloc.state.responseModel?.data);
          // ignore: use_build_context_synchronously
          Navigator.pushNamed(context, AppRoute.screenThird,
              arguments: _signupBloc.state.responseModel?.data);
        } else {
          AppSnackBar.showSnackBar(
            context: context,
            message: _signupBloc.state.responseModel?.statusMessage ?? "",
          );
        }
      },
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
              const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10) //
          ),
      child: const Text('Sign Up',
          style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold)),
    );
  }

  Widget _alreadyAccount() {
    return Row(
      children: [
        const Padding(padding: EdgeInsets.only(left: 100)),
        const Text("Already have an account?"),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, AppRoute.screenFirst);
          },
          child: const Text(
            'login',
            style: TextStyle(
              color: Color.fromARGB(255, 135, 13, 228),
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }

  Widget _googleButton() {
    return ElevatedButton(
      onPressed: () async {
        await _signupBloc.goggleLogin(); //error
        if (_signupBloc.state.appState == AppState.success) {
          // ignore: use_build_context_synchronously
          Navigator.pushNamed(context, AppRoute.screenThird,
              arguments: _signupBloc.state.responseModel?.data);
        } else {
          AppSnackBar.showSnackBar(
            context: context,
            message: _signupBloc.state.responseModel?.statusMessage ?? "",
          );
        }
      },
      style: ElevatedButton.styleFrom(
          side: const BorderSide(
            width: 2,
            color: Color.fromRGBO(11, 11, 11, 1),
          ),
          elevation: 3,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: const Color.fromARGB(255, 128, 17, 232),
          padding:
              const EdgeInsets.only(left: 30, right: 30, top: 12, bottom: 12) //
          ),
      child: _signupBloc.state.appState == AppState.loding
          ? const CircularProgressIndicator()
          : const Text(
              AppConst.login,
              style: AppStyle.buttonsignup,
            ),
    );
  }

  Widget _buildBuilder() {
    return BlocBuilder(
      builder: () {
        return _googleButton();
      },
      bloc: _signupBloc,
    );
  }
}
