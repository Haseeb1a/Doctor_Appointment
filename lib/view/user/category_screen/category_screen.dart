import 'dart:developer';

import 'package:doctor_appointment/constants/consts.dart';
import 'package:doctor_appointment/constants/strings.dart';
import 'package:doctor_appointment/controllers/user_controller/category_controller/category_controller.dart';
import 'package:doctor_appointment/controllers/user_controller/home_controller/home_controller.dart';
import 'package:doctor_appointment/view/user/category_screen/doctorprofile_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:lottie/lottie.dart';

import 'package:provider/provider.dart';

import '../../../../models/user_model.dart';
import 'categorytile.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeConteoller = Provider.of<HomeConteoller>(
      context,
    );
    final categoryController = Provider.of<CategoryController>(
      context,
    );
    // final userData = Provider.of<UserHomeConttoller>(
    //   context,
    // );
    // FirebaseServices().getBookingDetailss(userData.user!.id.toString());
    final Size screenSize = MediaQuery.of(context).size;
    log('dfljhjlhdjhkdhkjdfhgkdjghfhkccccccccccccccccccccccccccccccccccccccccccccccc');
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        backgroundColor: AppColors.primary,
        centerTitle: true,
        title: Consumer<CategoryController>(
          builder: (context, Professionalprovider, child) {
            return Professionalprovider.is_serched
                ? TextFormField(
                    controller: Professionalprovider.searchCetegryController,
                    onChanged: (value) {
                      Professionalprovider.getSearchedCategory(value);
                    },
                    decoration: InputDecoration(
                        hintText: 'Enter the categoty',
                        prefixIcon: IconButton(
                            onPressed: () {},
                            color: Color.fromARGB(255, 13, 43, 67),
                            // getData();

                            icon: const Icon(Icons.search)),
                        // prefixIcon: Icon(Icons.search),
                        filled: true,
                        fillColor: Colors.white, // Background color
                        contentPadding:
                            const EdgeInsets.all(12), // Adjust the padding
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 13, 43,
                                  67)), // Change the focused border color
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 13, 43,
                                  67)), // Change the enabled border color
                          borderRadius: BorderRadius.circular(10),
                        ),
                        suffixIcon: IconButton(
                            onPressed: () {
                              Professionalprovider.searchCetegryController
                                  .clear();
                            },
                            // onPressed: homepageconter.clearsearch,
                            icon: const Icon(
                              Icons.clear,
                              color: Colors.black,
                            ))),
                  )
                : Text(
                    'services',
                    style: TextStyle(color: AppColors.whiteColor),
                  );
          },
        ),
        actions: [
          Consumer<CategoryController>(
            builder: (context, professionalprovider, child) {
              return IconButton(
                  onPressed: () {
                    professionalprovider.searchCheking();
                    if (professionalprovider.is_serched == false) {
                      professionalprovider.getSearchedCategory('All');
                    }
                  },
                  icon: professionalprovider.is_serched
                      ? CircleAvatar(
                          radius: 17,
                          backgroundColor: Colors.black.withOpacity(0.3),
                          child: Icon(
                            Icons.close,
                            color: Colors.red,
                            size: 17,
                          ))
                      : CircleAvatar(
                          backgroundColor:
                              const Color.fromARGB(255, 255, 255, 255),
                          child: Icon(
                            Icons.search,
                            color: Color.fromARGB(255, 13, 43, 67),
                          ),
                        ));
            },
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 60,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView.builder(
                // shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Consumer<HomeConteoller>(
                    builder: (context, value, child) {
                      return CategoryTile(
                        categoryImg: categoryimage[index],
                        categoryName: iconsTitleList[index],
                        homeConteoller: categoryController,
                      );
                    },
                  );
                },
                itemCount: iconsTitleList.length,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
              child: Consumer<CategoryController>(
                builder: (context, value, child) {
                  return value.categoryDoctors.isEmpty
                      ? Align(
                          alignment: Alignment.topCenter,
                          child: Stack(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Align(
                                  alignment: Alignment.topCenter,
                                  child: Lottie.asset(
                                      'assets/Animation - 1718531961007.json')),
                              Positioned(
                                left: (screenSize.width / 2) - 70,
                                top: (screenSize.height / 2) - 50,
                                child: Text(
                                  'No Doctors Avaliable!',
                                  style: GoogleFonts.denkOne(
                                      color: AppColors.primary),
                                ),
                              )
                            ],
                          ),
                        )
                      // ? Center(
                      //    child: Column(
                      //      children: [
                      //       Text('No Doctor Availabe'),
                      //        SizedBox(
                      //         height: 300,
                      //         width: 300,
                      //         child: Lottie.asset('assets/Animation - 1718531961007.json')),
                      //      ],
                      //    ),
                      //   )
                      : ListView.builder(
                          itemCount: value.categoryDoctors.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DoctorProfileScreen(
                                        doctordetilas:
                                            value.categoryDoctors[index],

                                        // index: index,
                                        // doctordetilas: value.categoryDoctors[index],
                                      ),
                                    ));
                                value.getSearchedCategory('All');
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 5),
                                decoration: AppStyles.shadowDecoraion,
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 100,
                                            width: 100,
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                                child: Hero(
                                                    tag: 'posters',
                                                    child: value
                                                                .categoryDoctors[
                                                                    index]
                                                                .gender ==
                                                            "Male"
                                                        ? Image.asset(
                                                            'assets/doctors.jpg')
                                                        : Image.asset(
                                                            'assets/femaleDoctor-JzHZTDpCc-transformed (1).jpeg'))),
                                          ),
                                          SizedBox(
                                            width: 30,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                value.categoryDoctors[index]
                                                    .name,
                                                style: TextStyle(
                                                    color: Colors.green,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                value.categoryDoctors[index]
                                                    .category,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                value.categoryDoctors[index]
                                                    .place,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
  value.categoryDoctors[index].qualifications != null
      ? (value.categoryDoctors[index].qualifications.length > 16
          ? value.categoryDoctors[index].qualifications.substring(0, 16)
          : value.categoryDoctors[index].qualifications)
      : '',
  style: TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.bold,
  ),
),
                                            ],
                                          ),
                                          Spacer(),
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              value
                                                  .categoryDoctors[index].phone,
                                              style: TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          CircleAvatar(
                                              radius: 7,
                                              backgroundColor:
                                                  const Color.fromARGB(
                                                          255, 41, 28, 28)
                                                      .withOpacity(0.7),
                                              child: Icon(
                                                Icons.phone,
                                                color: Colors.yellow,
                                                size: 7,
                                              ))
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          // FutureBuilder<Map?>(
                                          //   future: FirebaseServices()
                                          //       .getSocialServicersAdditionaDetails(
                                          //     userData.user!.id.toString(),
                                          //     value.searchdata!.users![index].id
                                          //         .toString(),
                                          //   ), // Assuming getProfessionalActiveStatus is a function that returns a Future<bool>
                                          //   builder: (context,
                                          //       AsyncSnapshot<Map?> snapshot) {
                                          //     if (snapshot.connectionState ==
                                          //         ConnectionState.waiting) {
                                          //       // While waiting for the future to resolve
                                          //       return SizedBox(
                                          //         height: 60,
                                          //         width: 95,
                                          //       ); // Or any other loading indicator
                                          //     } else if (snapshot.hasError) {
                                          //       // If future throws an error
                                          //       return Text(
                                          //           'Error: ${snapshot.error}');
                                          //     } else {
                                          //       // When future has successfully resolved
                                          //       Map? likeData = snapshot.data;

                                          //       // Default to false if snapshot data is null
                                          //       return contents(
                                          //           value:
                                          //               likeData!['likecount']
                                          //                       .toString() ??
                                          //                   "0",
                                          //           text: 'Likes');
                                          //     }
                                          //   },
                                          // ),
                                          contents(
                                              value: value
                                                  .categoryDoctors[index]
                                                  .workingStartTime,
                                              text: 'Start'),
                                          contents(
                                              value: value
                                                  .categoryDoctors[index]
                                                  .workEndingTime,
                                              text: 'close'),
                                         Row(
                                            children: [
                                              Text(value.categoryDoctors[index].isActive? 'Active':"diactive"),
                                              Icon(
                                                IconlyBold.activity,
                                                color:value.categoryDoctors[index].isActive?Colors.green: Colors.red,
                                              ),
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                // color: Color.fromARGB(255, 255, 238, 206),
                              ),
                            );
                          },
                        );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class contents extends StatelessWidget {
  String value;
  String text;
  contents({
    required this.value,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 95,
      margin: const EdgeInsets.only(bottom: 16.0),
      // padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 5),
                color: Colors.black.withOpacity(0.09),

                //  .withOpacity(0.09),
                blurRadius: 10.0,
                spreadRadius: 4.0)
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            value,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Text(
            text,
            style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
