import 'package:doctor_appointment/constants/consts.dart';
import 'package:doctor_appointment/controllers/auth_controller/signup_controller.dart';
import 'package:doctor_appointment/view/auth/signup_page/doctor_singup_detials.dart';
import 'package:doctor_appointment/view/widgets/custom_botton.dart';
import 'package:doctor_appointment/view/widgets/custom_snackbar.dart';
import 'package:doctor_appointment/view/widgets/textformfeilds.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../constants/constants.dart';
import '../Login_screen/login_screen.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final singUpcontroller = Provider.of<SignupController>(context);
    return Scaffold(
      body: Container(
          margin: EdgeInsets.only(top: 40),
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  SizedBox(
                    width: 250,
                    child:
                        Lottie.asset('assets/Animation - 1718086168737.json'),
                  ),
                ],
              ),
              CustomBox.height(20),
              Expanded(
                flex: 2,
                child: Container(
                    child: Form(
                        child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Custom_Textformfeild(
                               unvaildText: "enter the name",
                        hinttext: "Enter Your Name",
                        textEditingController: singUpcontroller.nameController,
                        icon: Icons.person,
                      ),
                      CustomBox.height(20),
                      Custom_Textformfeild(
                               unvaildText: "enter the email",
                        hinttext: "Enter Your Email",
                        textEditingController: singUpcontroller.emailController,
                        icon: Icons.email,
                      ),
                      CustomBox.height(20),
                      Custom_Textformfeild(
                               unvaildText: "enter the password",
                        hinttext: "Enter Your Password ",
                        textEditingController:
                            singUpcontroller.passwordController,
                        icon: Icons.lock,
                      ),
                      CustomBox.height(20),
                      Custom_Textformfeild(
                               unvaildText: "enter the password",
                        hinttext: "Confirm Password",
                        textEditingController:
                            singUpcontroller.confrimpasswordController,
                        icon: Icons.lock,
                      ),
                      CustomBox.height(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Radio(
                                  activeColor: Colors.blue.shade700,
                                  value: 'user', //userendpoints
                                  groupValue: singUpcontroller.groupValue,
                                  onChanged: (value) {
                                    singUpcontroller
                                        .choosingRegistorCatogory(value);
                                  }),
                              const Text(
                                'user',
                                style: TextStyle(),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                  activeColor:
                                      const Color.fromRGBO(25, 118, 210, 1),
                                  value: 'Doctor', //Proffestionalendpoints
                                  groupValue: singUpcontroller.groupValue,
                                  onChanged: (value) {
                                    singUpcontroller
                                        .choosingRegistorCatogory(value!);
                                  }),
                              const Text(
                                'Doctor',
                                style: TextStyle(),
                              )
                            ],
                          )
                        ],
                      ),
                      CustomButton(
                        text: singUpcontroller.groupValue == 'Doctor'
                            ? "More About You"
                            : "SingUp",
                        onPressed: () async {
                          if (singUpcontroller.groupValue == 'Doctor') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DoctorSingupDetails(confirmpassword:singUpcontroller.confrimpasswordController.text ,email: singUpcontroller.emailController.text,name: singUpcontroller.nameController.text,password: singUpcontroller.passwordController.text,),
                                ));
                          } else {
                            String? result =
                                await singUpcontroller.userSingUp();
                            if (result != null) {
                              showCustomSnackBar(context, result);
                            }
                            if (result == "success") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Loginpage(),
                                ),
                              );
                            }
                          }
                        },
                      )
                    ],
                  ),
                ))),
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
          )),
    );
  }
}
