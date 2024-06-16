import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:doctor_appointment/constants/colors.dart';
import 'package:doctor_appointment/controllers/user_controller/bottom_controller.dart';
import 'package:doctor_appointment/view/user/appointment_list_screen/appointment_list_screen.dart';
import 'package:doctor_appointment/view/user/category_screen/category_screen.dart';
import 'package:doctor_appointment/view/user/home_screen/homeview.dart';
import 'package:doctor_appointment/view/user/settings_screen/settings_screen.dart';
import 'package:doctor_appointment/view/user/category_screen/category_screen.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import 'package:provider/provider.dart';

class UserbottomBar extends StatelessWidget {
  UserbottomBar({super.key});
  final List<Widget> pages = [
    Homeviewscreen(),
    // ProfessionalPage(),
    CategoryScreen(),
    AppointmentsListScreen(),
    SettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    final bottomBarprovider = Provider.of<BottomController>(context);
    // Provider.of<Homecontroller>(context, listen: false).fecthDonorDatas();

    return  Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 2, left: 3, right: 3),
        child: BottomBarDefault(
          items:  [
            TabItem(
              icon: IconlyBold.home,
              title: 'Home',
            ),
            TabItem(
              icon: IconlyBold.category,
              title: 'Category',
            ),
            TabItem(
              icon: Icons.library_books_rounded,
              title: 'Appointment',
            ),
            TabItem(
              icon: IconlyBold.setting,
              title: 'Settings',
            ),
          ],
          enableShadow: true,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(13),
              topRight: Radius.circular(13),
      ),
          animated: true,
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          color: const Color.fromARGB(255, 65, 65, 65),
          colorSelected: AppColors.primary,
          indexSelected: bottomBarprovider
          .currentIndex,

          paddingVertical: 10,
          onTap:bottomBarprovider.changeIndex// function to chnage the index
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: pages.elementAt(bottomBarprovider
      .currentIndex),
    );
  }
}
