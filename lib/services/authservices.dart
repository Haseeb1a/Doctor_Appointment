import 'dart:convert';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:doctor_appointment/models/doctor_model.dart';
import 'package:doctor_appointment/models/user_model.dart';
import 'package:doctor_appointment/services/base_services.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http_parser/http_parser.dart';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class AuthServices {
  final Dio dio = Dio();

//  Login
// / login to user or the doctor
  Future<String> loginUser(
      {required String email, required String password}) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
        await Base.auth
            .signInWithEmailAndPassword(email: email, password: password);
        DocumentReference docRef = FirebaseFirestore.instance
            .collection("doctors")
            .doc(Base.auth.currentUser!.uid);
        log(Base.auth.currentUser!.uid);
        // Get the document
        DocumentSnapshot docSnapshot = await docRef.get();

        if (docSnapshot.exists) {
          log('sssssssssssssssssssssssssssssssssssssssssssss1');

          sharedPrefs.setString('auth', 'doctors');
          return "doctors";
        } else {
          sharedPrefs.setString('auth', 'user');
          return "user";
        }
      } else {
        return "Please enter both email and password";
      }
    } on FirebaseAuthException catch (e) {
      SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
      sharedPrefs.setString('error', e.message ?? 'An error occurred');
      log('FirebaseAuth Error: ${e.code}, ${e.message}');
      return "Login failed: ${e.message}";
    } catch (e) {
      log('Error: $e');
      return "An unexpected error occurred";
    }
  }
// ---------------------------------------------------------------------------------

  // Singup the user
  Future<String> singUpuser({
    required String email,
    required String password,
    required String username,
    dynamic file,
  }) async {
    String responce = 'some error occerred';
    try {
      log('${email}${password}${username}');
      if (email.isNotEmpty || password.isNotEmpty || username.isNotEmpty) {
        // SignUp Using Email And Password
        UserCredential cred = await Base.auth
            .createUserWithEmailAndPassword(email: email, password: password);

        // User datas
        Users user = Users(
          email: email,
          uid: cred.user!.uid,
          username: username,
          appointments: [],
          isDoctor: false,
        );
        await Base.firestore
            .collection('user')
            .doc(cred.user!.uid)
            .set(user.toJson());
        responce = "success";
      }
    } catch (err) {
      responce = err.toString();
    }
    return responce;
  }
// -----------------------------------------------------------------------------------

//   // Singup the doctrot-----
  Future<String> singUpDoctor(
      {required String email,
      required String password,
      required String username,
      required DoctorModel doctordetals
      // dynamic file,
      }) async {
    String responce = 'some error occerred';
    try {
      log('${email}${password}${username}');
      if (email.isNotEmpty || password.isNotEmpty || username.isNotEmpty) {
        // SignUp Using Email And Password
        UserCredential cred = await Base.auth
            .createUserWithEmailAndPassword(email: email, password: password);

        // User datas
        DoctorModel doctordetails = DoctorModel(
          isActive: true,
            gender: doctordetals.gender,
            isDoctor: doctordetals.isDoctor,
            about: doctordetals.about,
            category: doctordetals.category,
            id: cred.user!.uid,
            name: doctordetals.name,
            place: doctordetals.place,
            qualifications: doctordetals.qualifications,
            workingStartTime: doctordetals.workingStartTime,
            workEndingTime: doctordetals.workEndingTime,
            
            phone: doctordetals.phone);

        await Base.firestore
            .collection('doctors')
            .doc(cred.user!.uid)
            .set(doctordetails.toMap());
        responce = "success";
      }
    } catch (err) {
      responce = err.toString();
    }
    return responce;
  }

// ------------------------------------------------------------------------------
  // Sign out
  Future<void> signOut() async {
    try {
      SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
      sharedPrefs.remove('Auth');
      sharedPrefs.remove('error');
      await Base.auth.signOut();
      log("sussess");
    } catch (e) {
      print("Error signing out: $e");
    }
  }

  // geterrortype
  Future<String?> sharedChecker(String type) async {
    final errorcheck = await SharedPreferences.getInstance();
    final error = errorcheck.getString(type);
    log(error.toString());
    return error;
  }
}
