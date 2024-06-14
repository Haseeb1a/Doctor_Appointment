import 'dart:async';
import 'dart:developer';
import 'dart:ffi';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment/models/doctor_model.dart';
import 'package:doctor_appointment/models/user_model.dart';
import 'package:doctor_appointment/services/base_services.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_appointment_model.dart';

class ApiServices {
  static late Users currentUser;

  // get all users
  Future<Users> getUserdetails() async {
    DocumentSnapshot doc = await Base.firestore
        .collection('user')
        .doc(Base.auth.currentUser!.uid)
        .get();
    return Users.fromSnap(doc);
  }

  // get all doctors
  Future<List<DoctorModel>> getAllDoctors() async {
    QuerySnapshot querySnapshot =
        await Base.firestore.collection('doctors').get();
    return querySnapshot.docs.map((doc) {
      return DoctorModel.fromMap(doc.data() as Map<String, dynamic>);
    }).toList();
  }

  // get all appintment
  Future<List<AppointmentModel>> getAllAppointment() async {
    QuerySnapshot querySnapshot = await Base.firestore
        .collection('user')
        .doc(Base.auth.currentUser!.uid)
        .collection('Appointment')
        .get();
    return querySnapshot.docs.map((doc) {
      return AppointmentModel.fromMap(doc.data() as Map<String, dynamic>);
    }).toList();
  }
}
