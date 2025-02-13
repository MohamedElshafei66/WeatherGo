import 'package:flutter/material.dart';

abstract class ForgetPasswordRepository {
  Future<void> resetPassword(BuildContext context,String email);
}
