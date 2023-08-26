import 'package:ddea_web/pages/home/desktop_home_page.dart';
import 'package:ddea_web/utils/colors.dart';
import 'package:ddea_web/widgets/button_template.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../responsive_layout.dart';
import '../home/mobile_home_page.dart';
import '../home/tablet_home_page.dart';

class TabletLandingPage extends StatelessWidget {
  const TabletLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint(Get.size.toString());
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/landingpage_portrait.jpg",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70.0),
              child: Image.asset(
                "assets/images/churchlogo.png",
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            SizedBox(
              child: Column(
                children: [
                  Text(
                    "WELCOME TO DDEA!",
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 50.0,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ButtonTemplate(
                    buttonName: "ADD INFO",
                    buttonColor: Colors.white,
                    buttonHeight: 40,
                    buttonAction: () {
                      Get.to(
                        () => const ResponsiveLayout(
                          mobileLayout: MobileHomePage(),
                          tabletLayout: TabletHomePage(),
                          desktopLayout: DesktopHomePage(),
                        ),
                      );
                    },
                    buttonWidth: 300,
                    fontColor: AppColors.charcoalBlack,
                    buttonBorderRadius: 8,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      "OR",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Poppins",
                        fontSize: 10,
                      ),
                    ),
                  ),
                  ButtonTemplate(
                    buttonName: "FIND INFO",
                    buttonColor: Colors.white,
                    buttonHeight: 40,
                    buttonAction: () {
                      Get.to(
                        () => const ResponsiveLayout(
                          mobileLayout: TabletLandingPage(),
                          tabletLayout: TabletHomePage(),
                          desktopLayout: DesktopHomePage(),
                        ),
                      );
                    },
                    buttonWidth: 300,
                    fontColor: AppColors.charcoalBlack,
                    buttonBorderRadius: 8,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
