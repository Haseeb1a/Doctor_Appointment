import 'dart:developer';

import 'package:doctor_appointment/services/doctor_services.dart';
import 'package:flutter/material.dart';

import '../../models/user_appointment_model.dart';

class DoctorAppontmentList extends ChangeNotifier {
  int touchedIndex = 0;

  chartpopup(totchedsection) {
    touchedIndex = totchedsection;
    notifyListeners();
  }

  List<AppointmentModel> appointmentDetails = [];
  Future<List<AppointmentModel>> getAppoitmentdetails(String status) async {
    appointmentDetails =
        await DoctorServices().getAllAppointmentsStatus(status);
    if (appointmentDetails.isEmpty) {
      log('empty');
    }
    appointmentDetails;
    // log(appointmentDetails.first.time);
    // notifyListeners();
    return appointmentDetails;
  }

  void appointmentConfirmed(
    String time,
    userId,
    doctorId,
    String status,
  ) async {
    log(status);
    log('timesssssssssss${time}');
    DoctorServices().appointmentconfirmation(
      time,
      userId,
      doctorId,
    );
    getAppoitmentdetails(status);
    // notifyListeners();
  }
}
