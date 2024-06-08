import 'package:doctor_appointment/consts/consts.dart';
import 'package:doctor_appointment/controllers/signup_controller.dart';
import 'package:doctor_appointment/view/widgets/textformfeilds.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../consts/constants.dart';
import '../Login_screen/home_screen.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<SignupController>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          margin: EdgeInsets.only(top: 40),
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Image.asset('assets/doctorAppoinment (1).png'),
                ],
              ),
              CustomConstant.sizedBox(20),
              Expanded(
                flex: 2,
                child: Container(
                    child: Form(
                        child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Custom_Textformfeild(
                          hinttext: "Enter Your Name",
                          textEditingController:
                              homeController.emailController),
                      CustomConstant.sizedBox(20),
                      Custom_Textformfeild(
                          hinttext: "Enter Your Email",
                          textEditingController:
                              homeController.emailController),
                      CustomConstant.sizedBox(20),
                      Custom_Textformfeild(
                          hinttext: "Enter Your Password ",
                          textEditingController:
                              homeController.passwordController),
                      CustomConstant.sizedBox(20),
                      GestureDetector(
                        onTap: () {},
                        child: Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              AppStrings.forgetpassword,
                              style: TextStyle(color: Colors.blue),
                            )),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Your onPressed code here
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Color.fromARGB(255, 0, 0, 0),
                          backgroundColor: Colors.blue, // Text color
                        ),
                        child: Text('SignUp'),
                      ),
                      CustomConstant.sizedBox(20),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Loginpage(),
                              ));
                        },
                        child: Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              AppStrings.haveanAccount,
                              style: TextStyle(color: Colors.blue),
                            )),
                      ),
                    ],
                  ),
                ))),
              )
            ],
          )),
    );
  }
}
