import 'package:flutter/material.dart';
import '../repositories/signup_repository.dart';

class SignupUseCase {
  final SignupRepository repository;

  SignupUseCase(this.repository);

  Future<void> call(BuildContext context,String username,String email, String password) {
    return repository.signup(context,username,email, password);
  }
}
