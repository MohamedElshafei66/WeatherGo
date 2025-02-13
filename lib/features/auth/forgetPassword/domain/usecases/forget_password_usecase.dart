import 'package:flutter/material.dart';
import '../repositories/forget_password_repository.dart';

class ForgetPasswordUseCase {
  final ForgetPasswordRepository repository;

  ForgetPasswordUseCase(this.repository);

  Future<void> call(BuildContext context,String email) {
    return repository.resetPassword(context,email);
  }
}
