import 'package:doctor_appointment/constants/constants.dart';
import 'package:doctor_appointment/constants/consts.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CategoryDetails extends StatelessWidget {
  const CategoryDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppStyles.boldText(
            title: "categoryName", color: Colors.black, size: 18),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 170,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8),
          itemCount: 5,
          itemBuilder: (context, index) {
            return Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(1), borderRadius: BorderRadius.circular(15)),
              margin: EdgeInsets.only(right: 8),
              height: 100,
              width: 150,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        // width: 150,
                        alignment: Alignment.center,
                        // color: AppColors.primary,
                        child: Image.asset(width: 100, 'assets/doctors.jpg')),
                    CustomBox.height(5),
                    Text(iconsTitleList[index]),
                    CustomBox.height(5),
                    VxRating(
                      selectionColor: Colors.yellow,
                      onRatingUpdate: (value) {},
                      maxRating: 5,
                      count: 5,
                      value: 4,
                      stepInt: true,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
