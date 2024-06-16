import 'package:doctor_appointment/view/auth/Login_screen/login_screen.dart';
import 'package:doctor_appointment/view/user/user_bottom_bar.dart';
import 'package:doctor_appointment/view/user/category_screen/category_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../services/authservices.dart';
import '../dcotor/doctor_bottom_bar.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  Future<String?> getUserRole() async {
    // Assuming AuthServices().getErrorType('auth') is an async method that fetches user role
    return await AuthServices().sharedChecker('auth');
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('${snapshot.error}'),
          );
        } else if (snapshot.hasData) {
          // User is signed in
          return FutureBuilder(
            future: getUserRole(),
            builder: (context, AsyncSnapshot<String?> roleSnapshot) {
              if (roleSnapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (roleSnapshot.hasError) {
                return Center(
                  child: Text('${roleSnapshot.error}'),
                );
              } else if (roleSnapshot.hasData) {
                // Check the user role and navigate accordingly
                if (roleSnapshot.data == "doctors") {
                  return DoctorBottomBar();
                } else {
                  return UserbottomBar();
                }
              } else {
                return const Loginpage();
              }
            },
          );
        } else {
          // User is not signed in
          return const Loginpage();
        }
      },
    );
  }
}
