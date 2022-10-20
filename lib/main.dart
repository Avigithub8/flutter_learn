import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/src/modules/preference/preference_helper.dart';
import 'app.dart';

//void main() {
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await PreferencesHelper().init();
  runApp(const MyApp());
}
