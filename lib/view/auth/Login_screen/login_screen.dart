import 'dart:developer';

import 'package:doctor_appointment/constants/consts.dart';
import 'package:doctor_appointment/controllers/auth_controller/login_conteoller.dart';
import 'package:doctor_appointment/view/auth/signup_page/signup_screen.dart';
import 'package:doctor_appointment/view/user/user_bottom_bar.dart';
import 'package:doctor_appointment/view/dcotor/doctor_bottom_bar.dart';
import 'package:doctor_appointment/view/widgets/custom_snackbar.dart';
import 'package:doctor_appointment/view/widgets/textformfeilds.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../constants/constants.dart';
import '../../../services/authservices.dart';
import '../../widgets/custom_botton.dart';
import '../../user/category_screen/category_screen.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    final loginConteoller = Provider.of<LoginConteoller>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Container(
        margin: EdgeInsets.only(top: 40),
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(
                  width: 300,
                  child: Lottie.asset('assets/Animation - 1718086269314.json'),
                ),
              ],
            ),
            CustomBox.height(20),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Custom_Textformfeild(
                          hinttext: "Enter Your Email",
                          unvaildText: "Enter The valid Email",
                          textEditingController:
                              loginConteoller.emailController,
                          icon: Icons.email,
                        ),
                        CustomBox.height(20),
                        Custom_Textformfeild(
                          hinttext: "Enter Your Password",
                          unvaildText: "Enter The Valid Password",
                          textEditingController:
                              loginConteoller.passwordController,
                          icon: Icons.lock,
                        ),
                        CustomBox.height(20),
                        GestureDetector(
                          onTap: () {},
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              AppStrings.forgetpassword,
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ),
                        CustomBox.height(20),
                        CustomButton(
                          text: 'Login',
                          onPressed: () async {
                            String? result =
                                await loginConteoller.loginSerivces();

                            String? error =
                                await AuthServices().sharedChecker('error');
                                 log(result.toString());
                            if (result == "doctors") {
                              log('YsysYsYsYsyYsysyys');
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DoctorBottomBar(),
                                ),
                              );
                            } else if (result == "user") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UserbottomBar(),
                                ),
                              );
                            } else {
                              showCustomSnackBar(context, error.toString());
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignupScreen(),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    AppStrings.dontHaveAccount,
                    style: TextStyle(color: Color.fromARGB(255, 0, 107, 194)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
