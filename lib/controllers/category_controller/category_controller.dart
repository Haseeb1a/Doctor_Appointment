import 'package:doctor_appointment/controllers/bottom_controller.dart';
import 'package:flutter/material.dart';

import '../../models/doctor_model.dart';

class CategoryController extends ChangeNotifier {
  List<DoctorModel> categorisedDoctors = [];
  BottomController bottomController = BottomController();
  selectedCategory(
    String category,
  ) {
    categorisedDoctors.addAll(bottomController.doctorDetails
        .where((doctor) => doctor.category == category));
    categorisedDoctors;
    notifyListeners();
  }

Future <void> clearCategory() async {
  await Future.delayed(Duration(microseconds:1500));
  categorisedDoctors = [];
  notifyListeners();
}
}
