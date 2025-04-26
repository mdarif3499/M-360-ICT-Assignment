import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ict_assignment/util/constants.dart';
import 'package:ict_assignment/view/home/view/item_add_screen.dart';
import '../../../util/user_securce_storage.dart';
import '../../auth/controller/auth_controller.dart';
import 'details_screen.dart';

class Language {
  final String name;
  final String flag; // Use asset path or emoji
  Language({required this.name, required this.flag});
}

class HomeScreen extends StatefulWidget {
  static const pageId = "/homeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserSecureStorageImpl preference = Get.find();
  AuthController _authCon = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9FCF9),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _HeaderSection(),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 24),
                      Text("My Places", style: TextStyle(fontSize: 16)),
                      SizedBox(height: 12),
                      InkWell(
                        onTap: (){
                          Get.toNamed(Details_Screen.pageId);
                        },
                        child: PlaceCard(
                            img: [
                              'assets/images/nmnm.png',
                              'assets/images/man_1.png',
                              'assets/images/nnnn.png',
                              'assets/images/nnn.png',
                            ],
                            title: "Home",
                            ppm: 652,
                            change: -13,
                            status: "Good",
                            people: 2),
                      ),
                      SizedBox(height: 16),
                      InkWell(
                        onTap: (){
                          Get.toNamed(Details_Screen.pageId);
                        },
                        child: PlaceCard(
                            img: [
                              'assets/images/nmas.png',
                              'assets/images/nnas.png',
                              'assets/images/nnaa.png',
                              'assets/images/nnnaa.png',
                              'assets/images/nnna.png',
                            ],
                            title: "Office",
                            ppm: 447,
                            change: -37,
                            status: "Healthy",
                            people: 47),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: activeColor,
        onPressed: () {
          Get.toNamed(ItemAddScreen.pageId);
        },
        child: const Icon(Icons.add, size: 32),
      ),
    );
  }
}

class _HeaderSection extends StatelessWidget {
  const _HeaderSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 206,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFE3F8EB), Color(0xFFDAFBE3)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Good Morning", style: TextStyle(color: Colors.grey)),
                    SizedBox(
                      height: 5,
                    ),
                    Text("Ahmed Ariyan",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 50,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'You are in a ',
                        style: TextStyle(color: Colors.grey),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'healthy',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
                          ),
                          TextSpan(
                            text: ' environment ',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 30),
                height: 100,
                width: 100,
                child: CircleAvatar(
                  radius: 32,
                  backgroundColor: Colors.blueGrey,
                  child: Image.asset(
                    "assets/images/madfdn.png",
                    height: 170,
                    width: 170,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class PlaceCard extends StatelessWidget {
  final String title;
  final int ppm;
  final int change;
  final String status;
  final int people;
  final List<String> img;

  PlaceCard({
    super.key,
    required this.title,
    required this.ppm,
    required this.change,
    required this.status,
    required this.people,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 135,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFFEFFFE),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Text(
                        "$ppm",
                        style:
                            const TextStyle(fontSize: 38, color: Colors.green),
                      ),
                      const SizedBox(width: 8),
                      Column(
                        children: [
                          Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 4, vertical: 2),
                              decoration: BoxDecoration(
                                color: activeColor,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "${change.abs()}%",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )),
                          Text(
                            "ppm",
                            style: const TextStyle(color: activeColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                ],
              )
            ],
          ),
          Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: activeColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(status,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 14),
              StackedAvatars(
                imageUrls: this.img,
              ),
              Text("View Details ▶",
                  style: TextStyle(
                      color: activeColor, fontWeight: FontWeight.bold))
            ],
          ),
        ],
      ),
    );
  }
}

class StackedAvatars extends StatelessWidget {
  final double size;
  final List<String> imageUrls;
  final int remainingCount;

  const StackedAvatars({
    super.key,
    required this.imageUrls,
    this.size = 40,
    this.remainingCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size +
          (imageUrls.length + (remainingCount > 0 ? 1 : 0) - 1) * (size * 0.5),
      child: Stack(
        children: [
          ...List.generate(imageUrls.length, (index) {
            return Positioned(
              left: index * size * 0.4,
              child: CircleAvatar(
                radius: size / 2,
                backgroundImage: AssetImage(imageUrls[index]),
              ),
            );
          }),
          if (remainingCount > 0)
            Positioned(
              left: imageUrls.length * size * 0.6,
              child: CircleAvatar(
                radius: size / 2,
                backgroundColor: Colors.grey.shade300,
                child: Text(
                  '+$remainingCount',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
