import 'package:doctor_appointment/constants/constants.dart';
import 'package:doctor_appointment/constants/consts.dart';
import 'package:doctor_appointment/controllers/category_controller/category_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../widgets/traspent_button.dart';

class CategoryDetails extends StatelessWidget {
  const CategoryDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryController = Provider.of<CategoryController>(context);
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TransparentButton(
            icons: Icon(Icons.chevron_left_outlined),
            onPressed: () {
              Navigator.pop(context);

              categoryController.clearCategory();
            },
            color: AppColors.primary,
          ),
        ),
        title: AppStyles.boldText(
            title: categoryController.categorisedDoctors[0].name,
            color: Colors.black,
            size: 18),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<CategoryController>(
          builder: (context, doctordatas, child) {
            return doctordatas.categorisedDoctors.isEmpty?Text('') :GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 170,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8),
              itemCount: doctordatas.categorisedDoctors.length,
              itemBuilder: (context, index) {
                return Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(1),
                      borderRadius: BorderRadius.circular(15)),
                  margin: EdgeInsets.only(right: 8),
                  height: 100,
                  width: 150,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          color: AppColors.lightGrey,
                          child: Image.asset(
                            'assets/doctors.jpg',
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 100, // Adjust the height as necessary
                          ),
                        ),
                        CustomBox.height(5),
                        Text(categoryController.categorisedDoctors[index].name),
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
              );
          },
        ),
      ),
    );
  }
}
