import 'package:doctor_appointment/constants/constants.dart';
import 'package:doctor_appointment/constants/consts.dart';
import 'package:doctor_appointment/view/widgets/appoitment.dart';

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../widgets/custom_botton.dart';

class DoctorProfileScreen extends StatelessWidget {
  const DoctorProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppStyles.boldText(
            title: 'Doctor Name', color: Colors.black, size: 29),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(13),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      // backgroundImage: AssetImage('assets/doctor_image.png'), // Ensure the image exists
                      child: Icon(Icons.person, size: 40), // Fallback icon
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppStyles.boldText(
                            title: 'Doctor Name',
                            color: Colors.black,
                            size: 18),
                        AppStyles.boldText(
                            title: 'Specialization',
                            color: Colors.black,
                            size: 18),
                        // Spacer(),
                        VxRating(
                          selectionColor: Colors.yellow,
                          onRatingUpdate: (value) {},
                          maxRating: 5,
                          count: 5,
                          value: 4,
                          stepInt: true,
                        ),
                        AppStyles.boldText(
                            title: 'See All Reviews',
                            color: Colors.black,
                            size: 18),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.primary.withOpacity(0.3),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color:AppColors.primary.withOpacity(0.),
                  //     spreadRadius: 5,
                  //     blurRadius: 7,
                  //     offset: Offset(0, 3), // changes position of shadow
                  //   ),
                  // ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: AppStyles.boldText(
                          title: 'Contact Information', color: Colors.black),
                      subtitle: AppStyles.normalText(
                          title: "Phone: 454", color: Colors.red, size: 18.0),
                      trailing: Container(
                          width: 50,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                          ),
                          child: Icon(
                            Icons.phone,
                            color: Colors.black26,
                          )),
                    ),
                    SizedBox(height: 10),
                    AppStyles.boldText(title: 'About', color: Colors.black),
                    SizedBox(height: 5),
                    AppStyles.normalText(
                        title: 'This is the section about the doctor',
                        color: Colors.black),
                    SizedBox(height: 10),
                    AppStyles.boldText(title: 'Address', color: Colors.black),
                    SizedBox(height: 5),
                    AppStyles.normalText(
                        title: 'Address of the doctor', color: Colors.black),
                    SizedBox(height: 10),
                    AppStyles.boldText(
                        title: 'Working Time', color: Colors.black),
                    SizedBox(height: 5),
                    AppStyles.normalText(
                        title: '9:00 AM to 12:00 PM',
                        color: Colors.black,
                        size: 18),
                    SizedBox(height: 10),
                    AppStyles.boldText(title: 'Services', color: Colors.black),
                    SizedBox(height: 5),
                    AppStyles.normalText(
                        title: 'These are the services offered by the doctor',
                        color: Colors.black,
                        size: 18),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomButton(
          backgroundColor: Colors.green,
          text: "Book an Appointment",
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AppointmentScreen(),
                ));
          },
        ),
      ),
    );
  }
}
