import 'package:doctor_appointment/models/user_appointment_model.dart';
import 'package:doctor_appointment/services/api_services.dart';
import 'package:doctor_appointment/models/doctor_model.dart';
import 'package:doctor_appointment/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'dart:developer';

class BottomController extends ChangeNotifier {
  BottomController() {
    getuserdetails();
    getdoctordetila();
    getAppoitmentdetails();
    appointmentDetails;
    userDetails;
    doctorDetails;
    notifyListeners;
  }
  Users? userDetails;
  List<DoctorModel> doctorDetails = [];
  List<AppointmentModel> appointmentDetails = [];

  Future<String?> getuserdetails() async {
    userDetails = await ApiServices().getUserdetails();
    log(userDetails!.username);
    notifyListeners();
  }

  Future<String?> getdoctordetila() async {
    doctorDetails = await ApiServices().getAllDoctors();
    log(doctorDetails[0].name);
    notifyListeners();
  }

  Future<String?> getAppoitmentdetails() async {
    appointmentDetails = await ApiServices().getAllAppointment();
    log(doctorDetails[0].name);
    notifyListeners();
  }

  int currentIndex = 0;

  void changeIndex(index) {
    currentIndex = index;
    notifyListeners();
  }
}
