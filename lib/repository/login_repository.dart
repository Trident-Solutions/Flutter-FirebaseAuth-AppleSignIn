import 'package:flutter_apple_signin/services/auth_service.dart';

class LoginRepository {
  AuthService authService = AuthService();

  Future<String> signInUser() async {
    final user = await authService.signInWithApple();
    return user.uid;
  }
}
