import 'package:doctor_appointment/constants/constants.dart';
import 'package:doctor_appointment/constants/consts.dart';
import 'package:doctor_appointment/view/bottombar_optionals/category_screen/categorydetails_screen.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
           automaticallyImplyLeading: false,
        elevation: 0.0,
        title: AppStyles.normalText(title: "Category", size: 18),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            mainAxisExtent: 170,
          ),
          itemCount: 2,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoryDetails(),
                    ));
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.primary),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          'assets/doctors.jpg',
                          width: 30,
                        )),
                    // Divider(color: Colors.white,),
                    CustomBox.height(20),
                    AppStyles.boldText(
                        title: index.toString(), color: Colors.white, size: 16),
                    CustomBox.height(10),
                    AppStyles.normalText(
                        title: "kjglk", color: Colors.white, size: 16),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
