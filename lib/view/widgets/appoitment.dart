import 'package:doctor_appointment/constants/constants.dart';
import 'package:doctor_appointment/constants/styles.dart';
import 'package:doctor_appointment/controllers/appointment_controller.dart';
import 'package:doctor_appointment/controllers/home_controller.dart';
import 'package:doctor_appointment/view/widgets/custom_botton.dart';
import 'package:doctor_appointment/view/widgets/textformfeilds.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appointmentController = Provider.of<AppointmentController>(context);
    return Scaffold(
      appBar: AppBar(
        title: AppStyles.boldText(
            title: 'Doctor Name', color: Colors.black, size: 29),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
        
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppStyles.boldText(title: 'Selected appointment day'),
              CustomBox.height(5),
              Custom_Textformfeild(
                  hinttext: "Select day",
                  textEditingController:
                      appointmentController.appointmentDayController,icon: Icons.calendar_month,),
              CustomBox.height(10),
              AppStyles.boldText(title: 'Selected appointment time'),
              CustomBox.height(5),
              Custom_Textformfeild(
                  hinttext: "Select the appontment time",
                  textEditingController:
                      appointmentController.appointmentTimeController,icon: Icons.timer_rounded),
              CustomBox.height(20),
              CustomBox.height(10),
              AppStyles.boldText(title: 'Mobile Number'),
              CustomBox.height(5),
              Custom_Textformfeild(
                  hinttext: " Enter the Mobile Number",
                  textEditingController:
                      appointmentController.appointmentMobileController,icon: Icons.phone),
              CustomBox.height(10),
              AppStyles.boldText(title: 'full Name'),
              CustomBox.height(5),
              Custom_Textformfeild(
                  hinttext: "Enter Your Name",
                  textEditingController:
                      appointmentController.appointmentNameController,icon: Icons.person,),
              CustomBox.height(10),
              AppStyles.boldText(title: 'Message'),
              CustomBox.height(5),
              Custom_Textformfeild(
                  hinttext: "Enter the Message",
                  textEditingController:
                      appointmentController.appointmentMessageController,icon: Icons.message),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomButton(
          backgroundColor: Colors.green,
          text: "Confirm",
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
