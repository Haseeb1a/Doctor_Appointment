import 'package:doctor_appointment/constants/colors.dart';
import 'package:doctor_appointment/controllers/doctor_controller/doctor_bottom_controller.dart';
import 'package:doctor_appointment/view/dcotor/dcotor_settings.dart/doctor_settings.dart';
import 'package:doctor_appointment/view/dcotor/doctor_home/chat_page.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

import '../../../constants/styles.dart';
import '../../../controllers/doctor_controller/doctor_appontment_list.dart';
import '../../../controllers/user_controller/bottom_controller.dart';
import '../appointment/doctor_appointment_list.dart';

class DoctorHome extends StatelessWidget {
  const DoctorHome({super.key});

  @override
  Widget build(BuildContext context) {
    final appointmentController = Provider.of<DoctorAppontmentList>(
      context,listen: false
    );
  //   appointmentController.getAppoitmentdetails("confirmed");
    final bottomcontroller = Provider.of<DoctorBottomController>(
      context,
    );
  //  bottomcontroller .getchartdatas('confirmed');
  //   bottomcontroller .getchartdatas('pending');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        toolbarHeight: 90,
        automaticallyImplyLeading: false,
        title: Consumer<DoctorBottomController>(
          builder: (context, homedata, child) {
            if (homedata.currentDoctror?.name != null) {
              return Row(
                children: [
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      child:  Image.asset(homedata.currentDoctror!.gender=="Male"? 
                                      'assets/doctors.jpg' : 'assets/femaleDoctor.jpg',
                                        fit: BoxFit.cover,
                                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    homedata.currentDoctror!.name,
                    style: GoogleFonts.mali(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(IconlyBold.setting),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DoctorSettings(),
                          ));
                    },
                    color: Colors.white,
                  )
                ],
              );
            } else {
              return Row(
                children: [
                  FadeShimmer.round(
                    size: 60, // Custom size
                    fadeTheme: FadeTheme.light, // Custom fade theme
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  FadeShimmer(
                    height: 8,
                    width: 100,
                    radius: 4,
                    highlightColor: Color(0xffF9F9FB),
                    baseColor: Color(0xffE6E8EB),
                  ),
                ],
              );
            }
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12, top: 12),
            child: Row(
              children: [
                const Icon(Icons.insert_chart_outlined),
                Text(
                  "Progress",
                  style: GoogleFonts.mali(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Chart(confirmed: bottomcontroller.workcompleted,
          pending:bottomcontroller.workpending ,),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Align(
                alignment: Alignment.bottomLeft,
             child:    Text(
                  "Confirmed Appointments",
                  style: GoogleFonts.mali(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
             ),
          ),
          AppointmentStatusLists(
            authType: "doctors",
            // bottomController: bottomController,
            status: "confirmed",
          ),
        ],
      ),
    );
  }
}
