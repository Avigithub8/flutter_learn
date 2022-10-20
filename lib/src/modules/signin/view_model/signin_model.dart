class SigninModel {
  AppState appState;
  ResponseModel? responseModel;
  SigninModel({
    required this.appState,
    this.responseModel,
  });
}

class ResponseModel<T> {
  String statusCode;
  String statusMessage;
  T? data;
  ResponseModel({
    required this.statusCode,
    required this.statusMessage,
    this.data,
  });
}

enum AppState {
  inital,
  loding,
  success,
  faliure,
  noInternet,
}
