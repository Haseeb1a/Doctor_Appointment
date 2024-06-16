import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment/models/doctor_model.dart';
import 'package:doctor_appointment/models/user_model.dart';
import 'package:doctor_appointment/services/base_services.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_appointment_model.dart';

class ApiServices {
  // current user
  static late Users currentUser;

  // get all appintment
  // Future<List<AppointmentModel>> getAllAppointment() async {
  //   QuerySnapshot querySnapshot = await Base.firestore
  //       .collection('user')
  //       .doc(Base.auth.currentUser!.uid)
  //       .collection('Appointment')
  //       .get();
  //   return querySnapshot.docs.map((doc) {
  //     return AppointmentModel.fromMap(doc.data() as Map<String, dynamic>);
  //   }).toList();
  // }


// get the Appointment based on the statusfiltter
  Future<List<AppointmentModel>> getAllAppointmentsStatus(
      String category) async {
    QuerySnapshot querySnapshot = await Base.firestore
        .collection('user')
        .doc(Base.auth.currentUser!.uid)
        .collection('Appointment')
        .where('status',
            isEqualTo: category) 
        .get();
    return querySnapshot.docs.map((doc) {
      return AppointmentModel.fromMap(doc.data() as Map<String, dynamic>);
    }).toList();
  }



}
