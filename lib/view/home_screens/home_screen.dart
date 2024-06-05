import 'package:doctor_appointment/controllers/home_conteoller.dart';
import 'package:doctor_appointment/view/widgets/textformfeilds.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeConteoller>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  color: Colors.red,
                  child: Icon(Icons.water_drop),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                    child: Form(
                        child: Column(
                  children: [
                    Custom_Textformfeild(
                        hinttext: "Enter Your ",
                        textEditingController: homeController.emailcontroller)
                  ],
                ))),
              )
            ],
          )),
    );
  }
}
