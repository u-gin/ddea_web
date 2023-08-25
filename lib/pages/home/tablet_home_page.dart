import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/my_controller.dart';
import '../confirm_submission_page.dart';
import '../personal_details_page.dart';
import '../professional_details_page.dart';
import '../religious_details_page.dart';

class TabletHomePage extends StatefulWidget {
  const TabletHomePage({super.key});

  @override
  State<TabletHomePage> createState() => _TabletHomePageState();
}

class _TabletHomePageState extends State<TabletHomePage> {
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
            return controller.myVariable.value == 1
                ? const PersonalDetailsPage()
                : controller.myVariable.value == 2
                    ? const ProfessionalDetailsPage()
                    : controller.myVariable.value == 3
                        ? const ReligiousDetailsPage()
                        : ConfirmSubmissionPage();
          },
        ),
      ),
    );
  }
}
