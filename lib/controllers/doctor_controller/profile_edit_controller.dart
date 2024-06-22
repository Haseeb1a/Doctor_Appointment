import 'dart:developer';

import 'package:doctor_appointment/controllers/doctor_controller/doctor_bottom_controller.dart';
import 'package:doctor_appointment/controllers/user_controller/category_controller/category_controller.dart';
import 'package:doctor_appointment/models/doctor_model.dart';
import 'package:doctor_appointment/services/authservices.dart';
import 'package:doctor_appointment/services/base_services.dart';
import 'package:flutter/material.dart';

import '../../services/doctor_services.dart';

class DoctorProfileEditontroller extends ChangeNotifier {
  DoctorBottomController bottomController = DoctorBottomController();
  TextEditingController nameController = TextEditingController();
  TextEditingController catagryController = TextEditingController();
  TextEditingController placeController = TextEditingController();
  TextEditingController aboutController = TextEditingController();
  TextEditingController worktimeController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController qualificationController = TextEditingController();
  bool isActive = false;

  switchActive(value) {
    isActive = value;
    notifyListeners();
  }


  Future<bool> checkDoctorActiveStatus() async {
    bool isActive = await DoctorServices().isActiveChecker();
    return isActive;
  }



// ----------------------------------------------------------------------------------------
 Stream<bool> getActiveStatusStream() {
    return DoctorServices().isActiveStream();
  }

  Future<void> updateActiveStatus( bool isActive) {
    return DoctorServices().updateActiveStatus( isActive);
  }
  // -----------------------------------------------------------------------------------

  // DoctorProfileEditontroller() {
  //   // intalseting();
  // }

  // intalseting() {
  //   // log(bottomController.currentDoctror!.name);
  //   // nameController.text = bottomController.currentDoctror!.name;
  //   // catagryController.text = bottomController.currentDoctror!.category;
  //   // placeController.text = bottomController.currentDoctror!.place;
  //   // aboutController.text = bottomController.currentDoctror!.about;
  //   // worktimeController.text = bottomController.currentDoctror!.workingTime;
  //   // phoneController.text = bottomController.currentDoctror!.phone;
  //   // qualificationController.text =
  //   //     bottomController.currentDoctror!.qualifications;
  //   // notifyListeners();
  // }
  void editprofile() {
    DoctorModel updatedoctor = DoctorModel(
        about: aboutController.text,
        category: catagryController.text,
        id: Base.auth.currentUser!.uid,
        name: nameController.text,
        place: placeController.text,
        qualifications: qualificationController.text,
        workingTime: worktimeController.text,
        phone: phoneController.text,
        isDoctor: true,
        gender: bottomController.currentDoctror!.gender);
    DoctorServices().updateTheDoctorProfile(updatedoctor);
    bottomController.getcurrentdoctor();
  }
}
