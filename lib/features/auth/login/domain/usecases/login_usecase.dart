import 'package:flutter/material.dart';
import '../repositories/login_repository.dart';

class LoginUseCase {
  final LoginRepository repository;

  LoginUseCase(this.repository);

  Future<void> call(BuildContext context,String email, String password) {
    return repository.login(context,email, password);
  }
}
