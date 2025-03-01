import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../../../core/component/awesom_dialog.dart';
import '../../../../../core/helper/shared_pref.dart';
import '../../../../../core/utils/app_string.dart';
import '../../domain/repositories/signup_repository.dart';

class SignupRepositoryImpl implements SignupRepository {
  final FirebaseAuth _firebaseAuth;

  SignupRepositoryImpl(this._firebaseAuth);

  @override
  Future<void> signup(BuildContext context, String username,String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      //  to save username when user signup
      await SharedPrefsHelper.saveUsername(username);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        showAwesomeDialog(
          context,
          title: AppStrings.noteText,
          des: AppStrings.accountExistMessage,

        );
      }
      throw Exception(e.message);
    }
  }
}
