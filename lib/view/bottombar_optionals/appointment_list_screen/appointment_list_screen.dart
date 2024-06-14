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
import 'package:doctor_appointment/constants/styles.dart';
import 'package:doctor_appointment/controllers/bottom_controller.dart';
import 'package:doctor_appointment/models/user_appointment_model.dart';
import 'package:doctor_appointment/view/widgets/notication_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppointmentsListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bottomController = Provider.of<BottomController>(context);
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: AppStyles.boldText(
              title: 'Appointments', color: Colors.black, size: 17),
          bottom: TabBar(
            tabs: [
              Tab(text: "Pending", icon: Icon(Icons.av_timer_outlined)),
              Tab(text: "Confirmed", icon: Icon(Icons.recommend_sharp)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: bottomController.appointmentDetails.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // if (bookingdetails.firebooking!.bookings[index].status ==
                      //     "confirmed") {
                      //   Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //         builder: (context) => userBookinDetailPage(
                      //             bookingDetails: bookingdetails.firebooking!,
                      //             index: index),
                      //       ));
                      // }
                    },
                    child: notificationCard(
                      appointmentDetails: bottomController.appointmentDetails,
                      index: index,
                    ),
                  );
                },
              ),
            ),

            // secondtab
            Container(),

            // Replace with your actual tab pages
          ],
        ),
      ),
    );
  }
}
