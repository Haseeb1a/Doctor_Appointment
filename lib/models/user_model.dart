import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment/controllers/user_controller/category_controller/appointment_controller.dart';
import 'package:doctor_appointment/models/user_appointment_model.dart'; // Ensure the correct model file is imported

class Users {
  String email;
  String uid;
  String username;
  List<AppointmentModel> appointments;
  bool isDoctor; // Add the isDoctor field

  Users({
    required this.email,
    required this.uid,
    required this.username,
    required this.appointments,
    required this.isDoctor, // Add this to the constructor
  });

  // Converts the Users instance to a map for Firestore
  Map<String, dynamic> toJson() => {
        'username': username,
        'uid': uid,
        'email': email,
        'appointments': appointments.map((appointment) => appointment.toMap()).toList(),
        'isDoctor': isDoctor, // Add this to the toJson method
      };

  // Creates a Users instance from a Firestore DocumentSnapshot
  static Users fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Users(
      username: snapshot['username'] ?? '',
      uid: snapshot['uid'] ?? '',
      email: snapshot['email'] ?? '',
      appointments: (snapshot['appointments'] as List<dynamic>)
          .map((appointment) => AppointmentModel.fromMap(appointment as Map<String, dynamic>))
          .toList(),
      isDoctor: snapshot['isDoctor'] ?? false, // Add this to the fromSnap method
    );
  }
}
