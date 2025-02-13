import '../repositories/forget_password_repository.dart';

class ForgetPasswordUseCase {
  final ForgetPasswordRepository repository;

  ForgetPasswordUseCase(this.repository);

  Future<void> call(String email) {
    return repository.resetPassword(email);
  }
}
