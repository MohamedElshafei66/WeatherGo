import '../repositories/signup_repository.dart';

class SignupUseCase {
  final SignupRepository repository;

  SignupUseCase(this.repository);

  Future<void> call(String email, String password) {
    return repository.signup(email, password);
  }
}
