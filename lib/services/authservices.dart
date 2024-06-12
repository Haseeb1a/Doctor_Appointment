import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:doctor_appointment/models/user_model.dart';
import 'package:doctor_appointment/services/base_services.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http_parser/http_parser.dart';
import 'dart:developer';

class AuthServices {
  static bool firstlogin = false;
  final Dio dio = Dio();

//  Login
// / login to user
  Future<String> loginUser(
      {required String email, required String password}) async {
    String res = 'Some error occurred';
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await Base.auth
            .signInWithEmailAndPassword(email: email, password: password);
        res = 'success';
      } else {
        res = "please enter all the fields";
      }
    } catch (err) {
      log(err.toString());
      res = err.toString();
    }
    return res;
  }

  // Singup the user-----
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
            appointments: []);
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

  // Sign out
  Future<void> signOut() async {
    try {
      await Base.auth.signOut();
      log("sussess");
    } catch (e) {
      print("Error signing out: $e");
    }
  }
}
