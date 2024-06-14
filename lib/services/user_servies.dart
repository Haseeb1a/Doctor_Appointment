import 'dart:developer';

import 'package:doctor_appointment/models/doctor_model.dart';
import 'package:doctor_appointment/models/user_appointment_model.dart';
import 'package:doctor_appointment/services/base_services.dart';

class UserServies {
  //user set Apppintments
Future<String> setAppointments({
  required String time,
  required String fullname,
  required String phone,
  required String message,
  required DoctorModel doctor,
}) async {
  String response = 'Some error occurred';
  try {
    log('Message: $message, Phone: $phone, Time: $time, Full Name: $fullname, Doctor: ${doctor.name}');
    
    // Creating AppointmentModel instance
    AppointmentModel appointment = AppointmentModel(
      doctorName: doctor.name,
      username: fullname,
      status: "pending",
      place: doctor.place,
      category: doctor.category,
      qualification: doctor.qualifications,
      time: time,
      message: message,
    );

    // Saving the appointment to Firestore
    await Base.firestore
    .collection('user') 
    .doc(Base.auth.currentUser!.uid)
    .collection('Appointment') 
    .doc(Base.auth.currentUser!.uid) 
    .set(appointment.toJson());
    response = "success";
  } catch (err) {
       log('Error: $err');
    response = err.toString();
  }
  return response;
}




}
