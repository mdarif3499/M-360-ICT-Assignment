import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ict_assignment/util/constants.dart';

import 'home_screen.dart';

class Details_Screen extends StatelessWidget {
  static const pageId = "/details_Screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child:
                              Icon(Icons.arrow_back_ios, color: Colors.grey)),
                      Icon(Icons.home, color: activeColors),
                      SizedBox(width: 8),
                      Text('Home',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 3),
                    decoration: BoxDecoration(
                      color: activeColors,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text('Good',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Text(
                          "652",
                          style: const TextStyle(
                              fontSize: 38, color: Colors.green),
                        ),
                        const SizedBox(width: 8),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 4, vertical: 2),
                                decoration: BoxDecoration(
                                  color: activeColors,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      "13%",
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )),
                            Padding(
                              padding: const EdgeInsets.only(left: 8, top: 1),
                              child: Text(
                                "ppm",
                                style:
                                    TextStyle(color: activeColor, fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Icon(
                              Icons.arrow_drop_down,
                              size: 35,
                              color: activeColorss,
                            ),
                          ),
                          Row(
                            children: List.generate(5, (index) {
                              Color color;
                              switch (index) {
                                case 0:
                                  color = Colors.indigoAccent;
                                  break;
                                case 1:
                                  color = Colors.red;
                                  break;
                                case 2:
                                  color = activeColorss;
                                  break;
                                case 3:
                                  color = Colors.yellow;
                                  break;
                                default:
                                  color = Colors.orange;
                              }
                              return Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(right: 4),
                                  height: 8,
                                  color: color,
                                ),
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('History',
                      style: TextStyle(fontSize: 18, color: Colors.grey)),
                  Row(
                    children: [
                      Text(
                        "See all",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Icon(
                        Icons.arrow_right,
                        color: Colors.grey,
                        size: 30,
                      )
                    ],
                  )
                ],
              ),
              SizedBox(height: 16),
              Container(
                width: double.infinity,
                height: 180,
                color: Colors.green,
                child: Center(child: CustomMonthChart()),
              ),
              SizedBox(height: 24),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                height: 150,
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: backGroundColora,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 50,
                                      offset: Offset(6, 6),
                                    )
                                  ],
                                ),
                                child: Center(
                                  child: Column(
                                    children: [
                                      Text(
                                        'Persons',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 28,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      StackedAvatars(
                                        imageUrls: [
                                          'assets/images/nmnm.png',
                                          'assets/images/man_1.png',
                                          'assets/images/nnnn.png',
                                          'assets/images/nnn.png',
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 25,),
                            Expanded(
                              flex: 1,
                              child: Container(
                                height: 150,
                                padding:
                                    EdgeInsets.only(top: 15, left: 10, right: 10),
                                decoration: BoxDecoration(
                                  color: activeColorss,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 50,
                                      offset: Offset(6, 6),
                                    )
                                  ],
                                ),
                                child: Center(
                                  child: Column(
                                    children: [
                                      Text(
                                        'Rooms',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 28,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '5',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 58,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        height: 20,
                                        padding: EdgeInsets.only(left: 6,right: 5),
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: backGroundColora,
                                          borderRadius: BorderRadius.circular(20),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black12,
                                              blurRadius: 50,
                                              offset: Offset(6, 6),
                                            )
                                          ],
                                        ),
                                        child: Text("2 of them requires action",style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: activeColor
                                        ),),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Container(
                          height: 150,
                          padding: EdgeInsets.only(left: 20),
                          decoration: BoxDecoration(
                            color: backGroundColora,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 50,
                                offset: Offset(6, 6),
                              )
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Plants',
                                      style: TextStyle(
                                          color: activeColor,
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      height: 50,
                                      width: 50,
                                      child: Image.asset("assets/images/leaves.png",)
                                      ,
                                    )

                                  ],
                                ),
                              ),


                              Expanded(
                                flex: 1,
                                child: Container(
                            height: double.infinity,
                                  decoration: BoxDecoration(
                                    color: activeColorss,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 50,
                                        offset: Offset(6, 6),
                                      )
                                    ],
                                  ),
                                  child: Center(
                                    child: Text(
                                      '43',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 97,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),




                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard(String title, Widget content) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 12),
          content,
        ],
      ),
    );
  }
}

class CustomMonthChart extends StatelessWidget {
  // Data points for each month: Oct → Apr (7 months shown)
  final List<double> monthlyData = [0.2, 5.0, 6.1, 3.8, 4.5, 5.2, 4.9];

  // Custom order of months
  final List<String> monthLabels = [
    'Oct',
    'Nov',
    'Dec',
    'Jan',
    'Feb',
    'Mar',
    'Apr'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(0.0),
        child: LineChart(
          LineChartData(
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 1,
                  getTitlesWidget: (value, meta) {
                    if (value >= 0 && value < monthLabels.length) {
                      return Text(monthLabels[value.toInt()]);
                    } else {
                      return Text('');
                    }
                  },
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false, interval: 1),
              ),
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles:
                  AxisTitles(sideTitles: SideTitles(showTitles: false)),
            ),
            minY: 0,
            maxY: 10,
            gridData: FlGridData(
              show: true,
              drawHorizontalLine: false,
              drawVerticalLine: true,
              getDrawingVerticalLine: (value) {
                return FlLine(
                  color: activeColorss, // 🎨 Set your color here
                  strokeWidth: 1, // Optional: thickness of the line
                );
              },
            ),
            borderData: FlBorderData(
              show: true,
              border: Border.all(
                color: Colors.grey, // 🎨 Set your desired border color
                width: 1, // Optional: border thickness
              ),
            ),
            lineBarsData: [
              LineChartBarData(
                spots: List.generate(
                  monthlyData.length,
                  (index) => FlSpot(index.toDouble(), monthlyData[index]),
                ),
                isCurved: true,
                color: activeColorss,
                barWidth: 1,
                dotData: FlDotData(show: true),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
