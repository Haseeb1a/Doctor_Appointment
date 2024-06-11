import 'package:doctor_appointment/constants/constants.dart';
import 'package:doctor_appointment/constants/styles.dart';
import 'package:doctor_appointment/view/widgets/textformfeilds.dart';
import 'package:flutter/material.dart';

class AppointmentsDetailsView extends StatelessWidget {
  const AppointmentsDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       
        elevation: 0.0,
        title: AppStyles.boldText(
            title: 'Doctor Name', color: Colors.black, size: 29),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppStyles.boldText(title: 'Selected appointment day'),
            CustomBox.height(5),
            AppStyles.normalText(title: 'Selected appointment day'),
            CustomBox.height(10),
            AppStyles.boldText(title: 'Selected appointment time'),
            CustomBox.height(5),
            AppStyles.normalText(title: 'Selected appointment day'),
            CustomBox.height(20),
            AppStyles.boldText(title: 'Mobile Number'),
            CustomBox.height(5),
            AppStyles.normalText(title: 'Selected appointment day'),
            CustomBox.height(10),
            AppStyles.boldText(title: 'full Name'),
            CustomBox.height(5),
            AppStyles.normalText(title: 'Selected appointment day'),
            CustomBox.height(10),
            AppStyles.boldText(title: 'Message '),
            CustomBox.height(5),
            AppStyles.normalText(title: 'Selected appointment day'),
          ],
        ),
      ),
    );
  }
}
