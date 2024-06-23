// import 'package:doctor_appointment/constants/styles.dart';
// import 'package:doctor_appointment/view/bottombar_optionals/appointment_list_screen/appointment_details_view.dart';
// import 'package:flutter/material.dart';

// class AppointmentsListScreen extends StatelessWidget {
//   const AppointmentsListScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//          automaticallyImplyLeading: false,
//         title: AppStyles.boldText(
//             title: 'Appointments', color: Colors.black, size: 17),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: ListView.builder(
//           itemCount: 4,
//           itemBuilder: (context, index) {
//             return ListTile(
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => AppointmentsDetailsView(),
//                   ));
//               },
//               leading: CircleAvatar(
//                 child: Image.asset('dlkj'),
//               ),
//               title: AppStyles.boldText(title: 'Doctor Name'),
//               subtitle: AppStyles.normalText(
//                   title: 'Appointment time', color: Colors.white),
//               // trailing: ,
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
import 'package:doctor_appointment/constants/colors.dart';
import 'package:doctor_appointment/constants/styles.dart';
import 'package:doctor_appointment/controllers/user_controller/appointment_list_controller.dart';
import 'package:doctor_appointment/controllers/user_controller/bottom_controller.dart';
import 'package:doctor_appointment/models/user_appointment_model.dart';
import 'package:doctor_appointment/view/widgets/custom_shimmer.dart';
import 'package:doctor_appointment/view/widgets/notication_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class AppointmentsListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bottomController = Provider.of<AppointmentListController>(context);
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          automaticallyImplyLeading: false,
          title: AppStyles.boldText(
              title: 'Appointments', color: Colors.white, size: 17),
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize
                .label, // Adjust this to TabBarIndicatorSize.tab if needed
            // indicatorColor: Colors.white,
            indicatorWeight: 4.0, // Set the height of the indicator
            indicatorPadding: EdgeInsets.only(
                bottom: 1.0), // Optional: padding around the indicator
            // unselectedLabelColor: Colors.white,
            indicatorColor: Colors.white,

            dividerColor: AppColors.whiteColor,
            unselectedLabelColor: Colors.white,
            tabs: [
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Pendings",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      IconlyBold.info_circle,
                      color: Colors.yellow.withOpacity(0.8),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Confirmed",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      IconlyBold.discovery,
                      color: Colors.green.withOpacity(0.8),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            AppointmentStatusList(
              bottomController: bottomController,
              status: "pending",
            ),

            // secondtab

            AppointmentStatusList(
              bottomController: bottomController,
              status: "confirmed",
            ),
            // Replace with your actual tab pages
          ],
        ),
      ),
    );
  }
}

class AppointmentStatusList extends StatelessWidget {
  final AppointmentListController bottomController;
  String status;
  AppointmentStatusList(
      {super.key, required this.bottomController, required this.status});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;
    return Expanded(
        child: FutureBuilder<List<AppointmentModel>>(
      future: bottomController.getAppoitmentdetails(status),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Custom_Shimmer(width: double.infinity, height: 140.0),
              )
            ],
          );
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Align(
            alignment: Alignment.topCenter,
            child: Stack(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 250,
                    width: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/empty_bookings-removebg-preview.png'),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: (screenSize.width / 2) - 70,
                  top: 30,
                  child: Text(
                    'No $status Yet',
                    style: GoogleFonts.denkOne(),
                  ),
                )
              ],
            ),
          );
        } else {
          final appointmentDetails = snapshot.data!;
          return ListView.builder(
            shrinkWrap: true,
            itemCount: appointmentDetails.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // Implement your onTap logic here
                },
                child: notificationCard(
                  authAuth: "user",
                  status: "pending",
                  
                  appointmentDetails: appointmentDetails,
                  index: index,
                ),
              );
            },
          );
        }
      },
    ));
  }
}
