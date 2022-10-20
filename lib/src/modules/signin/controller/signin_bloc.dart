import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter/src/widgets/editable_text.dart';

import 'package:flutter_learn/src/bloc/bloc.dart';
import 'package:flutter_learn/src/modules/signin/view_model/signin_model.dart';
//import 'package:flutter_learn/src/modules/signup/view_model/signup_modal.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SigninBloc extends Bloc<SigninModel> {
  @override
  SigninModel initDefaultValue() {
    return SigninModel(appState: AppState.inital);
  }

  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> login(String email, String password) async {
    state.appState = AppState.loding;
    emit(state);
    try {
      final UserCredential user = await auth.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());

      // if (_formKey.currentState!.validate()) {
      //   _formKey.currentState!.save();
      //   UserCredential user = await auth.signInWithEmailAndPassword(
      //       email: email.trim(), password: password.trim());
      //   auth.authStateChanges().listen((user) {
      // if (user != null) {
      state.appState = AppState.success;
      state.responseModel = ResponseModel(
        statusCode: "200",
        statusMessage: "sucess",
        data: {
          "email": user.credential,
          "password": user.credential,
        },
      );
      // }
      // });
      // }
    } catch (e) {
      state.appState = AppState.faliure;
      state.responseModel = ResponseModel(
        statusCode: "500",
        statusMessage: e.toString(),
      );
    }
    emit(state);
  }

  Future<void> signOut() async {
    auth.signOut();

    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
  }
}
