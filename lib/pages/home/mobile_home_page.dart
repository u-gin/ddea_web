import 'package:ddea_web/pages/personal/mobile_personal_details_page.dart';
import 'package:ddea_web/pages/professional/mobile_professional_details_page.dart';
import 'package:ddea_web/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/my_controller.dart';
import '../confirm_submission_page.dart';
import '../personal/desktop_personal_details_page.dart';
import '../../religious/religious_details_page.dart';

class MobileHomePage extends StatefulWidget {
  const MobileHomePage({super.key});

  @override
  State<MobileHomePage> createState() => _MobileHomePageState();
}

class _MobileHomePageState extends State<MobileHomePage> {
  @override
  Widget build(BuildContext context) {
    Get.put(MyController());
    canvasHeight = MediaQuery.of(context).size.height;
    canvasWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.gray,
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: GetBuilder<MyController>(
          builder: (controller) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              child: controller.myVariable.value == 1
                  ? const ResponsiveLayout(
                      mobileLayout: MobilePersonalDetailsPage(),
                      tabletLayout: MobilePersonalDetailsPage(),
                      desktopLayout: DesktopPersonalDetailsPage())
                  : controller.myVariable.value == 2
                      ? const MobileProfessionalDetailsPage()
                      : controller.myVariable.value == 3
                          ? const ReligiousDetailsPage()
                          : ConfirmSubmissionPage(),
            );
          },
        ),
      ),
    );
  }
}
