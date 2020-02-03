import 'dart:async';

import 'package:flutter_apple_signin/bloc/login_state.dart';
import 'package:flutter_apple_signin/repository/login_repository.dart';
import 'package:flutter_apple_signin/utils/constants.dart';

class LoginBloc implements BaseBloc {
  LoginRepository loginRepository;
  StreamController _loginController;

  StreamSink<ApiResponse<String>> get signInSink => _loginController.sink;
  Stream<ApiResponse<String>> get signInStream => _loginController.stream;

  LoginBloc() {
    _loginController = StreamController<ApiResponse<String>>();
    loginRepository = LoginRepository();
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

  submit() async {
    signInSink.add(ApiResponse.loading(Constants.sigin_user));
    try {
      String signIn = await loginRepository.signInUser();
      signInSink.add(ApiResponse.completed(signIn));
    } catch (e) {
      signInSink.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }
}

abstract class BaseBloc {
  void dispose();
}
