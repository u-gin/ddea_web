import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({super.key});

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
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
    debugPrint(Get.width.toString());
    debugPrint(Get.height.toString());
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
        child: const Center(
          child: Text(
            "SUBMITTED SUCCESSFULLY",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );
  }
}
