import 'package:doctor_appointment/services/api_services.dart';
import 'package:doctor_appointment/models/user_model.dart';
import 'package:doctor_appointment/services/authservices.dart';
import 'package:flutter/material.dart';

import '../../../services/user_servies.dart';

class SettingsController extends ChangeNotifier {
  SettingsController() {
    getuserdetails();
    userDetails;
    notifyListeners;
  }
  Users? userDetails;

  Future<String?> getuserdetails() async {
    userDetails = await UserServies().getUserdetails();
    notifyListeners();
  }

  Future<String?> userLogout() async {
    AuthServices().signOut();
    
    notifyListeners();
  }
}
