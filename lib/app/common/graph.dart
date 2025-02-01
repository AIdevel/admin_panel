import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class LineChartSample extends StatelessWidget {
  const LineChartSample({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[ LineChart(
        LineChartData(
          gridData: FlGridData(show: false), // Hide grid lines
          titlesData: FlTitlesData(
            show: true,
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  // Only display the year labels on specific positions
                  if (value == 0) {
                    return const Text('2015', style: TextStyle(fontSize: 12, color: Colors.purple, fontWeight: FontWeight.w600));
                  } else if (value == 1) {
                    return const Text('2016', style: TextStyle(fontSize: 12, color: Colors.purple, fontWeight: FontWeight.w600));
                  } else if (value == 2) {
                    return const Text('2017', style: TextStyle(fontSize: 12, color: Colors.purple, fontWeight: FontWeight.w600));
                  } else if (value == 3) {
                    return const Text('2018', style: TextStyle(fontSize: 12, color: Colors.purple, fontWeight: FontWeight.w600));
                  } else if (value == 4) {
                    return const Text('2019', style: TextStyle(fontSize: 12, color: Colors.purple, fontWeight: FontWeight.w600));
                  } else if (value == 5) {
                    return const Text('2020', style: TextStyle(fontSize: 12, color: Colors.purple, fontWeight: FontWeight.w600));
                  }
                  return const Text(''); // Hide other values
                },
                reservedSize: 15, // Space for ticks on x-axis (adjust as needed)
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  // Only show the value if it's a multiple of 10
                  if (value % 10 == 0) {
                    return Text(value.toInt().toString(),style: TextStyle(fontSize: 12, color: Colors.purple, fontWeight: FontWeight.w600)); // Show multiples of 10 on y-axis
                  }
                  return const Text(''); // Hide other values
                },
                reservedSize: 20, // Space for ticks on y-axis
              ),
            ),
            topTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false), // Hide the top axis
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false), // Hide the right axis
            ),
          ),
          borderData: FlBorderData(
            show: true,
            border: Border(
              left: BorderSide(color: Colors.grey, width: 2),  // Left border
              bottom: BorderSide(color: Colors.grey, width: 2), // Bottom border
              top: BorderSide.none,   // No top border
              right: BorderSide.none, // No right border
            ),
          ),
          lineBarsData: [
            // Yearly Sales (represented with colorful lines)
            LineChartBarData(
              spots: [
                const FlSpot(0, 5), // 2015 sales
                const FlSpot(1, 10), // 2016 sales
                const FlSpot(2, 12), // 2017 sales
                const FlSpot(3, 14), // 2018 sales
                const FlSpot(4, 18), // 2019 sales
                const FlSpot(5, 10), // 2020 sales
              ],
              isCurved: true,
              color: Colors.purple, // Purple color for sales
              barWidth: 3,
              belowBarData: BarAreaData(show: true, color: Colors.purple.withOpacity(0.2)), // Purple shading
            ),

            // Yearly Projects (represented with another colorful line)
            LineChartBarData(
              spots: [
                const FlSpot(0, 3), // 2015 projects
                const FlSpot(1, 8), // 2016 projects
                const FlSpot(2, 12), // 2017 projects
                const FlSpot(3, 18), // 2018 projects
                const FlSpot(4, 25), // 2019 projects
                const FlSpot(5, 40), // 2020 projects
              ],
              isCurved: true,
              color: Colors.deepOrange, // Orange color for projects
              barWidth: 3,
              belowBarData: BarAreaData(show: true, color: Colors.deepOrange.withOpacity(0.2)), // Orange shading
            ),
          ],
          lineTouchData: LineTouchData(
            touchTooltipData: LineTouchTooltipData(
              getTooltipColor: (touchedSpot) => Colors.purple.shade100,
            ),
            touchCallback: (FlTouchEvent event, LineTouchResponse? response) {
              if (!event.isInterestedForInteractions ||
                  response == null ||
                  response.lineBarSpots == null) {
                return;
              }
              // Handle touch events here
            },
            handleBuiltInTouches: true,
          ),
        ),
      ),
        Positioned(
          right: 100, // Position text inside the left gap
     // Adjust the vertical positioning of the text
          child: Row(children: [ Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 7.w),
                height:Get.height * 0.01,
                width: Get.width * 0.01,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.deepOrange
                ),
              ),
              Text(
                'Pending \nDone',
                style: TextStyle(fontSize: 13, color: Colors.deepOrange,fontWeight: FontWeight.w600)
              ),
            ],
          ),
            SizedBox(width: 15.w,),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 7.w),
                  height:Get.height * 0.01,
                  width: Get.width * 0.01,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.purple
                  ),
                ),
                Text(
                    'Project \nDone',
                    style: TextStyle(fontSize: 13, color: Colors.purple,fontWeight: FontWeight.w600)
                ),
              ],
            ),
          ],),
        ),
        Positioned(left:60,child: Text(
            'Over All Performance\nThe Years',
            style: TextStyle(fontSize: 14, color: Colors.black,fontWeight: FontWeight.w600)
        ),)
    ],
    );
  }
}
