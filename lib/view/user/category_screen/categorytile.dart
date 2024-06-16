import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor_appointment/controllers/user_controller/category_controller/category_controller.dart';
import 'package:doctor_appointment/controllers/user_controller/home_controller/home_controller.dart';
import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  final String categoryImg;
  final String categoryName;
  CategoryController homeConteoller;

   CategoryTile({
    required this.categoryImg,
    required this.categoryName,
    required this.homeConteoller,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        homeConteoller.getSearchedCategory(categoryName);
        // Define what happens on tap
      },
      child: Container(
        // decoration: BoxDecoration(
        //     color: Colors.black.withOpacity(0.1),
        //     borderRadius: BorderRadius.circular(12)),
        width: 100,
        margin: EdgeInsets.only(right: 16,top:8),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6), // Adjust the border radius as needed
              child: Image.asset(
            categoryImg,
                fit: BoxFit.fill,
                width: 100,
                height: double.infinity,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(8),
                  // Optional: Add a background color for text contrast
                  child: Text(
                    categoryName,
                    style: TextStyle(
                      color: Colors
                          .black, // Changed text color for better contrast
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
