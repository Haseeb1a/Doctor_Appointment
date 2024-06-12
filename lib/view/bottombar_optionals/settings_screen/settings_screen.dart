import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment/constants/consts.dart';
import 'package:doctor_appointment/controllers/auth_controller/login_conteoller.dart';
import 'package:doctor_appointment/controllers/settings_controller/settings_controller.dart';
import 'package:doctor_appointment/controllers/settings_controller/settings_controller.dart';
import 'package:doctor_appointment/view/auth/Login_screen/login_screen.dart';
import 'package:doctor_appointment/view/bottombar_optionals/settings_screen/settings_tiles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsController = Provider.of<SettingsController>(context);
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: AppStyles.normalText(
              title: "kghdfj", size: 18, color: Colors.white),
          elevation: 0.0),
      body: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              child: Image.asset('jh'),
            ),
            title: AppStyles.boldText(title: 'slkg'),
            subtitle: AppStyles.normalText(title: "kghdfj"),
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
