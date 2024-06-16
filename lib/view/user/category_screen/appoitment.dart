import 'package:doctor_appointment/constants/constants.dart';
import 'package:doctor_appointment/constants/consts.dart';
import 'package:doctor_appointment/constants/styles.dart';
import 'package:doctor_appointment/controllers/user_controller/category_controller/appointment_controller.dart';
import 'package:doctor_appointment/controllers/user_controller/home_controller/home_controller.dart';
import 'package:doctor_appointment/models/doctor_model.dart';
import 'package:doctor_appointment/view/widgets/booking.dart';
import 'package:doctor_appointment/view/widgets/custom_botton.dart';
import 'package:doctor_appointment/view/widgets/textformfeilds.dart';
import 'package:doctor_appointment/view/widgets/traspent_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppointmentScreen extends StatelessWidget {
  DoctorModel doctordetilas;
  AppointmentScreen({super.key, required this.doctordetilas});

  @override
  Widget build(BuildContext context) {
    final appointmentController = Provider.of<AppointmentController>(context);
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
              )),
        ),
        title: AppStyles.boldText(
            title: doctordetilas.name, color: Colors.black, size: 29),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: AppStyles.boldText(title: 'About'),
              ),
              Row(
                children: [
                  Container(
                    decoration: AppStyles.shadowDecoraion,
                    height: 100,
                    width: 100,
                    child: Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          'https://cananywhere.com/wp-content/uploads/2020/10/floor-buffing.jpg',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 4),
                          Text(
                            doctordetilas.category,
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            doctordetilas.place,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            doctordetilas.about,
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            doctordetilas.qualifications,
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              AppStyles.boldText(title: 'Select the Date Time'),
              CustomBox.height(5),
              ModalItem(),
              CustomBox.height(5),
              // Custom_Textformfeild(
              //     hinttext: "Select day",
              //     textEditingController:
              //         appointmentController.appointmentDayController,icon: Icons.calendar_month,),
              // CustomBox.height(10),
              // AppStyles.boldText(title: 'Selected appointment time'),
              // CustomBox.height(5),
              // Custom_Textformfeild(
              //     hinttext: "Select the appontment time",
              //     textEditingController:
              //         appointmentController.appointmentTimeController,icon: Icons.timer_rounded),
              CustomBox.height(30),

              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: AppStyles.boldText(title: 'Full Name'),
              ),
              CustomBox.height(4),
              Custom_Textformfeild(
                       unvaildText: "enter the name",
                hinttext: "Enter Your Name",
                textEditingController:
                    appointmentController.appointmentNameController,
                icon: Icons.person,
              ),
              CustomBox.height(10),

              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: AppStyles.boldText(title: 'Mobile Number'),
              ),
              CustomBox.height(5),
              Custom_Textformfeild(
                       unvaildText: "enter the number",
                  hinttext: " Enter Your Mobile Number",
                  textEditingController:
                      appointmentController.appointmentMobileController,
                  icon: Icons.phone),
              CustomBox.height(10),
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: AppStyles.boldText(title: 'Message'),
              ),
              CustomBox.height(5),
              Custom_Textformfeild(
                unvaildText: "enter the message",
                hinttext: "Type here..",
                textEditingController:
                    appointmentController.appointmentMessageController,
                icon: Icons.message,
                
                maxline: 5,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomButton(
          backgroundColor: AppColors.primary,
          text: "Confirm",
          onPressed: () {
            appointmentController.checker(doctordetilas);
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => AppointmentScreen(doctordetilas: doctordetilas,),
            //     ));
          },
        ),
      ),
    );
  }
}
