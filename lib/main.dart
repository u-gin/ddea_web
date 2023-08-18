import 'package:ddea_web/pages/home.dart';
import 'package:ddea_web/pages/landing_page.dart';
import 'package:ddea_web/pages/personal_details_page.dart';
import 'package:ddea_web/utils/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized;
  await GetStorage.init();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCE7DWFonBVRigcgD_dvg0Kxz12PKv_YF4",
      projectId: "ddea-web",
      messagingSenderId: "680528639207",
      appId: "1:680528639207:web:de84852101672a74f1de42",
    ),
  );
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
