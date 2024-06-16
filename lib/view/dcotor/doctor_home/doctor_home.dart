import 'package:doctor_appointment/constants/colors.dart';
import 'package:doctor_appointment/controllers/doctor_controller/doctor_bottom_controller.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

import '../../../controllers/user_controller/bottom_controller.dart';

class DoctorHome extends StatelessWidget {
  const DoctorHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        toolbarHeight: 90,
        automaticallyImplyLeading: false,
        title: Consumer<DoctorBottomController>(
          builder: (context, homedata, child) {
            if (homedata.currentDoctror!.name != null) {
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
                    homedata.currentDoctror!.name,
                    style: GoogleFonts.mali(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  Spacer(
                    
                  ),
                  Icon(IconlyBold.setting,color: Colors.white,)
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
