import 'package:doctor_appointment/models/doctor_model.dart';
import 'package:doctor_appointment/services/user_servies.dart';
import 'package:flutter/material.dart';

class AppointmentController extends ChangeNotifier {
  final TextEditingController appointmentMobileController =
      TextEditingController();
  final TextEditingController appointmentNameController =
      TextEditingController();
  final TextEditingController appointmentMessageController =
      TextEditingController();

  final jobtitleController = TextEditingController();
  final addressController = TextEditingController();

  DateTime date = DateTime.now();

  void dateChecker(DateTime newData) {
    date = newData;
    notifyListeners();
  }

  Future<void> checker(DoctorModel doctor) async {
    print(date.toString());
    print(appointmentMessageController.text);
    print(appointmentNameController.text);
    print(appointmentMobileController.text);
    UserServies().setAppointments(
        time: date.toString(),
        fullname: appointmentNameController.text,
        phone: appointmentMobileController.text,
        message: appointmentMessageController.text,
        doctor: doctor);
    // Map booking = {
    //   "booking_date": date.toString(),
    //   "address": addressController.text,
    //   "job": jobtitleController.text
    // };
    // print(booking);
    // await UserServices().bookingToProfessinals(booking, id);
  }
}
