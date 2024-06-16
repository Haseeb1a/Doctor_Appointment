import 'package:doctor_appointment/models/user_appointment_model.dart';
import 'package:doctor_appointment/services/api_services.dart';
import 'package:doctor_appointment/models/doctor_model.dart';
import 'package:doctor_appointment/models/user_model.dart';
import 'package:doctor_appointment/services/doctor_services.dart';
import 'package:doctor_appointment/services/user_servies.dart';
import 'package:flutter/cupertino.dart';
import 'dart:developer';

class DoctorBottomController extends ChangeNotifier {
  DoctorBottomController() {
    getcurrentdoctor();
    // getuserdetails();
    // getdoctordetila();
    // // getAppoitmentdetails();
    // // appointmentDetails;
    // userDetails;
    // doctorDetails;
    // notifyListeners;
  }
  // Users? userDetails;
  DoctorModel? currentDoctror;
  // // List<AppointmentModel> appointmentDetails = [];

  Future<String?> getcurrentdoctor() async {
    currentDoctror = await DoctorServices().currentDoctor();
    log(currentDoctror!.name);
    notifyListeners();
  }

  // Future<String?> getdoctordetila() async {
  //   doctorDetails = await DoctorServices().getAllDoctors();
  //   log(doctorDetails[0].name);
  //   notifyListeners();
  // }

  // Future<String?> getAppoitmentdetails(String status) async {
  //   appointmentDetails = await ApiServices().getAllAppointmentsByCategory(status);
  //   log(doctorDetails[0].name);
  //   notifyListeners();
  // }

  int currentIndex = 0;

  void changeIndex(index) {
    currentIndex = index;
    notifyListeners();
  }
}
