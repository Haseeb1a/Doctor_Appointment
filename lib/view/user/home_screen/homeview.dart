import 'package:doctor_appointment/constants/constants.dart';
import 'package:doctor_appointment/constants/consts.dart';
import 'package:doctor_appointment/controllers/user_controller/appointment_list_controller.dart';
import 'package:doctor_appointment/controllers/user_controller/bottom_controller.dart';
import 'package:doctor_appointment/controllers/user_controller/home_controller/home_controller.dart';
import 'package:doctor_appointment/view/user/appointment_list_screen/appointment_list_screen.dart';
import 'package:doctor_appointment/view/user/category_screen/categorytile.dart';

import 'package:doctor_appointment/view/widgets/custom_shimmer.dart';
import 'package:doctor_appointment/view/widgets/textformfeilds.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../category_screen/doctorprofile_screen.dart';

class Homeviewscreen extends StatelessWidget {
  const Homeviewscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeConteoller>(context);
    final bottomController = Provider.of<BottomController>(context);
    final appointmentController =
        Provider.of<AppointmentListController>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(170.0), // Increased height
        child: AppBar(
          // leading:  AppStyles.boldText(
          //         title: 'Welcome User',
          //         color: Colors.white,
          //         size: 24,
          //       ),
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
                          'assets/person.png',
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

          backgroundColor: AppColors.primary,
          automaticallyImplyLeading: false,
          elevation: 0.0,
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(left: 8, right: 8.0, top: 90),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer<HomeConteoller>(
                  builder: (context, homedatas, child) {
                    return homedatas.is_Doctor
                        ? TextFormField(
                            controller: homedatas.doctorController,
                            onChanged: (textvalue) {
                              homedatas.getSearchedDoctors(textvalue);
                            },
                            decoration: InputDecoration(
                                hintText: 'Doctor Name',
                                prefixIcon: IconButton(
                                    onPressed: () {},
                                    color: Color.fromARGB(255, 13, 43, 67),
                                    // getData();

                                    icon: const Icon(Icons.search)),
                                // prefixIcon: Icon(Icons.search),
                                filled: true,
                                fillColor: Colors.white, // Background color
                                contentPadding: const EdgeInsets.all(
                                    12), // Adjust the padding
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 13, 43,
                                          67)), // Change the focused border color
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 13, 43,
                                          67)), // Change the enabled border color
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      homeController.doctorCheking();
                                      
                                      homedatas.doctorController
                                          .clear();
                                    },
                                    // onPressed: homepageconter.clearsearch,
                                    icon: const Icon(
                                      Icons.clear,
                                      color: Colors.black,
                                    ))),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    homeController.doctorCheking();
                                  },
                                  child: CircleAvatar(
                                      radius: 27,
                                      backgroundColor: Colors.white,
                                      child: Icon(Icons.search_rounded)),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Search the Doctor',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                )
                              ],
                            ),
                          );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      body: Consumer<HomeConteoller>(
        builder: (context, homedata, child) {
          return homedata.is_Doctor
              ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                          height: 250,
                          child: bottomController.doctorDetails.isEmpty
                              ? Custom_Shimmer(width: 150, height: 100)
                              : ListView.builder(
                                  physics: BouncingScrollPhysics(),
                                  itemCount:
                                      homedata.nameddoctors.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Consumer<HomeConteoller>(
                                      builder: (context, doctordatas, child) {
                                        return GestureDetector(
                                          onTap: () {
                                            // Navigator.push(
                                                // context,
                                                // MaterialPageRoute(
                                                //   builder: (context) =>
                                                //       DoctorProfileScreen(
                                                //     doctordetilas: 
                                                //         .[index],
                                                //   ),
                                                // ));
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: AppColors.primary,
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            margin: EdgeInsets.only(right: 8),
                                            height: 100,
                                            width: 150,
                                            child: Column(
                                              children: [
                                                Container(
                                                    decoration: BoxDecoration(
                                                        color: AppColors.primary),
                                                    alignment: Alignment.center,
                                                    child: doctordatas
                                                                .nameddoctors[
                                                                    index]
                                                                .gender ==
                                                            "Male"
                                                        ? Image.asset(
                                                            'assets/doctors.jpg')
                                                        : Image.asset(
                                                            'assets/femaleDoctor-JzHZTDpCc-transformed (1).jpeg')),
                                                CustomBox.height(5),
                                                AppStyles.boldText(
                                                    title: doctordatas
                                                        .nameddoctors[index]
                                                        .name,
                                                    size: 16,
                                                    color: Colors.white),
                                                CustomBox.height(5),
                                                AppStyles.boldText(
                                                    title: doctordatas
                                                        .nameddoctors[index]
                                                        .category,
                                                    size: 14,
                                                    color: Colors.white)
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                        ),
              )
              : ListView(
                  children: [
                    CustomBox.height(10),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 10),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: AppStyles.boldText(
                              title: 'Popular Doctors',
                              color: AppColors.primary,
                              size: 18)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 250,
                        child: bottomController.doctorDetails.isEmpty
                            ? Custom_Shimmer(width: 150.0, height: 100.0)
                            : ListView.builder(
                                physics: BouncingScrollPhysics(),
                                itemCount:
                                    bottomController.doctorDetails.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Consumer<BottomController>(
                                    builder: (context, doctordatas, child) {
                                      return GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    DoctorProfileScreen(
                                                  doctordetilas: doctordatas
                                                      .doctorDetails[index],
                                                ),
                                              ));
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: AppColors.primary,
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          margin: EdgeInsets.only(right: 8),
                                          height: 100,
                                          width: 150,
                                          child: Column(
                                            children: [
                                              Container(
                                                  decoration: BoxDecoration(
                                                      color: AppColors.primary),
                                                  alignment: Alignment.center,
                                                  child: doctordatas
                                                              .doctorDetails[
                                                                  index]
                                                              .gender ==
                                                          "Male"
                                                      ? Image.asset(
                                                          'assets/doctors.jpg')
                                                      : Image.asset(
                                                          'assets/femaleDoctor-JzHZTDpCc-transformed (1).jpeg')),
                                              CustomBox.height(5),
                                              AppStyles.boldText(
                                                  title: doctordatas
                                                      .doctorDetails[index]
                                                      .name,
                                                  size: 16,
                                                  color: Colors.white),
                                              CustomBox.height(5),
                                              AppStyles.boldText(
                                                  title: doctordatas
                                                      .doctorDetails[index]
                                                      .category,
                                                  size: 14,
                                                  color: Colors.white)
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                      ),
                    ),
                    CustomBox.height(5),
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Align(
                              alignment: Alignment.centerRight,
                              child: AppStyles.boldText(
                                size: 14,
                                title: 'View All',
                                color: Colors.black,
                              )),
                          Icon(Icons.arrow_right)
                        ],
                      ),
                    ),
                    CustomBox.height(20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: AppStyles.boldText(
                              title: "Confirmed Appointments",
                              color: AppColors.dark)),
                    ),
                    AppointmentStatusList(
                      bottomController: appointmentController,
                      status: "confirmed",
                    ),
                  ],
                );
        },
      ),
    );
  }
}
