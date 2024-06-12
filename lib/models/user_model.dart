import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment/controllers/appointment_controller.dart';
import 'package:doctor_appointment/models/user_appointment_model.dart';

class Users {
  String email;
  String uid;
  String username;
  List<UserAppointmentModel> appointments;

  Users({
    required this.email,
    required this.uid,
    required this.username,
    required this.appointments,
  });

  Map<String, dynamic> toJson() => {
        'username': username,
        'uid': uid,
        'email': email,
        'appointments': appointments.map((appointment) => appointment.toJson()).toList(),
      };

  static Users fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Users(
      username: snapshot['username'] ?? '',
      uid: snapshot['uid'] ?? '',
      email: snapshot['email'] ?? '',
      appointments: (snapshot['appointments'] as List<dynamic>)
          .map((appointment) => UserAppointmentModel.fromSnap(appointment))
          .toList(),
    );
  }
}
