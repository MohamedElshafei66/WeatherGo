import 'package:firebase_auth/firebase_auth.dart';
import '../../domain/repositories/login_repository.dart';


class LoginRepositoryImpl implements LoginRepository {
  final FirebaseAuth _firebaseAuth;

  LoginRepositoryImpl(this._firebaseAuth);

  @override
  Future<void> login(String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }
}
