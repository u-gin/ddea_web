import 'package:ddea_web/pages/personal_details_page.dart';
import 'package:ddea_web/pages/professional_details_page.dart';
import 'package:ddea_web/pages/religious_details_page.dart';
import 'package:ddea_web/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/colors.dart';
import '../utils/my_controller.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: Stack(
                alignment: AlignmentDirectional.center,
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    "assets/images/pagebackground.jpeg",
                    fit: BoxFit.fill,
                  ),
                  Align(
                    alignment: AlignmentDirectional.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/churchlogo.png",
                          width: 250,
                          height: 150,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 6,
              child: GetBuilder<MyController>(
                builder: (controller) {
                  return controller.myVariable.value == 1
                      ? const PersonalDetailsPage()
                      : controller.myVariable.value == 2
                          ? const ProfessionalDetailsPage()
                          : const ReligiousDetailsPage();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
