import 'package:doctor_appointment/view/user/appointment_list_screen/appointment_details_view.dart';
import 'package:flutter/material.dart';

import '../../models/user_appointment_model.dart';

class notificationCard extends StatelessWidget {
  List<AppointmentModel> appointmentDetails;
  int index;
  notificationCard(
      {super.key, required this.index, required this.appointmentDetails});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AppointmentsDetailsView(appointmentModel: appointmentDetails[index],),
              ));
        },
        child: Container(
          margin: EdgeInsetsDirectional.symmetric(vertical: 8),
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(
                15,
              ),
              border: Border.all()),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      // height: 10,
                      width: 70,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            15,
                          ),
                          border: Border.all(color: Colors.yellow)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              appointmentDetails[index]
                                  .time
                                  .substring(8, 10)
                                  .toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            Text(
                              appointmentDetails[index]
                                  .time
                                  .substring(5, 7)
                                  .toString(),
                              style: TextStyle(
                                  color: const Color.fromARGB(255, 0, 0, 0)),
                            ),
                            // Text(
                            //  appointmentDetails[index].doctorName,
                            //   style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black),
                            // ),
                            // Text('sdl',style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          appointmentDetails[index].doctorName,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        Text(
                          appointmentDetails[index].qualification,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      children: [
                        Text(
                          appointmentDetails[index].category,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
                Center(
                  child: SizedBox(
                    height: 30,
                    width: double.infinity,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: SizedBox(
                    //  minWidth: 100,

                    // onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          appointmentDetails[index].place,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        Text(
                          appointmentDetails[index]
                              .time
                              .substring(11, 16)
                              .toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                        // Icon(Icons.data_usage_outlined,color:booking!.bookings[index].status=="pending"? Colors.yellow:booking!.bookings[index].status=="canceled"?Colors.red:const Color.fromARGB(255, 0, 255, 8),size: 17)
                      ],
                    ),
                    // color: const Color.fromARGB(255, 0, 0, 0),
                    // shape: RoundedRectangleBorder(
                    //   borderRadius: BorderRadius.circular(
                    //       20.0), // Adjust the value as needed
                    //   side: const BorderSide(color: Colors.green),
                    // ),
                  ),
                )
              ],
            ),
          ),
          // leading: ClipRRect(
          //   borderRadius: BorderRadius.circular(10),
          //   child: Image.network(
          //       'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQNCc35VZxxHPVpw5t-M3kk-Pbp-L2tb6eqg&usqp=CAU'),
          // ),
          // title: Text('amalthev'),
          // subtitle: Text('lets talks'),
          // trailing: Icon(
          //   Icons.circle,
          // ),
        ),
      ),
    );
  }
}
