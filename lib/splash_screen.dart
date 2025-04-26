import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ict_assignment/view/auth/screen/login_screen.dart';
import '../util/shared_pref_key.dart';
import '../util/user_securce_storage.dart';

class SplashScreen extends StatefulWidget {
  static const pageId = "/splashscreen";

  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  UserSecureStorageImpl preference = Get.find();

  @override
  void initState() {
    changeScreen();

    super.initState();
  }

  changeScreen() async {
    Future.delayed(const Duration(seconds: 3), () async {
      String? isLogedIn = await preference.getSecureData(SharedPrefKey.ISLOGIN);

      Get.offAllNamed(LoginScreen.pageId);
    }
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => LoginScreen()));
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: Container(
              width: 214,
              height: 214,
              padding: EdgeInsets.all(8),
              child: Image.asset(
                "assets/images/asdf.png",
              ),
            ),
          ),
          Positioned(
              bottom: 27,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Powered by ',style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.black38
                  ),),
                  Text(
                    'M360 ICT',
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold, color:Colors.green),
                  ),
                ],
              )),
        ],
      ),

      // Center(
      //
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Container(
      //         width: 150,
      //         height: 150,
      //         padding: EdgeInsets.all(8),
      //         child: Image.asset(
      //           "assets/images/asdf.png",
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
