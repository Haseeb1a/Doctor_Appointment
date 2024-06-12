import 'package:doctor_appointment/services/authservices.dart';
import 'package:flutter/material.dart';

class SettingsController extends ChangeNotifier {
  Future<String?> userLogout() async {
    AuthServices().signOut();
    notifyListeners();
  }
}
