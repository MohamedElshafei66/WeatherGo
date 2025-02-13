import 'package:flutter/material.dart';
import '../../../../../core/component/awesom_dialog.dart';
import '../../../../../core/utils/app_string.dart';
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
      await forgetPasswordUseCase(context,email);
      showAwesomeDialog(
          // ignore: use_build_context_synchronously
          context,
          title:AppStrings.noteText,
          des:AppStrings.checkYourBoxMessage
      );
    } catch (e) {
      showAwesomeDialog(
          // ignore: use_build_context_synchronously
          context,
          title:AppStrings.errorText,
          des:AppStrings.errorText
      );
    } finally {
      _setLoading(false);
    }
  }
}