import 'package:ddea_web/firebase_options.dart';
import 'package:ddea_web/helpers/firebase_provider.dart';
import 'package:ddea_web/helpers/firebase_service.dart';
import 'package:ddea_web/pages/admin/dashboard.dart';
import 'package:ddea_web/pages/admin/requests_page.dart';
import 'package:ddea_web/pages/home/desktop_home_page.dart';
import 'package:ddea_web/pages/landing/desktop_landing_page.dart';
import 'package:ddea_web/pages/landing/mobile_landing_page.dart';
import 'package:ddea_web/pages/landing/tablet_landing_page.dart';
import 'package:ddea_web/pages/personal/desktop_personal_details_page.dart';
import 'package:ddea_web/pages/religious/religious_details_page.dart';
import 'package:ddea_web/responsive_layout.dart';
import 'package:ddea_web/utils/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

void setupLocator() {
  GetIt.I.registerLazySingleton(() => FirebaseService());
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized;
  setupLocator();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final FirebaseDatabase databaseInstance = FirebaseDatabase.instance;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FirebaseProvider(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "DDEA",
        theme: ThemeData(
          //fontFamily: "HindSiliguri",
          brightness: Brightness.light,
          primaryColor: AppColors.primary,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const ResponsiveLayout(
                desktopLayout: DesktopLandingPage(),
                mobileLayout: MobileLandingPage(),
                tabletLayout: TabletLandingPage(),
              ),
          '/home': (context) => const DesktopHomePage(),
          '/personalDetailsPage': (context) =>
              const DesktopPersonalDetailsPage(),
          '/religiousDetails': (context) => const ReligiousDetailsPage(),
          '/Dashboard': (context) => const Dashboard(),
          '/Requests': (context) => const RequestsPage(),
        },
      ),
    );
  }
}
