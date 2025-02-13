import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:weather_go/core/component/awesom_dialog.dart';
import 'package:weather_go/core/utils/app_string.dart';
import '../../domain/repositories/login_repository.dart';


class LoginRepositoryImpl implements LoginRepository {
  final FirebaseAuth _firebaseAuth;

  LoginRepositoryImpl(this._firebaseAuth);

  @override
  Future<void> login(BuildContext context,String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showAwesomeDialog(
            // ignore: use_build_context_synchronously
            context,
            title:AppStrings.errorText,
            des:AppStrings.userNotFountMessage
        );
      }
      else if (e.code == 'wrong-password') {
        showAwesomeDialog(
            // ignore: use_build_context_synchronously
            context,
            title:AppStrings.errorText,
            des:AppStrings.wrongPasswordMessage
        );
      }
      throw Exception(e.message);
    }
  }
}
