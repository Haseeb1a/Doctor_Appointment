import 'dart:developer';
import 'dart:ffi';

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

// get the Appointment based on the statusfiltter
  Future<List<AppointmentModel>> getAllAppointmentsStatus(
      String category) async {
    log('rrrrrrrrrrrrrrrrrrrrrrrrrr${category}}');
    log(Base.auth.currentUser!.uid);
    QuerySnapshot querySnapshot = await Base.firestore
        .collection('doctors')
        .doc(Base.auth.currentUser!.uid)
        .collection('Appointment')
        .where('status', isEqualTo: category)
        .get();

    querySnapshot.docs.map((doc) {
      final a = AppointmentModel.fromMap(doc.data());
      log('categry${a.time}');
    }).toList();
    return querySnapshot.docs.map((doc) {
      return AppointmentModel.fromMap(doc.data());
    }).toList();
  }

  // get doctor appointment confirmation

  Future<void> appointmentconfirmation(
    String time,
    String userid,
    String doctorid,
  ) async {
    try {
      log(Base.auth.currentUser!.uid);
      log('dflkjsls');
      log('time${time}');
      // Update doctor's appointment
      var doctorUpdates = Base.firestore
          .collection('doctors')
          .doc(Base.auth.currentUser!.uid)
          .collection('Appointment')
          .doc(time);

      await doctorUpdates.update({
        'status': "confirmed", // Update 'status' field to 'confirmed'
      });

      // Update user's appointment
      var userUpdates = Base.firestore
          .collection('user')
          .doc(userid) // Assuming 'userid' is the correct user's UID
          .collection('Appointment')
          .doc(time);

      await userUpdates.update({
        'status': "confirmed", // Update 'status' field to 'confirmed'
      });

      print('Appointments confirmed successfully');
    } catch (e) {
      print('Error updating document: $e');
      // You can throw the error again if you want to propagate it to the caller
      throw e;
    }
  }

// doctor profile edit

  Future<void> updateTheDoctorProfile(DoctorModel doctor) async {
    try {
      log(Base.auth.currentUser!.uid);

      var doctorData = doctor.toMap();

      await Base.firestore
          .collection('doctors')
          .doc(Base.auth.currentUser!.uid)
          .update(doctorData);

      print('Profile updated successfully');
    } catch (e) {
      print('Error updating document: $e');
      throw e; // Propagate the error to the caller
    }
  }

  Future<bool> isActiveChecker() async {
    try {
      DocumentSnapshot doc = await Base.firestore
          .collection('doctors')
          .doc(Base.auth.currentUser!.uid)
          .get();
      if (doc.exists) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        bool isActive = data['isActive'] ?? false;
        return isActive;
      } else {
        // Handle the case where the document does not exist
        return false;
      }
    } catch (e) {
      // Handle any errors that occur during the fetch
      print('Error fetching doctor data: $e');
      return false;
    }
    // ---------------------------------------------------------------------------
  }

  Stream<bool> isActiveStream() {
    return Base.firestore
        .collection('doctors')
        .doc(Base.auth.currentUser!.uid)
        .snapshots()
        .map((doc) {
      if (doc.exists) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        log(data['isActive'].toString());
        return data['isActive'] ?? false;
      } else {
        log('false');
        return false;
        
      }
    });
  }

  Future<void> updateActiveStatus(bool isActive) {
    return Base.firestore
        .collection('doctors')
        .doc(Base.auth.currentUser!.uid)
        .update({
      'isActive': isActive,
    });
  }
}
