import 'package:flutter/material.dart';

abstract class SignupRepository {
  Future<void> signup(BuildContext context,String username,String email, String password);
}
