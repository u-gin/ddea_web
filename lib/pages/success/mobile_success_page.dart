import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MobileSuccessPage extends StatefulWidget {
  const MobileSuccessPage({super.key});

  @override
  State<MobileSuccessPage> createState() => _MobileSuccessPageState();
}

class _MobileSuccessPageState extends State<MobileSuccessPage> {
  late ConfettiController confettiController;

  @override
  void initState() {
    confettiController = ConfettiController();
    super.initState();
  }

  @override
  void dispose() {
    confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    confettiController.play();
    debugPrint(Get.width.toString());
    debugPrint(Get.height.toString());
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
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
            child: const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.0),
                child: Text(
                  "SUBMITTED SUCCESSFULLY",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          ),
          ConfettiWidget(
            particleDrag: 0.05,
            emissionFrequency: 0.03,
            numberOfParticles: 50,
            gravity: 0.05,
            blastDirection: pi, // radial value - LEFT

            shouldLoop: false,
            confettiController: confettiController,
          ),
        ],
      ),
    );
  }
}
