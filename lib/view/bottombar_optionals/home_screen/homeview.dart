import 'package:doctor_appointment/constants/constants.dart';
import 'package:doctor_appointment/constants/consts.dart';
import 'package:doctor_appointment/controllers/home_controller.dart';
import 'package:doctor_appointment/view/bottombar_optionals/home_screen/categorytile.dart';
import 'package:doctor_appointment/view/bottombar_optionals/home_screen/doctorprofile_screen.dart';
import 'package:doctor_appointment/view/widgets/textformfeilds.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homeviewscreen extends StatelessWidget {
  const Homeviewscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeConteoller>(context);
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0.0,
          title: AppStyles.boldText(
            title: 'Welcome User',
            color: Colors.black,
          )),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(14),
            child: Row(
              children: [
                Expanded(
                    child: Custom_Textformfeild(
                  icon: Icons.person_3_rounded,
                  hinttext: 'Search Doctor',
                  textEditingController: homeController.SearchDoctorController,
                  borderColor: Colors.white,
                )),
                IconButton(onPressed: () {}, icon: Icon(Icons.search_rounded))
              ],
            ),
          ),
          CustomBox.height(20),
          Container(
            height: 60,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView.builder(
                // shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CategoryTile(
                    categoryImg: categoryimage[index],
                    categoryName: iconsTitleList[index],
                  );
                },
                itemCount: 5,
              ),
            ),
          ),
          CustomBox.height(10),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Align(
                alignment: Alignment.centerLeft,
                child: AppStyles.boldText(
                    title: 'Pupular Doctors',
                    color: AppColors.primary,
                    size: 18)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 250,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DoctorProfileScreen(),
                          ));
                    },
                    child: Container(
                      // clipBehavior: Clip.hardEdge,
                      // color: Colors.black54,
                      decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(15)),
                      margin: EdgeInsets.only(right: 8),
                      height: 100,
                      width: 150,
                      child: Column(
                        children: [
                          Container(
                              decoration:
                                  BoxDecoration(color: AppColors.primary),
                              // width: 150,
                              alignment: Alignment.center,
                              // color: Colors.blue,
                              child: Image.asset('assets/doctors.jpg')),
                          CustomBox.height(5),
                          Text(iconsTitleList[index]),
                          CustomBox.height(5),
                          Text(iconsTitleList[index])
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          CustomBox.height(5),
          GestureDetector(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Align(
                    alignment: Alignment.centerRight,
                    child: AppStyles.boldText(
                      size: 14,
                      title: 'view All',
                      color: Colors.black,
                    )),
                Icon(Icons.arrow_right)
              ],
            ),
          ),
          CustomBox.height(20),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                4,
                (index) => Container(
                  child: Column(
                    children: [
                      Icon(Icons.boy_rounded),
                      CustomBox.height(5),
                      Text(iconsTitleList[index])
                    ],
                  ),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(12)),
                ),
              ))
        ],
      ),
    );
  }
}
