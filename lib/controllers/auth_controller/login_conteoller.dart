import 'dart:developer';

import 'package:doctor_appointment/services/authservices.dart';
import 'package:flutter/material.dart';

class LoginConteoller extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController forgetPasswordController =
      TextEditingController();

  Future<String?> loginSerivces() async {
    String? result = await AuthServices().loginUser(
        email: emailController.text, password: passwordController.text);
    print('ddddddddddddddddd $result');
    log(result);
    print('ddddddddddddddddd $result');
     emailController.clear();
    passwordController.clear();
    return result;
   
  }

  //forgot password
  // void forgetPasswords() {
  //   Map<String, dynamic> forgetData = {"email": forgetPasswordController.text};
  //   AuthServices().forgetPasswordController(forgetData);
  // }
}
