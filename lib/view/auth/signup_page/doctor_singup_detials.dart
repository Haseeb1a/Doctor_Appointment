import 'package:doctor_appointment/constants/consts.dart';
import 'package:doctor_appointment/controllers/auth_controller/doctor_singupcontroller.dart';
import 'package:doctor_appointment/controllers/auth_controller/signup_controller.dart';
import 'package:doctor_appointment/models/doctor_model.dart';
import 'package:doctor_appointment/view/widgets/custom_botton.dart';
import 'package:doctor_appointment/view/widgets/custom_snackbar.dart';
import 'package:doctor_appointment/view/widgets/textformfeilds.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../constants/constants.dart';
import '../Login_screen/login_screen.dart';

class DoctorSingupDetails extends StatelessWidget {
  final String name;
  final String email;
  final String password;
  final String confirmpassword;

  DoctorSingupDetails({
    super.key,
    required this.name,
    required this.email,
    required this.password,
    required this.confirmpassword,
  });

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final singUpController = Provider.of<DoctorSingupcontroller>(context);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        margin: EdgeInsets.only(top: 40),
        padding: EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  SizedBox(
                    width: 150,
                    child:
                        Lottie.asset('assets/Animation - 1718086168737.json'),
                  ),
                ],
              ),
              CustomBox.height(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Custom_Textformfeild(
                        unvaildText: "Enter the qualification",
                        hinttext: "Qualification",
                        textEditingController:
                            singUpController.qualifciatonController,
                        icon: Icons.insert_chart,
                      ),
                      CustomBox.height(15),
                      Custom_Textformfeild(
                        unvaildText: "Enter the category",
                        hinttext: "Category",
                        textEditingController:
                            singUpController.categoryController,
                        icon: Icons.category,
                      ),
                      CustomBox.height(15),
                      Custom_Textformfeild(
                        unvaildText: "Enter the place",
                        hinttext: "Place",
                        textEditingController: singUpController.placeController,
                        icon: Icons.home_work_rounded,
                      ),
                      CustomBox.height(15),
                      Custom_Textformfeild(
                        unvaildText: "Enter the phone",
                        hinttext: "Phone",
                        textEditingController: singUpController.phoneController,
                        icon: Icons.phone,
                      ),
                      CustomBox.height(15),
                         Row(
                      children: [
                        Expanded(
                          child: Custom_Textformfeild(
                            hinttext:'Work Start Time' ,
                            icon: Icons.timelapse_sharp,
                            textEditingController: singUpController.worktimestartController,
                            unvaildText:'Enter StartTime' ,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Custom_Textformfeild(
                            hinttext: "Work end Time",
                            icon: Icons.timelapse_sharp ,
                            textEditingController: singUpController.worktimeendController ,
                            unvaildText: "Enter Entingtime",
                          ),
                        ),
                      ],
                    ),
                      CustomBox.height(15),
                      Custom_Textformfeild(
                        unvaildText: "Type about you",
                        hinttext: "About",
                        textEditingController: singUpController.aboutController,
                        icon: Icons.swipe_right_alt_rounded,
                      ),
                      CustomBox.height(15),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        height: 60,
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Icon(Icons.person_2_sharp),
                            SizedBox(width: 10),
                            Expanded(
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  borderRadius: BorderRadius.circular(30),
                                  isExpanded: true,
                                  value: singUpController.selectedGender,
                                  hint: Text('Select Gender'),
                                  items: singUpController.genders
                                      .map((String gender) {
                                    return DropdownMenuItem<String>(
                                      value: gender,
                                      child: Text(gender),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    singUpController.gendetfliper(newValue!);
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      CustomBox.height(30),
                      CustomButton(
                        text: "SignUp",
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            singUpController.doctorSingUp(
                                password, email, name);
                            // Process data
                            // ScaffoldMessenger.of(context)
                            //     .showSnackBar(SnackBar(content: Text('Processing Data')));
                          }
                        },
                      ),
                      CustomBox.height(15),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Loginpage(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      AppStrings.haveanAccount,
                      style: TextStyle(color: Color.fromARGB(255, 0, 107, 194)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
