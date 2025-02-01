import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RatingBar extends StatelessWidget {
  final double rating; // Rating value, e.g., 4.5 out of 5
  // Maximum rating, e.g., 5.0

  const RatingBar({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    double percentage = rating / 5.0; // Calculate the percentage of the rating

    return Container(
      width: 40.0.w, // Set the width of the rating bar
      height: 10.0.h, // Set the height of the rating bar
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0), // Rounded corners (optional)
        color: Colors.grey[300], // Background color (empty portion)
      ),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 40 * percentage, // Fill the bar according to the rating
              height: 10.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0), // Optional rounded corners
                color: Colors.indigo, // Fill color (e.g., for filled portion)
              ),
            ),
          ),
        ],
      ),
    );
  }
}
