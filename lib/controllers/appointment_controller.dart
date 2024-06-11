import 'package:flutter/material.dart';

class AppointmentController extends ChangeNotifier {
  final TextEditingController appointmentDayController =
      TextEditingController();
  final TextEditingController appointmentTimeController =
      TextEditingController();
  final TextEditingController appointmentMobileController =
      TextEditingController();
  final TextEditingController appointmentNameController =
      TextEditingController();
  final TextEditingController appointmentMessageController =
      TextEditingController();
}
