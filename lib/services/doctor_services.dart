import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment/models/doctor_model.dart';
import 'package:doctor_appointment/models/user_appointment_model.dart';
import 'package:doctor_appointment/services/base_services.dart';

import '../models/user_model.dart';

class DoctorServices {
  // get all doctors
  Future<List<DoctorModel>> getAllDoctors() async {
    QuerySnapshot querySnapshot =
        await Base.firestore.collection('doctors').get();
    return querySnapshot.docs.map((doc) {
      return DoctorModel.fromMap(doc.data() as Map<String, dynamic>);
    }).toList();
  }
//  --------------------------------------------------------------



//  get the current doctor
Future<DoctorModel> currentDoctor() async {
  DocumentSnapshot<Map<String, dynamic>> doc = await Base.firestore
      .collection('doctors')
      .doc(Base.auth.currentUser!.uid)
      .get();

  if (doc.exists) {
    Map<String, dynamic>? data = doc.data();
    if (data != null) {
      return DoctorModel.fromMap(data);
    } else {
      throw Exception('Document data is null');
    }
  } else {
    throw Exception('Document does not exist');
  }
}






}
