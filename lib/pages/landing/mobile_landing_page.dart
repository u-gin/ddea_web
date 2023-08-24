import 'package:ddea_web/pages/home.dart';
import 'package:ddea_web/utils/colors.dart';
import 'package:ddea_web/widgets/button_template.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MobileLandingPage extends StatelessWidget {
  const MobileLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
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
              padding: const EdgeInsets.symmetric(horizontal: 60.0),
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
                    "Welcome to DDEA!",
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 30.0,
                      fontFamily: "HindSiliguri",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ButtonTemplate(
                    buttonName: "Add Info",
                    buttonColor: Colors.white,
                    buttonHeight: 40,
                    buttonAction: () {
                      Get.to(() => const Home());
                    },
                    buttonWidth: 150,
                    fontColor: AppColors.charcoalBlack,
                    textSize: 10,
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
                    buttonName: "Find Info",
                    buttonColor: Colors.white,
                    buttonHeight: 40,
                    buttonAction: () {
                      Get.to(() => const Home());
                    },
                    buttonWidth: 150,
                    fontColor: AppColors.charcoalBlack,
                    textSize: 10,
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
