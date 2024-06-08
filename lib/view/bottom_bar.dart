
import 'package:doctor_appointment/controllers/bottom_controller.dart';
import 'package:doctor_appointment/view/homeview/homeview.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class BottomBar extends StatelessWidget {
  BottomBar({super.key});
  final List<Widget> bottomBarBarPages = [
  Homeviewscreen()
  ];

  @override
  Widget build(BuildContext context) {
    final bottombarControlldata = Provider.of<BottomController>(context);
    // Provider.of<Homecontroller>(context, listen: false).fecthDonorDatas();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: bottomBarBarPages[bottombarControlldata.currentIndex],
        bottomNavigationBar: FloatingNavbar(

            // iconSize: 30,
            // itemBorderRadius: 10,
            selectedBackgroundColor:  Colors.black,
            backgroundColor: Color.fromARGB(255, 27, 27, 27),
            onTap: (int val) {
              bottombarControlldata.changer(val);
            },
            currentIndex: bottombarControlldata.currentIndex,
            elevation: 10,
               selectedItemColor: Colors.white,
               unselectedItemColor: Colors.black,
            items: [
              FloatingNavbarItem(icon: Icons.ads_click_rounded, title: 'Home'),
              FloatingNavbarItem(
                icon: Icons.history,
                title: 'C',
              ),
            ]),
      ),
    );
  }
}
