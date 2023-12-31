import 'package:ddea_web/pages/check/check_info_page.dart';
import 'package:ddea_web/pages/confirm/confirm_submission_page.dart';
import 'package:ddea_web/pages/personal/desktop_personal_details_page.dart';
import 'package:ddea_web/pages/professional/professional_details_page.dart';
import 'package:ddea_web/pages/religious/religious_details_page.dart';
import 'package:ddea_web/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/colors.dart';
import '../../utils/my_controller.dart';

class DesktopHomePage extends StatefulWidget {
  const DesktopHomePage({super.key});

  @override
  State<DesktopHomePage> createState() => _DesktopHomePageState();
}

class _DesktopHomePageState extends State<DesktopHomePage> {
  OverlayEntry? _overlayEntry;
  bool isMenuOpen = false;

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
                      ? const CheckInfoPage()
                      : controller.myVariable.value == 2
                          ? const DesktopPersonalDetailsPage()
                          : controller.myVariable.value == 3
                              ? const ProfessionalDetailsPage()
                              : controller.myVariable.value == 4
                                  ? const ReligiousDetailsPage()
                                  : const ConfirmSubmissionPage();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  closeMenu() {
    if (_overlayEntry != null && _overlayEntry!.mounted) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
    isMenuOpen = !isMenuOpen;
  }
}
