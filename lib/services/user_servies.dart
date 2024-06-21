import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment/models/doctor_model.dart';
import 'package:doctor_appointment/models/user_appointment_model.dart';
import 'package:doctor_appointment/services/base_services.dart';

import '../models/user_model.dart';

class UserServies {
  // get  current user
  Future<Users> getUserdetails() async {
    DocumentSnapshot doc = await Base.firestore
        .collection('user')
        .doc(Base.auth.currentUser!.uid)
        .get();
    return Users.fromSnap(doc);
  }
  // -----------------------------------------------------------------

// get the doctor based on the category
  Future<List<DoctorModel>> getDoctorsbyCateogry(String category) async {
    if (category == "All") {
      QuerySnapshot querySnapshot =
          await Base.firestore.collection('doctors').get();
      return querySnapshot.docs.map((doc) {
        return DoctorModel.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
    }
    // if the categorty is  non the all will present
    QuerySnapshot querySnapshot = await Base.firestore
        .collection('doctors')
        .where('category', isEqualTo: category)
        .get();
    return querySnapshot.docs.map((doc) {
      return DoctorModel.fromMap(doc.data() as Map<String, dynamic>);
    }).toList();
  }
  // -----------------------------------------------------------------------

// get the doctor based on the category
  Future<List<DoctorModel>> getDoctorsbynames(String doctor) async {
    if (doctor == "All") {
      QuerySnapshot querySnapshot =
          await Base.firestore.collection('doctors').get();
      return querySnapshot.docs.map((doc) {
        return DoctorModel.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
    }
    // if the categorty is  non the all will present
    QuerySnapshot querySnapshot = await Base.firestore
        .collection('doctors')
        .where('name', isEqualTo: doctor)
        .get();
    return querySnapshot.docs.map((doc) {
      return DoctorModel.fromMap(doc.data() as Map<String, dynamic>);
    }).toList();
  }
  // -----------------------------------------------------------------------

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
        doctorId: doctor.id,
        userId: Base.auth.currentUser!.uid,
        doctorName: doctor.name,
        username: fullname,
        status: "pending",
        place: doctor.place,
        category: doctor.category,
        qualification: doctor.qualifications,
        time: time,
        message: message,
      );
      log(time);
      // Saving the appointment to Firestore to user
      await Base.firestore
          .collection('user')
          .doc(Base.auth.currentUser!.uid)
          .collection('Appointment')
          .doc(time)
          .set(appointment.toJson());

      // Saving the appointment to Firestore to doctor
      await Base.firestore
          .collection('doctors')
          .doc(doctor.id)
          .collection('Appointment')
          .doc(time)
          .set(appointment.toJson());

      response = "success";
    } catch (err) {
      log('Error: $err');
      response = err.toString();
    }
    return response;
  }
}
