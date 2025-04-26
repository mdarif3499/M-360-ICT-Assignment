import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ict_assignment/view/auth/screen/registration_screen.dart';
import 'package:ict_assignment/view/auth/screen/send_otp_screen.dart';
import 'package:ict_assignment/widget/custom_text_field_without_title.dart';
import '../../../util/constants.dart';
import '../controller/auth_controller.dart';

class LoginScreen extends StatefulWidget {
  static const pageId = "/loginscreen";

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
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
                        Text("Sign In",
                            style: TextStyle(
                                fontSize: 32, fontWeight: FontWeight.bold)),
                        SizedBox(height: 8),
                        Text("Let’s save environment together",
                            style:
                                TextStyle(fontSize: 16, color: Colors.black)),
                        SizedBox(height: 70),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text("Email",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            CustomTextFieldWithoutTitle(
                              _emailController,
                              "",
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
                            SizedBox(height: 20),
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
                                contentPadding: EdgeInsets.zero,
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
                                                color: notification_body_colors,
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: Checkbox(
                                        value: _isCheck,
                                        onChanged: (bool? newValue) {
                                          setState(() {
                                            _isCheck = newValue!;
                                          });
                                        },
                                        fillColor: MaterialStateProperty
                                            .resolveWith<Color>(
                                                (Set<MaterialState> states) {
                                          if (states.contains(
                                              MaterialState.selected)) {
                                            return activeColor; // Fill color when checked
                                          }
                                          return Colors
                                              .green; // Outline color when unchecked
                                        }),
                                        checkColor: Colors
                                            .white, // Color of the check icon
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text("Remember me"),
                                  ],
                                ),
                                TextButton(
                                  onPressed: () {
                                    Get.toNamed(SendOtpScreen.pageId);
                                  },
                                  child: InkWell(
                                    onTap: () {

                                      Get.toNamed(SendOtpScreen.pageId);
                                    },
                                    child: Text("Forgotten Password",
                                        style: TextStyle(
                                            color: activeColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  login();
                                },
                                child: Text(
                                  "Sign In",
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
                            SizedBox(height: 30),
                            Center(
                                child: Text(
                              "Or Sign In with",
                              style: TextStyle(color: Colors.black54),
                            )),
                            SizedBox(height: 30),
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
                            SizedBox(height: 60),
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
                                  onPressed: () {
                                    Get.toNamed(RegistrationScreen.pageId);
                                  },
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
// // const Spacer(),
// SizedBox(height: 12),
// SizedBox(height: 20),
