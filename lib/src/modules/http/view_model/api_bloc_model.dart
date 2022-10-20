import '../../signin/view_model/signin_model.dart';

class ApiModel {
  AppState appState;
  ResponseModel? responseModel;
  ApiModel({
    required this.appState,
    this.responseModel,
  });
}
