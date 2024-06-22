import 'package:doctor_appointment/constants/consts.dart';
import 'package:doctor_appointment/controllers/doctor_controller/doctor_bottom_controller.dart';
import 'package:doctor_appointment/controllers/doctor_controller/profile_edit_controller.dart';
import 'package:doctor_appointment/controllers/user_controller/bottom_controller.dart';
import 'package:doctor_appointment/view/dcotor/doctor_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../widgets/traspent_button.dart';

class DoctorProfileEdit extends StatefulWidget {
  @override
  _DoctorProfileEditState createState() => _DoctorProfileEditState();
}

class _DoctorProfileEditState extends State<DoctorProfileEdit> {
  final formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    final profilecontroller =
        Provider.of<DoctorProfileEditontroller>(context, listen: false);
    final doctordata =
        Provider.of<DoctorBottomController>(context, listen: false);
    profilecontroller.nameController.text = doctordata.currentDoctror!.name;
    profilecontroller.catagryController.text =
        doctordata.currentDoctror!.category;
    profilecontroller.placeController.text = doctordata.currentDoctror!.place;
    profilecontroller.aboutController.text = doctordata.currentDoctror!.about;
    profilecontroller.worktimeController.text =
        doctordata.currentDoctror!.workingTime;
    profilecontroller.phoneController.text = doctordata.currentDoctror!.phone;
    profilecontroller.qualificationController.text =
        doctordata.currentDoctror!.qualifications;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    final profilecontroller = Provider.of<DoctorProfileEditontroller>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 11),
          child: Column(
            children: [
              Stack(
                children: [
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 15, 43, 67),
                          borderRadius: BorderRadius.circular(15)),
                      width: double.infinity,
                      height: 185,
                    ),
                  ),
                  const SizedBox(
                    height: 250,
                  ),
                  Positioned(
                    bottom: 2,
                    right: (size / 2) - 90,
                    child: SizedBox(
                        height: 140,
                        width: 140,
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 4,
                                ),
                              ),
                              child: Consumer<DoctorBottomController>(
                                builder: (context, value, child) {
                                  return ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: value.currentDoctror!.gender ==
                                              "male"
                                          ? Image.asset('assets/doctors.jpg')
                                          : Image.asset(
                                              'assets/femaleDoctor-JzHZTDpCc-transformed (1).jpeg'));
                                },
                              ),
                            ),
                            Positioned(
                                bottom: 3,
                                right: 4,
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(5)),
                                    color: Colors.white.withOpacity(0.5),
                                  ),
                                  child: ClipRRect(
                                    child: Center(
                                        child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.edit,
                                        size: 18,
                                      ),
                                    )),
                                  ),
                                )),
                          ],
                        )),
                  ),
                  Positioned(
                      top: 30,
                      left: 20,
                      child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const TransparentButton(
                              icons: Icon(
                            Icons.chevron_left_outlined,
                            color: Colors.white,
                          )))),
                  Positioned(
                    bottom: 75,
                    right: 15,
                    child: StreamBuilder<bool>(
                      stream: profilecontroller.getActiveStatusStream(),
                      initialData: false,
                      builder: (context, snapshot) {
                        final isActive = snapshot.data ?? false;
                        return Column(
                          children: [
                            AppStyles.normalText(title: isActive==true?"Active":"noActive", size: 12,color: Colors.white),
                            Switch(
                              value: isActive,
                              onChanged: (value) {
                                profilecontroller.updateActiveStatus(
                                  value,
                                );
                              },
                            ),
                          ],
                        );
                      },
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Form(
                key: formkey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your username';
                        } else {
                          return null;
                        }
                      },
                      controller: profilecontroller.nameController,
                      decoration: InputDecoration(
                        counterText: '',
                        hintText: 'Username',
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 19,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your bio';
                        } else {
                          return null;
                        }
                      },
                      controller: profilecontroller.catagryController,
                      maxLines: 1,
                      decoration: InputDecoration(
                        counterText: '',
                        hintText: 'category',
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your job title';
                        } else {
                          return null;
                        }
                      },
                      controller: profilecontroller.qualificationController,
                      decoration: InputDecoration(
                        counterText: '',
                        hintText: 'Qualification',
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your job title';
                        } else {
                          return null;
                        }
                      },
                      controller: profilecontroller.aboutController,
                      decoration: InputDecoration(
                        counterText: '',
                        hintText: 'About',
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: profilecontroller.phoneController,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.length != 10) {
                          return 'Chcek Your number';
                        } else {
                          return null;
                        }
                      },
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(
                            10), // Limit to 10 characters
                      ],
                      decoration: InputDecoration(
                        counterText: '',
                        hintText: 'phone',
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your workingtime';
                        } else {
                          return null;
                        }
                      },
                      controller: profilecontroller.worktimeController,
                      decoration: InputDecoration(
                        counterText: '',
                        hintText: 'Working time',
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 65,
                      child: Consumer2<DoctorProfileEditontroller,
                              DoctorBottomController>(
                          builder: (context, value, bottomcontroller, child) {
                        return MaterialButton(
                          onPressed: () {
                            if (formkey.currentState!.validate()) {
                              value.editprofile();
                              bottomcontroller.getcurrentdoctor();

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DoctorBottomBar(),
                                  ));
                            }
                          },
                          color: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            side: BorderSide(color: AppColors.primary),
                          ),
                          child: const Text(
                            'SUBMIT',
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      }),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
