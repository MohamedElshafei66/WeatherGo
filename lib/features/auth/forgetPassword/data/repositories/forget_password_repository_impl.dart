import 'package:firebase_auth/firebase_auth.dart';
import '../../domain/repositories/forget_password_repository.dart';

class ForgetPasswordRepositoryImpl implements ForgetPasswordRepository {
  final FirebaseAuth _firebaseAuth;

  ForgetPasswordRepositoryImpl(this._firebaseAuth);

  @override
  Future<void> resetPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
