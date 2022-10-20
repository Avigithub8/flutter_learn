import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_learn/src/bloc/bloc.dart';
import 'package:flutter_learn/src/modules/signup/view_model/signup_modal.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../signin/view_model/signin_model.dart';

class SignupBloc extends Bloc<SignupModel> {
  @override
  SignupModel initDefaultValue() {
    return SignupModel(appState: AppState.inital);
  }

  Future<void> goggleLogin() async {
    state.appState = AppState.loding;
    emit(state);
    try {
      final GoogleSignInAccount? goggleUser = await GoogleSignIn().signIn();
      if (goggleUser == null) {
        state.appState = AppState.faliure;
        state.responseModel = ResponseModel(
          statusCode: "500",
          statusMessage: "user has canceled",
        );
      } else {
        state.appState = AppState.success;
        state.responseModel = ResponseModel(
          statusCode: "200",
          statusMessage: "sucess",
          data: {
            "profile": goggleUser.photoUrl,
            "id": goggleUser.id,
            "name": goggleUser.displayName,
            "email": goggleUser.email,
          },
        );
      }
    } catch (e) {
      state.appState = AppState.faliure;
      state.responseModel = ResponseModel(
        statusCode: "500",
        statusMessage: e.toString(),
      );
    }

    emit(state);
  }

  FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> signUp(
      {required String name,
      required String email,
      required String password}) async {
    state.appState = AppState.loding;
    final FirebaseAuth auth = FirebaseAuth.instance;
    emit(state);
    try {
      UserCredential newUser = await auth.createUserWithEmailAndPassword(
          email: email.toString(), password: password.toString());
      // ignore: deprecated_member_use
      await auth.currentUser?.updateProfile(displayName: name);
      // ignore: unnecessary_null_comparison
      if (newUser == null) {
        state.appState = AppState.faliure;
        state.responseModel = ResponseModel(
          statusCode: "500",
          statusMessage: "user has canceled",
        );
      } else {
        state.appState = AppState.success;
        state.responseModel = ResponseModel(
          statusCode: "200",
          statusMessage: "sucess",
          data: {
            "name": newUser.user,
            "email": newUser.credential,
            "password": newUser.credential,
          },
        );
      }
    } catch (e) {
      state.appState = AppState.faliure;
      state.responseModel = ResponseModel(
        statusCode: "500",
        statusMessage: e.toString(),
      );
    }
    emit(state);
  }

  Future<void> login(String email, String password) async {
    state.appState = AppState.loding;
    emit(state);
    try {
      final UserCredential user = await auth.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      state.appState = AppState.success;
      state.responseModel = ResponseModel(
        statusCode: "200",
        statusMessage: "sucess",
        data: {
          "email": user.credential,
          "password": user.credential,
        },
      );
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
