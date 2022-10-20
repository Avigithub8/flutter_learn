import 'package:flutter_learn/src/modules/preference/preference_helper.dart';
// import 'package:flutter_learn/src/modules/tutorial/view/tutorial_screen.dart';

class Preference {
  static setIsTutorialScreen(value) {
    PreferencesHelper.pref
        .setBool(key: PreferenceConst.isTutorialView, value: value);
  }

  static bool? get isTutorialView =>
      PreferencesHelper.pref.getBool(PreferenceConst.isTutorialView);
}

class PreferenceConst {
  static const isTutorialView = 'is_tutorial_view';
}
