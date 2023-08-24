import 'package:ddea_web/pages/home.dart';
import 'package:ddea_web/utils/colors.dart';
import 'package:ddea_web/widgets/button_template.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DesktopLandingPage extends StatelessWidget {
  const DesktopLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/landingpage_landscape.jpeg",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: SizedBox(
                height: Get.height,
                child: Padding(
                  padding: const EdgeInsets.all(150.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/churchlogo.png",
                        width: 650,
                        height: 650,
                      ),
                      /* const Padding(
                        padding: EdgeInsets.only(left: 160.0),
                        child: Text(
                          "DANSOMAN DISTRICT ENGLISH ASSEMBLY",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontFamily: "HindSiliguri",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ), */
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Welcome to DDEA!",
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 70.0,
                              fontFamily: "HindSiliguri",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          /* const Text(
                            "JOIN US TODAY!",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500,
                            ),
                          ), */
                          const SizedBox(
                            height: 20,
                          ),
                          ButtonTemplate(
                            buttonName: "Add Info",
                            buttonColor: Colors.white,
                            buttonHeight: 40,
                            buttonAction: () {
                              Get.to(() => const Home());
                            },
                            buttonWidth: 300,
                            fontColor: AppColors.charcoalBlack,
                            textSize: 12,
                            buttonBorderRadius: 8,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.0),
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
                            buttonWidth: 300,
                            fontColor: AppColors.charcoalBlack,
                            textSize: 12,
                            buttonBorderRadius: 8,
                          )
                        ],
                      ),
                      const SizedBox(),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
