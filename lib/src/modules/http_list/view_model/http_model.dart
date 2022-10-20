import 'package:flutter_learn/src/modules/signin/view_model/signin_model.dart';

class ModelList {
  AppState appState;
  List<ModelClass> modelList;
  ModelList({required this.appState, required this.modelList});
}

class ModelClass {
  String date;
  String localName;
  String name;
  String countryCode;

  ModelClass(
      {required this.date,
      required this.localName,
      required this.name,
      required this.countryCode});

  factory ModelClass.fromJson(Map json) {
    return ModelClass(
        date: json["date"],
        localName: json["localName"],
        name: json["name"],
        countryCode: json["countryCode"]);
  }
}
