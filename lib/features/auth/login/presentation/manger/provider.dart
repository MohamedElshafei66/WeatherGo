import 'package:flutter/material.dart';
import 'package:weather_go/core/utils/app_route.dart';
import '../../domain/usecases/login_usecase.dart';

class LoginProvider extends ChangeNotifier {
  final LoginUseCase loginUseCase;

  LoginProvider(this.loginUseCase);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> login(BuildContext context, String email, String password) async {
    _setLoading(true);
    try {
      await loginUseCase(email, password);
      Navigator.pushNamed(context,AppRoute.home);
    } catch (e) {
      print(e);
    } finally {
      _setLoading(false);
    }
  }
}
