import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_go/core/utils/app_route.dart';
import '../../../../../core/manger/user_provider.dart';
import '../../domain/usecases/signup_usecase.dart';

class SignupProvider extends ChangeNotifier {
  final SignupUseCase signupUseCase;

  SignupProvider(this.signupUseCase);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> signup(BuildContext context,String username,String email, String password) async {
    _setLoading(true);
    try {
      await signupUseCase(context,username,email, password);
      Provider.of<UserProvider>(context, listen: false).setUsername(username);
      Navigator.pushReplacementNamed(context,AppRoute.logIn);
    } catch (e) {
      print(e);
    } finally {
      _setLoading(false);
    }
  }
}
