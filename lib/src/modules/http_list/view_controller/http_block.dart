import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_learn/src/bloc/bloc.dart';
import 'package:flutter_learn/src/modules/http_list/view_model/http_model.dart';
import 'package:flutter_learn/src/modules/signin/view_model/signin_model.dart';
import 'package:http/http.dart' as http;

class ApiBloc extends Bloc<ModelList> {
  @override
  ModelList initDefaultValue() {
    return ModelList(appState: AppState.inital, modelList: []);
  }

  Future<void> getAPICall() async {
    state.appState = AppState.loding;
    emit(state);
    var response = await http.get(
      Uri.parse("https://date.nager.at/api/v2/publicholidays/2020/US"),
      headers: {'content-type': 'application/json'},
    );
    if (response.statusCode == 200) {
      state.appState = AppState.success;
      List tempData = jsonDecode(response.body);
      debugPrint(tempData.toString());
      for (Map temp in tempData) {
        state.modelList.add(ModelClass.fromJson(temp));
      }
      debugPrint(state.modelList.length.toString());
    } else {
      debugPrint("Try Again");
      state.appState = AppState.faliure;
    }
    emit(state);
  }
}
