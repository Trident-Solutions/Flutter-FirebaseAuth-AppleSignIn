import 'package:apple_sign_in/apple_sign_in_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apple_signin/bloc/login_bloc.dart';
import 'package:flutter_apple_signin/utils/constants.dart';
import 'package:flutter_apple_signin/widgets/login_submit_btn.dart';
import 'package:provider/provider.dart';

import '../repository/apple_sign_in_available.dart';

class LoginPage extends StatelessWidget {
  LoginBloc _loginBloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    final appleSignInAvailable =
        Provider.of<AppleSignInAvailable>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(Constants.log_in),
      ),
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            appleSignInAvailable.isAvailable == true
                ? AppleSignInButton(
                    style: ButtonStyle.black,
                    type: ButtonType.signIn,
                    onPressed: () => _signInWithAppleTapped(),
                  )
                : Container(),
            LoginSubmitBtn(loginBloc: _loginBloc)
          ],
        ),
      ),
    );
  }

  _signInWithAppleTapped() {
    _loginBloc.submit();
  }
}
