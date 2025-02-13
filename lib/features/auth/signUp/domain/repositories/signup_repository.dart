import 'package:flutter/material.dart';

abstract class SignupRepository {
  Future<void> signup(BuildContext context,String email, String password);
}
