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
import 'package:ddea_web/utils/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'models/user_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized;

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
    retrieveUserData();
    super.initState();
  }

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
        '/': (context) => const ResponsiveLayout(
              desktopLayout: DesktopLandingPage(),
              mobileLayout: MobileLandingPage(),
              tabletLayout: TabletLandingPage(),
            ),
        '/home': (context) => const DesktopHomePage(),
        '/personalDetailsPage': (context) => const DesktopPersonalDetailsPage(),
        '/religiousDetails': (context) => const ReligiousDetailsPage(),
        '/Dashboard': (context) => const Dashboard(),
      },
    );
  }

  void retrieveUserData() {
    List subnodePaths = [
      "Elder (Eld)",
      "Deacon (Dcn)",
      "Deaconess (Dcns)",
      "Member (M)",
      "Presiding Elder (PE)",
      "Pastor (Ps)"
    ];
    List<List<UserModel>> userLists = [
      justElders,
      justDeacons,
      justDeaconesses,
      justMembers,
      justPresidingElder,
      justPastor
    ];
    /* setState(() {
      isLoading = true;
    }); */
    final DatabaseReference databaseReference = databaseInstance.ref();

    for (int i = 0; i < subnodePaths.length; i++) {
      String subnode = subnodePaths[i];

      databaseReference.child('ddea/members/$subnode').onValue.listen(
          (DatabaseEvent event) {
        final dynamic dataSnapshot = event.snapshot.value;
        if (dataSnapshot != null && dataSnapshot is Map<dynamic, dynamic>) {
          dataSnapshot.forEach((key, user) {
            userLists[i].add(UserModel.fromSnapshot(event.snapshot.child(key)));
          });
          allUsers.addAll(userLists[i]);
          /* setState(() {
            isLoading = false;
          }); */
        } else {
          /* setState(() {
            isLoading = false;
          }); */
          debugPrint('No data found for $subnode');
        }
      }, onError: (error) {
        /* setState(() {
          isLoading = false;
        }); */
        debugPrint('Error fetching data for $subnode: $error');
      });
    }
  }
}
