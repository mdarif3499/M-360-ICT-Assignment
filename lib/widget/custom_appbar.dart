import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../util/dimen.dart';
import 'custom_text.dart';



class CustomAppBar {

  AppBar appBar(String title) {
    return AppBar(
        backgroundColor: Color(0xff054d9f),
        surfaceTintColor: Colors.black,
        //  title:
        title: MyTitle(title)
        // actions: <Widget>[
        //   IconButton(
        //     icon: const Icon(
        //       Icons.remove_red_eye,
        //       color: Colors.white,
        //     ),
        //     onPressed: () {
        //       InfoDialog()
        //           .leaveInfo(context, leaveBalanceRequest['leave_types']);
        //     },
        //   )
        // ],
        );
  }
}

class MyTitle extends StatelessWidget {
  String title;

  MyTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Image.asset(
            //   "assets/cg_logo.png",
            //   height: 50,
            //   fit: BoxFit.fill,
            // ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: CustomText(
                text: title,
                weight: FontWeight.normal,
                size: Dimen.extraLargeTitleFontSize(context),
                color: Colors.white,
              ),
            ),
            Container(
              width: 30,
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Icon(Icons.home),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
