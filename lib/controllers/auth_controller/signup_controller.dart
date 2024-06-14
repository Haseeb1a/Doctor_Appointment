import 'dart:developer';

import 'package:doctor_appointment/services/authservices.dart';
import 'package:flutter/material.dart';

class SignupController extends ChangeNotifier {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
    final TextEditingController confrimpasswordController = TextEditingController();

   String groupValue = 'user';
  choosingRegistorCatogory(value) {
    groupValue = value;
    notifyListeners();
  }

  Future<String?> userSingUp() async {
    log(nameController.text);
    log(emailController.text);
    log(passwordController.text);
    String? result = await AuthServices().singUpuser(
        username: nameController.text,
        email: emailController.text,
        password: passwordController.text);
    log(result);
    print('ddddddddddddddddd $result');
    if (result != null) {
      return result;
    }
    emailController.clear();
    passwordController.clear();
    nameController.clear();
  }

  // singUpuser
}
