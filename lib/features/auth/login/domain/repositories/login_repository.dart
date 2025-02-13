import 'package:flutter/material.dart';

abstract class LoginRepository {
  Future<void> login(BuildContext context,String email, String password);
}