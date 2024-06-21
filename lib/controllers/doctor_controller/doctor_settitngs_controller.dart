import 'package:doctor_appointment/services/authservices.dart';
import 'package:flutter/material.dart';

import '../../services/doctor_services.dart';

class DoctorSettitngsController  extends ChangeNotifier{
  


    Future<String?> doctorLogout() async {
    AuthServices().signOut();
    
    // notifyListeners();
  }
}