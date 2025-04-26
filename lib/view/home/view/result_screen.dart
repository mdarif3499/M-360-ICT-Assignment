import 'package:flutter/material.dart';

import '../../../util/constants.dart';

class CarbonDioxideScreen extends StatelessWidget {
  static const pageId = "/carbonDioxideScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FCF9),
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back button
              IconButton(
                icon: Icon(Icons.arrow_back_ios,color: Colors.grey,),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 20),

              // CO2 ppm text
              Center(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "1300",
                          style: TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.w300,
                            color: Colors.redAccent,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "ppm",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.red,
                            fontWeight: FontWeight.w300,

                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 30,right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 100),
                            child: Icon(
                              Icons.arrow_drop_down,
                              size: 35,
                              color: Colors.red,
                            ),
                          ),
                          Row(
                            children:[
                               Expanded(flex:1 ,
                                child: Container(
                                  margin: EdgeInsets.only(right: 6),
                                  height: 8,
                                  color:Colors.indigoAccent ,
                                ),
                              ),
                              SizedBox(width: 6,),

                              Expanded(flex:1 ,
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 6),
                                      height: 8,
                                      color:Colors.red ,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 6,),

                              Expanded(flex:1 ,
                                child: Container(
                                  margin: EdgeInsets.only(right: 6),
                                  height: 8,
                                  color:activeColorss,
                                ),
                              ),
                               SizedBox(width: 6,),
                               Expanded(flex:1 ,
                                child: Container(
                                  margin: EdgeInsets.only(right: 6),
                                  height: 8,
                                  color:Colors.yellow ,
                                ),
                              )       ,
                              SizedBox(width: 6,),
                               Expanded(flex:1 ,
                                child: Container(
                                  margin: EdgeInsets.only(right: 6),
                                  height: 8,
                                  color:Colors.orange ,
                                ),
                              )
                            ,]
                          ),
                        ],
                      ),
                    ),

                     SizedBox(height: 30),
                    Container(
                      margin: EdgeInsets.only(right: 5),
                      alignment: Alignment.topLeft,
                      child: RichText(
                        text: TextSpan(
                          text: 'Very Unhealthy: ',
                          style: TextStyle(fontSize: 16, color: Colors.red,fontWeight: FontWeight.bold),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'world Your office is emitting a lot of Carbon Dioxide',
                              style: TextStyle(fontWeight: FontWeight.normal,color: grey_light,fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // Plant suggestion card
              Container(
                padding:  EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [

                    Container(
                      height: 46,
                      width: 46,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: green_lights,
                        borderRadius: BorderRadius.circular(30), // <- Rounded corners
                      ),
                      child: Image.asset("assets/images/leaves.png", fit: BoxFit.cover,),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Plant",
                      style: TextStyle(
                        color: activeColors,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "189 indoor plants",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Your office emits 2549ppm Carbon dioxide everyday",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Progress bar
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Planded",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "23/189",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[700],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        LinearProgressIndicator(

                          value: 23 / 189,
                          backgroundColor: Colors.grey[300],
                          valueColor:
                              AlwaysStoppedAnimation<Color>(activeColors),
                          minHeight: 10,

                        ),
                         SizedBox(height: 8),

                      ],
                    ),
                  ],
                ),
              ),
              Spacer(),

              // Done button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: activeColor,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Done",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
