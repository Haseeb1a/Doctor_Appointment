import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment/controllers/appointment_controller.dart';

class UserAppointmentModel {
  String user;
  String doctor;
  String id;
  String day;
  String time;
  String mobile;
  String message;

  UserAppointmentModel({
    required this.user,
    required this.doctor,
    required this.id,
    required this.day,
    required this.time,
    required this.mobile,
    required this.message,
  });

  Map<String, dynamic> toJson() => {
        'user': user,
        'doctor': doctor,
        'id': id,
        'day': day,
        'time': time,
        'mobile': mobile,
        'message': message,
      };

  static UserAppointmentModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return UserAppointmentModel(
      user: snapshot['user'] ?? '',
      doctor: snapshot['doctor'] ?? '',
      id: snapshot['id'] ?? '',
      day: snapshot['day'] ?? '',
      time: snapshot['time'] ?? '',
      mobile: snapshot['mobile'] ?? '',
      message: snapshot['message'] ?? '',
    );
  }
}
