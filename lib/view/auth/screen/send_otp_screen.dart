import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ict_assignment/util/constants.dart';
import 'package:ict_assignment/view/auth/screen/verify_otp_screen.dart';

import '../../../widget/custom_text_field_without_title.dart';
import '../controller/auth_controller.dart';

class SendOtpScreen extends StatefulWidget {
  static const pageId = "/sendOtpScreen";
  SendOtpScreen({super.key});

  @override
  State<SendOtpScreen> createState() => _SendOtpScreenState();
}

class _SendOtpScreenState extends State<SendOtpScreen> {
  final _emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  AuthController _authCon = Get.find();

  Future<void> login() async {
    if (!_formKey.currentState!.validate()) return;

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomSheet: Padding(
          padding: const EdgeInsets.only(bottom: 30, top: 30),
          child:Row(
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
          ) ,
        ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                const Text(
                  'Send OTP',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Recover your account in easy steps',
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
                const SizedBox(height: 20),
                Expanded(child: SingleChildScrollView(child:Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 60),
                    Text("Email", style: TextStyle(fontWeight: FontWeight.bold)),
                    CustomTextFieldWithoutTitle(
                      _emailController,
                      "sdfs",
                      "user@example.com",
                          (value) {
                        if (value!.isEmpty) {
                          return 'Please enter Email';
                        } else {
                          return null;
                        }
                      },
                      isPassword: true,
                    ),
                    SizedBox(
                      height: 150,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 42,
                      child: ElevatedButton(
                        onPressed: () {
                          login();
                          Get.toNamed(VerifyOtpScreen.pageId);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: activeColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          'Send OTP',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(height: 100,)
                  ],
                ),)),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
