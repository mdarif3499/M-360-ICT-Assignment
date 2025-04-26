import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ict_assignment/util/constants.dart';
import 'package:ict_assignment/view/home/view/result_screen.dart';

class ItemAddScreen extends StatefulWidget {
  static const pageId = "/itemAddScreen";

  @override
  _ItemAddScreenState createState() => _ItemAddScreenState();
}

class _ItemAddScreenState extends State<ItemAddScreen> {
  final Map<String, int> data = {
    'Total number of people': 52,
    'Total number of rooms': 7,
    'Total area (sqft.)': 3700,
    'Total AC': 5,
    'Total Refrigerator': 2,
    'Total Computers': 60,
    'Total Indoor Plants': 23,
    'Total Kitchen Burner': 2,
  };

  void _increment(String key) {
    setState(() {
      data[key] = data[key]! + 1;
    });
  }

  void _decrement(String key) {
    setState(() {
      if (data[key]! > 0) {
        data[key] = data[key]! - 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
          child: Column(
            children: [
              InkWell(
                onTap: (){
                  Get.back();
                },
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(Icons.arrow_back_ios_new),
                ),
              ),
              SizedBox(height: 26),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 52,
                        width: 52,
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: backGroundColora,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 50,
                              offset: Offset(6, 6),
                            )
                          ],
                        ),
                        child: Image.asset(
                          "assets/images/bbbr.png",
                          height: 28,
                          width: 28,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          Text(
                            'Office',
                            style: TextStyle(fontSize: 22, color: Colors.grey),
                          ),
                          Container(
                            width: 88,
                            height: 2,
                            color: Colors.grey,
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 64),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildIconButton(name: "Total number of people"),
                      SizedBox(
                        height: 30,
                      ),
                      _buildIconButton(name: "Total number of rooms"),
                      SizedBox(
                        height: 30,
                      ),
                      _buildIconButton(name: "Total area (sqft.)"),
                      SizedBox(
                        height: 30,
                      ),
                      _buildIconButton(name: "Total AC"),
                      SizedBox(
                        height: 30,
                      ),
                      _buildIconButton(name: "Total Refrigerator"),
                      SizedBox(
                        height: 30,
                      ),
                      _buildIconButton(name: "Total Computers"),
                      SizedBox(
                        height: 30,
                      ),
                      _buildIconButton(name: "Total Indoor Plants"),
                      SizedBox(
                        height: 30,
                      ),
                      _buildIconButton(name: "Total Kitchen Burner"),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 25),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(CarbonDioxideScreen.pageId);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: activeColors,
                  minimumSize: Size(double.infinity, 42),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                ),
                child: Text(
                  'Calculate Carbon Emission',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconButton({counter, name, onPressed}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
            flex: 8,
            child: Row(
              children: [
                Icon(Icons.circle, size: 22, color: activeColors),
                SizedBox(width: 8),
                Text(
                  "${name}",
                  style: TextStyle(fontSize: 16),
                )
              ],
            )),
        Expanded(
            flex: 1,
            child: InkWell(
              onTap: () {
                _decrement(name);
              },
              child: Container(
                  decoration: BoxDecoration(
                    color: offWhite,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Icon(
                    Icons.remove,
                    size: 25,
                    color: Colors.grey,
                  )),
            )),
        Expanded(
            flex: 3,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                "${data[name]}",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            )),
        Expanded(
            flex: 1,
            child: InkWell(
              onTap: () {
                _increment(name);
              },
              child: Container(
                  decoration: BoxDecoration(
                    color: offWhite,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Icon(
                    Icons.add,
                    size: 25,
                    color: Colors.grey,
                  )),
            )),
      ],
    );
  }
}
