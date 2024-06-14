import 'dart:developer';

import 'package:doctor_appointment/constants/colors.dart';
import 'package:doctor_appointment/models/doctor_model.dart';
import 'package:doctor_appointment/services/api_services.dart';
import 'package:doctor_appointment/services/authservices.dart';
import 'package:flutter/material.dart';

class DoctorSingupcontroller extends ChangeNotifier {
  final TextEditingController qualifciatonController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController placeController = TextEditingController();
  final TextEditingController workingTimeController = TextEditingController();
  final TextEditingController aboutController = TextEditingController();

  Future<String?> doctorSingUp(
      String password, String email, String name) async {
    print("About: ${aboutController.text}");
    print("Category: ${categoryController.text}");
    print("ID: ''");
    print("Name: $name");
    print("Place: ${placeController.text}");
    print("Qualifications: ${qualifciatonController.text}");
    print("Working Time: ${workingTimeController.text}");
    print("Phone: ${phoneController.text}");
    DoctorModel doctor = DoctorModel(
        about: aboutController.text,
        category: categoryController.text,
        id: '',
        name: name,
        place: placeController.text,
        qualifications: qualifciatonController.text,
        workingTime: workingTimeController.text,
        phone: phoneController.text);
    AuthServices().singUpDoctor(
        email: email, password: password, username: name, doctordetals: doctor);
    // log(nameController.text);
    // log(emailController.text);
    // log(passwordController.text;
    // String? result = await AuthServices().singUpuser(
    //     username: nameController.text,
    //     email: emailController.text,
    //     password: passwordController.text);
    // log(result);
    // print('ddddddddddddddddd $result');
    // if (result != null) {
    //   return result;
    // }
    // emailController.clear();
    // passwordController.clear();
    // nameController.clear();
  }

  // singUpuser
}
