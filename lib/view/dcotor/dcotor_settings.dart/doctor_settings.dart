import 'package:doctor_appointment/constants/consts.dart';
import 'package:doctor_appointment/controllers/doctor_controller/doctor_bottom_controller.dart';
import 'package:doctor_appointment/controllers/doctor_controller/doctor_settitngs_controller.dart';
import 'package:doctor_appointment/controllers/user_controller/bottom_controller.dart';
import 'package:doctor_appointment/controllers/user_controller/settings_controller/settings_controller.dart';
import 'package:doctor_appointment/view/auth/Login_screen/login_screen.dart';
import 'package:doctor_appointment/view/dcotor/dcotor_settings.dart/doctor_profle_edit.dart';
import 'package:doctor_appointment/view/user/settings_screen/settings_tiles.dart';
import 'package:doctor_appointment/view/widgets/traspent_button.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

import '../../widgets/custom_shimmer.dart';

class DoctorSettings extends StatelessWidget {
  const DoctorSettings({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsController = Provider.of<DoctorSettitngsController>(context);
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   title: AppStyles.boldText(title: "Settings"),
      //   elevation: 0.0,
      // ),
      body: Column(
        children: [
          Stack(

            children: [
              ClipPath(
                clipper: WaveClipperTwo(),
                child: Center(
                  child: Container(
                    height: 150,
                    width: double.infinity,
                    color: AppColors.primary,
                  ),
                ),
              ),
              const SizedBox(
                height: 200,
              ),
              Positioned(
                left: 10,
                bottom: 15,
                child: SizedBox(
                    height: 120,
                    width: 120,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.white,
                          width: 4,
                        ),
                      ),
                      child: SizedBox(
                        height: 150,
                        width: 130,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Consumer<DoctorBottomController>(
                            builder: (context, value, child) {
                              // Text('http://127.0.0.1:8000 ${value.user!.userprofile!.image}',
                              //     style: TextStyle(color: Colors.red),);
                              print('assets/femaleDoctor.jpg');
                              return value.currentDoctror == null
                                  ? FadeShimmer(
                                      height: 8,
                                      width: 100,
                                      radius: 4,
                                      highlightColor: Color(0xffF9F9FB),
                                      baseColor: Color(0xffE6E8EB),
                                    )
                                  : Hero(
                                      tag: 'profilephoto',
                                      child: Image.asset(value.currentDoctror!.gender=="Male"? 
                                      'assets/doctors.jpg' : 'assets/femaleDoctor.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                    );
                            },
                          ),
                        ),
                      ),
                    )),
              ),
              Positioned(
                left:170 ,
                bottom: 28,
                child: Consumer<DoctorBottomController>(
                  builder: (context, value, child) {
                    // value.getUserdata();
                    if (value.currentDoctror != null) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            value.currentDoctror!.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            value.currentDoctror!.category,
                          ),
                        ],
                      );
                    } else {
                      return FadeShimmer(
                        height: 8,
                        width: 100,
                        radius: 4,
                        highlightColor: Color(0xffF9F9FB),
                        baseColor: Color(0xffE6E8EB),
                      );
                    }
                  },
                ),
              ),
              Positioned(
                  right: 10,
                  bottom: 55,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DoctorProfileEdit()
                          ));
                    },
                    child: Container(
                        decoration: AppStyles.shadowDecoraion,
                        // decoration: BoxDecoration(

                        //   borderRadius: BorderRadius.circular(10),
                        //   color: Color.fromARGB(146, 248, 245, 245),
                        // ),
                        height: 50,
                        width: 50,
                        child: const Icon(
                          Icons.movie_edit,
                        )),
                  )),
                Positioned(
                  top: 20,
                  child: Padding(
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
                )  
            ],
          ),
          Divider(),
          SettingsTile(
            icon: Icon(
              IconlyLight.lock,
              color: AppColors.primary, // Equivalent to lock_open_outlined
            ),
            text: "about",
            onPressed: () {},
          ),
          SettingsTile(
            icon: Icon(
              IconlyLight.bookmark,
              color: AppColors.primary, // Equivalent to bookmark_added
            ),
            text: "terms and conditions", // Corrected spelling
            onPressed: () {},
          ),
          SettingsTile(
            icon: Icon(
              IconlyLight.logout,
              color: AppColors.primary,
            ),
            text: "logout",
            onPressed: () async {
              await settingsController.doctorLogout();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Loginpage(),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
