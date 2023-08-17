import 'package:ddea_web/pages/home.dart';
import 'package:ddea_web/pages/landing_page.dart';
import 'package:ddea_web/pages/personal_details_page.dart';
import 'package:ddea_web/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "DDEA",
      theme: ThemeData(
        //fontFamily: "HindSiliguri",
        brightness: Brightness.light,
        primaryColor: AppColors.primary,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LandingPage(),
        '/home': (context) => const Home(),
        '/personalDetailsPage': (context) => const PersonalDetailsPage(),
      },
    );
  }
}
