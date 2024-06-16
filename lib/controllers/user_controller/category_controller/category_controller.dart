import 'dart:developer';

import 'package:doctor_appointment/controllers/user_controller/bottom_controller.dart';
import 'package:doctor_appointment/controllers/user_controller/home_controller/home_controller.dart';
import 'package:doctor_appointment/services/user_servies.dart';
import 'package:flutter/material.dart';

import '../../../models/doctor_model.dart';

class CategoryController extends ChangeNotifier {
    final TextEditingController searchCetegryController = TextEditingController();

  CategoryController() {
   getSearchedCategory('All');
  }
  // -----------------------------------------------------
  List<DoctorModel> categoryDoctors = [];
  bool is_serched = false;

  // to make the search is on or not
  searchCheking() {
    is_serched = !is_serched;
    notifyListeners();
  }

  
  getSearchedCategory(String searchData) async {
    log('pppppp');
    categoryDoctors = await UserServies().getDoctorsbyCateogry(searchData);
    categoryDoctors.isEmpty ? log('noset') : log('set');
    notifyListeners();
  }
  // ---------------------------------------------------------------

  // List<DoctorModel> categorisedDoctors = [];
  // BottomController bottomController = BottomController();
  // selectedCategory(
  //   String category,
  // ) {
  //   categorisedDoctors.addAll(bottomController.doctorDetails
  //       .where((doctor) => doctor.category == category));
  //   categorisedDoctors;
  //   notifyListeners();
  // }

  // cla
  // Future<void> clearCategory() async {
  //   await Future.delayed(Duration(microseconds: 1500));
  //   categorisedDoctors = [];
  //   notifyListeners();
  // }
}
