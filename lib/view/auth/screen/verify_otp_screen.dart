import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ict_assignment/util/constants.dart';

class VerifyOtpScreen extends StatefulWidget {
  static const pageId = "/verifyOtpScreen";

  const VerifyOtpScreen({Key? key}) : super(key: key);

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Padding(
        padding: const EdgeInsets.only(bottom: 30, top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text.rich(
              TextSpan(
                text: 'Powered by ',
                style: const TextStyle(color: Colors.grey),
                children: [
                  TextSpan(
                    text: 'M360 ICT',
                    style: TextStyle(
                      color: Colors.green[600],
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              const Text(
                "Verify OTP",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                "Recover your account in easy steps",
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 40),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(color: Colors.black54, fontSize: 16),
                        children: [
                          TextSpan(text: "An email has been sent to "),
                          TextSpan(
                            text: "user@example.com",
                            style: TextStyle(
                                color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: ".\nPlease enter the sent OTP."),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OtpBox(),
                        SizedBox(
                          width: 25,
                        ),
                        OtpBox(),
                        SizedBox(
                          width: 25,
                        ),
                        OtpBox(),
                        SizedBox(
                          width: 25,
                        ),
                        OtpBox(),

                      ],
                    ),
                    SizedBox(height: 130),
                    SizedBox(
                      width: double.infinity,
                      height: 42,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: activeColor,
                          padding: const EdgeInsets.symmetric(vertical: 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          "Verify OTP",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Didn’t Receive a code? ",
                            style: TextStyle(color: Colors.black45),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Resend code logic
                            },
                            child: InkWell(
                              onTap: (){
                                Get.back();
                              },
                              child: Text(
                                "Resend",
                                style: TextStyle(
                                    color: Colors.green.shade500,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 100,),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

class OtpBox extends StatelessWidget {
  const OtpBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: SizedBox(
        width: 50,
        height: 65,
        child: TextField(
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counterText: '',
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green.shade400, width: 2),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ),
    );
  }
}
