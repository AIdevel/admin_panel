import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Calender extends StatelessWidget {
  const Calender({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      width: Get.width *0.18,
      height: Get.height* 0.38,
      child:   HeatMapCalendar(
        showColorTip: false,
        borderRadius: 15.r,
        textColor: Colors.black,
        size: 10.sp,
          defaultColor: Colors.white,
          flexible: true,
          colorMode: ColorMode.color,
          datasets: {
            DateTime(2025, 1, 6): 3,
            DateTime(2025, 1, 7): 7,
            DateTime(2025, 1, 8): 10,
            DateTime(2025, 2, 27): 13,
            DateTime(2025, 2, 30): 13,
          },
          colorsets: const {
            13: Colors.purple,
          },
          onClick: (value) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value.toString())));
          },
        ),
    );
  }
}
