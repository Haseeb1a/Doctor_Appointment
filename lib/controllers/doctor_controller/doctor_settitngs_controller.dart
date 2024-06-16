import 'package:doctor_appointment/services/authservices.dart';

import '../../services/doctor_services.dart';

class DoctorSettitngsController {
  


    Future<String?> doctorLogout() async {
    AuthServices().signOut();
    
    // notifyListeners();
  }
}