import 'package:doctor_appointment/consts/constants.dart';
import 'package:doctor_appointment/consts/consts.dart';
import 'package:doctor_appointment/controllers/home_controller.dart';
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
          elevation: 0.0,
          title: AppStyles.boldText(
            title: 'Welcome User',
            color: Colors.white,
          )),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(14),
            color: Colors.blue,
            child: Row(
              children: [
                Expanded(
                    child: Custom_Textformfeild(
                  hinttext: 'Search Doctor',
                  textEditingController: homeController.SearchDoctorController,
                  borderColor: Colors.white,
                )),
                IconButton(onPressed: () {}, icon: Icon(Icons.search_rounded))
              ],
            ),
          ),
          CustomConstant.sizedBox(20),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SizedBox(
                  height: 80,
                  child: ListView.builder(
                    physics:  BouncingScrollPhysics(),
                    itemCount: 6,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(15)),
                          margin: EdgeInsets.only(right: 8),
                          height: 44,
                          width: 44,
                          child: Column(
                            children: [
                              Image.asset(iconsList[index]),
                              CustomConstant.sizedBox(5),
                              Text(iconsTitleList[index])
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          CustomConstant.sizedBox(10),
            
                Align(alignment: Alignment.centerLeft,
                child: AppStyles.boldText(title: 'Pupular Doctors',color: Colors.blue,size: 18)
                 ),

           SizedBox(
                  height: 250,
                  child: ListView.builder(
                    physics:  BouncingScrollPhysics(),
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Container(
                          clipBehavior: Clip.hardEdge,
                          color: Colors.black54,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(15)),
                          margin: EdgeInsets.only(right: 8),
                          height: 100,
                          width: 150,
                          child: Column(
                            children: [
                              Container(
                                width: 150,
                                alignment: Alignment.center,
                                color: Colors.blue  ,
                                child: Image.asset(iconsList[index])),
                              CustomConstant.sizedBox(5),
                              Text(iconsTitleList[index]),
                               CustomConstant.sizedBox(5),
                              Text(iconsTitleList[index])
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                CustomConstant.sizedBox(5),
                GestureDetector(
                  onTap: () {
                    
                  },
                  child: Align(alignment: Alignment.centerRight,
                  child: AppStyles.normalText(title: 'view All',color: Colors.black,)
                   ),
                ),
         CustomConstant.sizedBox(20),
         Row(
mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(4, (index) => Container(
            child:Column(
                            children: [
                              Image.asset(iconsList[index]),
                              CustomConstant.sizedBox(5),
                              Text(iconsTitleList[index])
                            ],
                          ),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(12)
            ),
          ),)
         )

        ],
      ),
    );
  }
}
