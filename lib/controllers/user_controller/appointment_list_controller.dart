import 'package:doctor_appointment/models/doctor_model.dart';
import 'package:doctor_appointment/services/api_services.dart';
import 'package:doctor_appointment/services/user_servies.dart';
import 'package:flutter/material.dart';

import '../../models/user_appointment_model.dart';

class AppointmentListController extends ChangeNotifier {
  List<AppointmentModel> appointmentDetails = [];
 Future <List<AppointmentModel>> getAppoitmentdetails(String status) async {
    appointmentDetails =
        await ApiServices().getAllAppointmentsStatus(status);
    return appointmentDetails;
   
  }
}
