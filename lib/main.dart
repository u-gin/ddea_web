import 'package:ddea_web/firebase_options.dart';
import 'package:ddea_web/pages/admin/dashboard.dart';
import 'package:ddea_web/pages/home/desktop_home_page.dart';
import 'package:ddea_web/pages/landing/desktop_landing_page.dart';
import 'package:ddea_web/pages/landing/mobile_landing_page.dart';
import 'package:ddea_web/pages/landing/tablet_landing_page.dart';
import 'package:ddea_web/pages/personal/desktop_personal_details_page.dart';
import 'package:ddea_web/pages/religious/religious_details_page.dart';
import 'package:ddea_web/responsive_layout.dart';
import 'package:ddea_web/utils/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized;

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
      //initialRoute: '/dashboard',
      routes: {
        '/': (context) => const ResponsiveLayout(
              desktopLayout: DesktopLandingPage(),
              mobileLayout: MobileLandingPage(),
              tabletLayout: TabletLandingPage(),
            ),
        '/home': (context) => const DesktopHomePage(),
        '/personalDetailsPage': (context) => const DesktopPersonalDetailsPage(),
        '/religiousDetail': (context) => const ReligiousDetailsPage(),
        '/dashboard': (context) => const Dashboard(),
      },
    );
  }
}
