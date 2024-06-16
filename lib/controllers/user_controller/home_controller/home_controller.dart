import 'dart:developer';

import 'package:doctor_appointment/controllers/user_controller/category_controller/category_controller.dart';
import 'package:doctor_appointment/models/doctor_model.dart';
import 'package:doctor_appointment/services/api_services.dart';
import 'package:doctor_appointment/services/user_servies.dart';
import 'package:flutter/material.dart';

import '../../../models/user_appointment_model.dart';

class HomeConteoller extends ChangeNotifier {
  CategoryController categoryController = CategoryController();
  HomeConteoller() {
    categoryController.getSearchedCategory('All');
  }
  final TextEditingController doctorController = TextEditingController();
  List<DoctorModel> nameddoctors = [];
  bool is_Doctor = false;

  doctorCheking() {
    is_Doctor = !is_Doctor;
    nameddoctors = [];
    log('hello');
    notifyListeners();
  }

  getSearchedDoctors(String searchDoctor) async {
    log('pppppp');
    nameddoctors = await UserServies().getDoctorsbynames(searchDoctor);
    nameddoctors.isEmpty ? log('noset') : log('set');

    notifyListeners();
  }

  // ------------------------------------------------------------------------------------------------
  
}
