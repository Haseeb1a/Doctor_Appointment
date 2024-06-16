import 'dart:math';

import 'package:doctor_appointment/constants/consts.dart';
import 'package:doctor_appointment/models/doctor_model.dart';
import 'package:doctor_appointment/view/user/category_screen/appoitment.dart';
import 'package:doctor_appointment/view/user/category_screen/category_screen.dart';
import 'package:doctor_appointment/view/widgets/traspent_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

import 'package:provider/provider.dart';

class DoctorProfileScreen extends StatelessWidget {
  DoctorModel doctordetilas;
  // int index;
  DoctorProfileScreen({
    super.key,
    required this.doctordetilas,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(children: [
                    Container(
                      // decoration: BoxDecoration(),
                      height: 250,
                      width: double.infinity,
                      child: Hero(
                        tag: 'posters',
                        child: ClipPath(
                          clipper: ShapeBorderClipper(
                              shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                17.0), // Adjust the radius as needed
                          )),
                          child: Image.network(
                            'https://cananywhere.com/wp-content/uploads/2020/10/floor-buffing.jpg',
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 30,
                      left: 20,
                      child: TransparentButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          color: AppColors.primary,
                          icons: Icon(
                            Icons.chevron_left_sharp,
                            color: Colors.white,
                          )),
                    ),
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      color: AppColors.primary,
                    ),
                    // decoration: AppStyles.shadowDecoraion,

                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppStyles.boldText(
                              title: 'Name: ${doctordetilas.name}',
                              color: Colors.white,
                              size: 16),
                          AppStyles.boldText(
                              title: 'Cateogory: ${doctordetilas.category}',
                              color: Colors.white,
                              size: 16)
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color.fromARGB(255, 197, 204, 207),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          title: AppStyles.boldText(
                              title: 'Contact Information',
                              color: Colors.black),
                          subtitle: AppStyles.normalText(
                              title: doctordetilas.phone,
                              color: Colors.red,
                              size: 18.0),
                          trailing: Container(
                              width: 55,
                              height: 50,
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.green,
                              ),
                              child: Icon(
                                Icons.phone,
                                color: Colors.white,
                              )),
                        ),
                        SizedBox(height: 10),
                        AppStyles.boldText(title: 'About', color: Colors.black),
                        SizedBox(height: 5),
                        AppStyles.normalText(
                            title: doctordetilas.about, color: Colors.black),
                        SizedBox(height: 10),
                        AppStyles.boldText(
                            title: 'Address', color: Colors.black),
                        SizedBox(height: 5),
                        AppStyles.normalText(
                            title: doctordetilas.place, color: Colors.black),
                        SizedBox(height: 10),
                        AppStyles.boldText(
                            title: 'Working Time', color: Colors.black),
                        SizedBox(height: 5),
                        AppStyles.normalText(
                            title: doctordetilas.workingTime,
                            color: Colors.black,
                            size: 18),
                        SizedBox(height: 10),
                        AppStyles.boldText(
                            title: 'Services', color: Colors.black),
                        SizedBox(height: 5),
                        AppStyles.normalText(
                            title: doctordetilas.qualifications,
                            color: Colors.black,
                            size: 18),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Expanded(
                        child: SizedBox(
                          height: 65,
                          child: MaterialButton(
                            onPressed: () {
//                               Share.share('''
// Name: ${professional.name}
// category: ${professional.category}
// place:  ${professional.place}
// Qualifications: ${professional.qualifications}
// workingTime: ${professional.workingTime}
// Phone: ${professional.phone}
//                                        ''', subject: 'about Doctor');
                            },
                            child: Icon(Icons.share),
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  20.0), // Adjust the value as needed
                              side: const BorderSide(color: AppColors.primary),
                            ),
                          ),
                        ),
                      )),
                  Expanded(
                    child: SizedBox(
                      height: 65,
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AppointmentScreen(
                                  doctordetilas: doctordetilas,
                                ),
                              ));
                        },
                        child: const Text(
                          'Booking',
                          style: TextStyle(color: Colors.white),
                        ),
                        color: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              20.0), // Adjust the value as needed
                        ),
                      ),
                    ),
                  ),
                ],
              ) // your widget would go here
              )
        ],
      ),
    );
  }
}

class materilaStyleButtom extends StatelessWidget {
  VoidCallback funcion;
  String text;
  Color textColor;
  Color buttonColor;
  materilaStyleButtom(
      {super.key,
      required this.textColor,
      required this.text,
      required this.buttonColor,
      required this.funcion});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 65,
        child: MaterialButton(
          onPressed: () {
            funcion;
          },
          child: Text(
            text,
            style: TextStyle(color: textColor),
          ),
          color: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(20.0), // Adjust the value as needed
            side: const BorderSide(color: Colors.green),
          ),
        ),
      ),
    );
  }
}

void _showBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.photo),
              title: const Text('Photos'),
              onTap: () {
                // Handle tap on 'Photos' option
              },
            ),
            ListTile(
              leading: const Icon(Icons.video_library),
              title: const Text('Videos'),
              onTap: () {
                // Handle tap on 'Videos' option
              },
            ),
            ListTile(
              leading: const Icon(Icons.music_note),
              title: const Text('Music'),
              onTap: () {
                // Handle tap on 'Music' option
              },
            ),
          ],
        ),
      );
    },
  );
}
