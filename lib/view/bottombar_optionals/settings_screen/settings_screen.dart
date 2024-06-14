import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment/constants/consts.dart';
import 'package:doctor_appointment/controllers/auth_controller/login_conteoller.dart';
import 'package:doctor_appointment/controllers/settings_controller/settings_controller.dart';
import 'package:doctor_appointment/controllers/settings_controller/settings_controller.dart';
import 'package:doctor_appointment/view/auth/Login_screen/login_screen.dart';
import 'package:doctor_appointment/view/bottombar_optionals/settings_screen/settings_tiles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/custom_shimmer.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsController = Provider.of<SettingsController>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: AppStyles.boldText(title: "Settings"),
        elevation: 0.0,
      ),
      body: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              child: Image.asset('jh'),
            ),
            title: Consumer<SettingsController>(
              builder: (context, settingsController, child) {
                return settingsController.userDetails?.username == null ||
                        settingsController.userDetails!.username.isEmpty
                    ? Custom_Shimmer(
                        height: 20,
                        width: 100,
                      )
                    : AppStyles.boldText(
                        title: settingsController.userDetails!.username,
                        size: 18,
                        color: Colors.black,
                      );
              },
            ),
            subtitle: Consumer<SettingsController>(
              builder: (context, settingsController, child) {
                return settingsController.userDetails?.email == null ||
                        settingsController.userDetails!.email.isEmpty
                    ? Custom_Shimmer(
                        height: 20,
                        width: 300,
                      )
                    : AppStyles.boldText(
                        title: settingsController.userDetails!.email,
                        size: 18,
                        color: Colors.black,
                      );
              },
            ),
          ),
          Divider(),
          SettingsTile(
            icon: Icon(
              Icons.lock_open_outlined,
            ),
            text: "forget password",
            onPressed: () {},
          ),
          SettingsTile(
            icon: Icon(
              Icons.bookmark_added,
            ),
            text: "tearm and conditions",
            onPressed: () {},
          ),
          SettingsTile(
            icon: Icon(Icons.logout),
            text: "logout",
            onPressed: () async {
              await settingsController.userLogout();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Loginpage(),
                  ));
            },
          )
        ],
      ),
    );
  }
}

