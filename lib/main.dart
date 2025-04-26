import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:ict_assignment/routes.dart';
import 'package:ict_assignment/splash_screen.dart';

import 'binding/main_binding.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyBf-wNh8kctb3ZCg7cEkyr93-i7BetTp5c",
          authDomain: "ict-assignment-abbb9.firebaseapp.com",
          projectId: "ict-assignment-abbb9",
          storageBucket: "ict-assignment-abbb9.firebasestorage.app",
          messagingSenderId: "1079656371083",
          appId: "1:1079656371083:web:497e6450fa52395285558e"));

  ThemeData(
    primarySwatch: Colors.indigo,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        getPages: appPages,
        initialBinding: MainBinding(),
        initialRoute: SplashScreen.pageId,
        );
  }
}
