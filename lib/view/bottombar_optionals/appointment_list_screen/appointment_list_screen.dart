import 'package:doctor_appointment/constants/styles.dart';
import 'package:doctor_appointment/view/bottombar_optionals/appointment_list_screen/appointment_details_view.dart';
import 'package:flutter/material.dart';

class AppointmentsListScreen extends StatelessWidget {
  const AppointmentsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         automaticallyImplyLeading: false,
        title: AppStyles.boldText(
            title: 'Appointments', color: Colors.black, size: 29),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AppointmentsDetailsView(),
                  ));
              },
              leading: CircleAvatar(
                child: Image.asset('dlkj'),
              ),
              title: AppStyles.boldText(title: 'Doctor Name'),
              subtitle: AppStyles.normalText(
                  title: 'Appointment time', color: Colors.white),
              // trailing: ,
            );
          },
        ),
      ),
    );
  }
}
