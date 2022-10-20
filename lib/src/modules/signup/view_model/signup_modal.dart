import '../../signin/view_model/signin_model.dart';

class SignupModel {
  AppState appState;
  ResponseModel? responseModel;
  SignupModel({
    required this.appState,
    this.responseModel,
  });
}
