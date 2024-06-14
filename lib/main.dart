import 'package:doctor_appointment/controllers/appointment_controller.dart';
import 'package:doctor_appointment/controllers/auth_controller/doctor_singupcontroller.dart';
import 'package:doctor_appointment/controllers/bottom_controller.dart';
import 'package:doctor_appointment/controllers/category_controller/category_controller.dart';
import 'package:doctor_appointment/controllers/home_controller.dart';
import 'package:doctor_appointment/controllers/auth_controller/login_conteoller.dart';
import 'package:doctor_appointment/controllers/auth_controller/signup_controller.dart';
import 'package:doctor_appointment/controllers/settings_controller/settings_controller.dart';
import 'package:doctor_appointment/firebase_options.dart';
import 'package:doctor_appointment/view/auth/auth_gate.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginConteoller(),
        ),
        ChangeNotifierProvider(
          create: (context) => SignupController(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeConteoller(),
        ),
        ChangeNotifierProvider(
          create: (context) => BottomController(),
        ),
        ChangeNotifierProvider(
          create: (context) => AppointmentController(),
        ),
        ChangeNotifierProvider(
          create: (context) => SettingsController(),
        ),
         ChangeNotifierProvider(
          create: (context) => CategoryController(),
        ),
         ChangeNotifierProvider(
          create: (context) => DoctorSingupcontroller(),
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const AuthGate()),
    );
  }
}
