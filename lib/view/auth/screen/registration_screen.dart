import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../util/constants.dart';
import '../../../widget/custom_text_field_without_title.dart';
import '../controller/auth_controller.dart';

class RegistrationScreen extends StatefulWidget {
  static const pageId = "/registrationScreen";

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  bool _isPassword = false;

  AuthController _authCon = Get.find();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _isCheck = false;

  Future<void> login() async {
    if (!_formKey.currentState!.validate()) return;
    _authCon.loginMethod(context,
        email: _emailController.text, password: _passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Padding(
        padding: const EdgeInsets.only(bottom: 30, top: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                    text: 'Powered by ',
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.none,
                        color: Colors.black38,
                        fontSize: 15),
                  ),
                  TextSpan(
                    text: 'M360 ICT',
                    style: TextStyle(
                        fontSize: 16,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 40, left: 24, right: 24),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Sign Up",
                            style: TextStyle(
                                fontSize: 32, fontWeight: FontWeight.bold)),
                        SizedBox(height: 8),
                        Text("Let’s save environment together",
                            style:
                                TextStyle(fontSize: 16, color: Colors.black)),
                        SizedBox(height: 30),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text("Name",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            CustomTextFieldWithoutTitle(
                              _nameController,
                              "sdfs",
                              "e.g:Ahmed Ariyan",
                              (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter Email';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Phone Number",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 2,
                            ),
                            TextFormField(
                              controller: _phoneController,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                isDense: true,
                                // Reduces vertical padding
                                hintText: '17XXXXXXXXX',
                                prefixIconConstraints: const BoxConstraints(
                                  minWidth: 0,
                                  minHeight: 0,
                                ),

                                prefixIcon: Container(
                                  margin: const EdgeInsets.only(right: 15),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(6),
                                        topRight: Radius.circular(6),
                                      ),
                                      color: notification_body_color),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4), // Custom padding
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Image.asset(
                                          'assets/images/bangladesh.png',
                                          width: 24,
                                          height: 24,
                                        ),
                                        const SizedBox(width: 4),
                                        const Text('+880',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                  ),
                                ),
                                border: const UnderlineInputBorder(),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Email",
                                style: TextStyle(fontWeight: FontWeight.bold)),

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
                            SizedBox(height: 10),
                            TextFormField(
                              style: TextStyle(
                                fontSize: 20.0, // Set the font size here
                              ),
                              controller: _passwordController,
                              obscureText: _obscureConfirmPassword,
                              decoration: InputDecoration(
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                label: Text(
                                  "Password",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                isDense: true,
                                hintText: "******",
                                hintStyle: TextStyle(
                                  fontSize: 23.0,
                                  // Change this to any size you want
                                  color: Colors
                                      .grey, // Optional: you can also change the color
                                ),
                                prefixIconConstraints: const BoxConstraints(
                                  minWidth: 0,
                                  minHeight: 0,
                                ),
                                suffixIcon: _isLoading == false
                                    ? InkWell(
                                        onTap: () {
                                          setState(() {});
                                          _obscureConfirmPassword =
                                              !_obscureConfirmPassword;
                                        },
                                        child: _obscureConfirmPassword
                                            ? Image.asset(
                                                "assets/images/eyebroww.png",
                                                color: Colors.black38,
                                              )
                                            : Icon(
                                                Icons.remove_red_eye_rounded),
                                      )
                                    : null,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a password';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 10),
                            TextFormField(
                              style: TextStyle(
                                fontSize: 20.0, // Set the font size here
                              ),
                              controller: _confirmpasswordController,
                              obscureText: _obscurePassword,
                              decoration: InputDecoration(
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                label: Text(
                                  "Confirm Password",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                isDense: true,
                                hintText: "******",
                                hintStyle: TextStyle(
                                  fontSize: 23.0,
                                  // Change this to any size you want
                                  color: Colors
                                      .grey, // Optional: you can also change the color
                                ),
                                prefixIconConstraints: const BoxConstraints(
                                  minWidth: 0,
                                  minHeight: 0,
                                ),
                                suffixIcon: _isPassword == false
                                    ? InkWell(
                                        onTap: () {
                                          setState(() {});
                                          _obscurePassword = !_obscurePassword;
                                        },
                                        child: _obscurePassword
                                            ? Image.asset(
                                                "assets/images/eyebroww.png",
                                                color: Colors.black38,
                                              )
                                            : Icon(
                                                Icons.remove_red_eye_rounded),
                                      )
                                    : null,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please confirm your password';
                                } else if (value != _passwordController.text) {
                                  return 'Passwords do not match';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text('Processing Data')));
                                    _authCon.signupMethod(
                                        context: context,
                                        password: _passwordController.text,
                                        conPassword:
                                            _confirmpasswordController.text,
                                    name: _nameController.text,
                                      email: _emailController.text,
                                      phone: _phoneController
                                    );

                                    // Handle registration logic here
                                  }
                                },
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: activeColor,
                                  padding: EdgeInsets.symmetric(vertical: 14),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Center(
                                child: Text(
                              "Or Sign In with",
                              style: TextStyle(color: Colors.black54),
                            )),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  child: Image.asset(
                                    "assets/images/search.png",
                                    height: 25,
                                    width: 25,
                                  ),
                                  backgroundColor: Colors.white,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                CircleAvatar(
                                  child: Icon(FontAwesomeIcons.facebookF,
                                      color: Colors.blueAccent),
                                  backgroundColor: Colors.white,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                CircleAvatar(
                                  child: Image.asset(
                                    "assets/images/microsoft.png",
                                    height: 25,
                                    width: 25,
                                  ),
                                  backgroundColor: Colors.white,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                CircleAvatar(
                                  child: Icon(FontAwesomeIcons.apple,
                                      color: Colors.black54),
                                  backgroundColor: Colors.white,
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  " have an account? ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black38),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text("Sign Up",
                                      style: TextStyle(
                                          color: activeColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16)),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 70,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  clearController() {
    _authCon.loginpassControler.clear();
    _authCon.loginEmailControler.clear();
  }
}
