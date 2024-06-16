import 'package:doctor_appointment/view/widgets/traspent_button.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:doctor_appointment/constants/colors.dart';
import 'package:doctor_appointment/models/user_appointment_model.dart';
// import 'package:doctor_appointment/view/widgets/transparent_button.dart';

class AppointmentsDetailsView extends StatelessWidget {
  final AppointmentModel appointmentModel;

  AppointmentsDetailsView({super.key, required this.appointmentModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TransparentButton(
            onPressed: () {
              Navigator.pop(context);
            },
            color: AppColors.primary,
            icons: Icon(
              Icons.chevron_left_sharp,
              color: Colors.white,
            ),
          ),
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          appointmentModel.doctorName,
          style: GoogleFonts.roboto(
            textStyle: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Container(
        color: Color(0xFFF5F5F5), // Light gray background color
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            buildSectionTitle('Setted Day', IconlyLight.calendar),
            buildSectionContent(appointmentModel.time.toString().substring(0, 10)),
            buildDivider(),
            buildSectionTitle('Setted Time', IconlyLight.time_circle),
            buildSectionContent(appointmentModel.time.toString().substring(11, 16)),
            buildDivider(),
            buildSectionTitle('Place', IconlyLight.location),
            buildSectionContent(appointmentModel.place),
            buildDivider(),
            buildSectionTitle('Full Name', IconlyLight.profile),
            buildSectionContent(appointmentModel.username),
            buildDivider(),
            buildSectionTitle('Message', IconlyLight.chat),
            buildSectionContent(appointmentModel.message),
          ],
        ),
      ),
    );
  }

  Widget buildSectionTitle(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primary, size: 24),
          SizedBox(width: 10),
          Text(
            title,
            style: GoogleFonts.roboto(
              textStyle: TextStyle(
                color: AppColors.primary,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSectionContent(String content) {
    return Padding(
      padding: const EdgeInsets.only(left: 35, top: 5, bottom: 5),
      child: Text(
        content,
        style: GoogleFonts.roboto(
          textStyle: TextStyle(
            color: Colors.black38,
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget buildDivider() {
    return Divider(
      color: Colors.grey.shade300,
      thickness: 1,
      height: 20,
    );
  }
}
