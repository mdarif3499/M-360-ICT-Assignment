import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:ict_assignment/splash_screen.dart';
import 'package:ict_assignment/view/auth/binding/auth_screen_bounding.dart';
import 'package:ict_assignment/view/auth/screen/login_screen.dart';
import 'package:ict_assignment/view/auth/screen/registration_screen.dart';
import 'package:ict_assignment/view/auth/screen/send_otp_screen.dart';
import 'package:ict_assignment/view/auth/screen/verify_otp_screen.dart';
import 'package:ict_assignment/view/home/binding/home_binding.dart';
import 'package:ict_assignment/view/home/view/details_screen.dart';
import 'package:ict_assignment/view/home/view/home_screen.dart';
import 'package:ict_assignment/view/home/view/item_add_screen.dart';
import 'package:ict_assignment/view/home/view/result_screen.dart';




final List<GetPage> appPages = [
  GetPage(name: SplashScreen.pageId, page: () => SplashScreen(),
      binding: AuthScreenBindings(),
      transition: Transition.rightToLeftWithFade
  ),

  GetPage(
      name: LoginScreen.pageId,
      binding: AuthScreenBindings(),
      page: () => LoginScreen()),

  GetPage(
      name: RegistrationScreen.pageId,
      binding: AuthScreenBindings(),
      page: () => RegistrationScreen()),



  GetPage(
      name: HomeScreen.pageId,
      binding: HomeBinding(),
      page: () => HomeScreen()),


  GetPage(
      name: Details_Screen.pageId,
      binding: HomeBinding(),
      page: () => Details_Screen()),

  GetPage(
      name: ItemAddScreen.pageId,
      binding: HomeBinding(),
      page: () => ItemAddScreen()),
  GetPage(
      name: SendOtpScreen.pageId,
      binding: HomeBinding(),
      page: () => SendOtpScreen()),
  GetPage(
      name: CarbonDioxideScreen.pageId,
      binding: HomeBinding(),
      page: () => CarbonDioxideScreen()),

  GetPage(
      name: VerifyOtpScreen.pageId,
      binding: HomeBinding(),
      page: () => VerifyOtpScreen()),




];
