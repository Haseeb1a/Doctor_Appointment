import 'package:doctor_appointment/controllers/home_controller.dart';
import 'package:doctor_appointment/controllers/login_conteoller.dart';
import 'package:doctor_appointment/controllers/signup_controller.dart';
import 'package:doctor_appointment/view/auth/Login_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginConteoller(),),
         ChangeNotifierProvider(create: (context) => SignupController(),),
         ChangeNotifierProvider(create: (context) => HomeConteoller(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
      
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Loginpage()
      ),
    );
  }
}

