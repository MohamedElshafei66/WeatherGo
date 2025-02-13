import 'package:flutter/material.dart';
import '../../domain/usecases/forget_password_usecase.dart';

class ForgetPasswordProvider extends ChangeNotifier {
  final ForgetPasswordUseCase forgetPasswordUseCase;

  ForgetPasswordProvider(this.forgetPasswordUseCase);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> resetPassword(BuildContext context, String email) async {
    _setLoading(true);
    try {
      await forgetPasswordUseCase(email);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Password reset email sent!")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    } finally {
      _setLoading(false);
    }
  }
}
