import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_learn/src/bloc/bloc.dart';
import 'package:flutter_learn/src/modules/http/view_model/api_bloc_model.dart';
import 'package:http/http.dart' as http;

import '../../signin/view_model/signin_model.dart';

class ApiBlocController extends Bloc<ApiModel> {
  @override
  ApiModel initDefaultValue() {
    return ApiModel(appState: AppState.inital);
  }

  Future<void> updateState() async {
    state.appState = AppState.loding;
    emit(state);
    var data = await http.get(
        Uri.parse('https://list.ly/api/v4/meta?url=http://google.com'),
        headers: {
          'content-type': 'application/json',
        });
    if (data.statusCode == 200) {
      state.appState = AppState.success;
      state.responseModel = ResponseModel(
        statusCode: data.statusCode.toString(),
        statusMessage: data.toString(),
        data: jsonDecode(data.body),
      );
    } else {
      state.appState = AppState.faliure;
    }
    if (kDebugMode) {
      print("This is api calll!! $data");
    }
    emit(state);
  }
}
