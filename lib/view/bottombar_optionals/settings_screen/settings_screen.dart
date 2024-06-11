import 'package:doctor_appointment/constants/consts.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(
                   automaticallyImplyLeading: false,
        title: AppStyles.normalText(title: "kghdfj",size: 18,color: Colors.white),
        elevation: 0.0) ,
        body: Column(
          children: [
            ListTile(
              leading: CircleAvatar(child: Image.asset('jh'),),
              title: AppStyles.boldText(title: 'slkg'),
              subtitle: AppStyles.normalText(title: "kghdfj"),
            ),
            Divider() ,
            ListView(
              shrinkWrap: true,
              children: List.generate(3, (index) => ListTile(
                leading: Icon(Icons.abc_outlined),
              title: Text('kld'),
              subtitle: Text(index.toString()),
            ),),)

          ],
        ),
    );
  }
}