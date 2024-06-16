import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../controllers/user_controller/bottom_controller.dart';

class DoctorAppointmentList extends StatelessWidget {
  const DoctorAppointmentList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Consumer<BottomController>(
          builder: (context, homedata, child) {
            if (homedata.userDetails != null) {
              return Row(
                children: [
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      child: Image.asset(
                        'assets/doctorss.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    homedata.userDetails!.username,
                    style: GoogleFonts.mali(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
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
      body: Container(),
    );
  }
}
