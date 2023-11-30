import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../widgets/text_field_template.dart';

class CheckInfoPage extends StatefulWidget {
  const CheckInfoPage({super.key});

  @override
  State<CheckInfoPage> createState() => _CheckInfoPageState();
}

class _CheckInfoPageState extends State<CheckInfoPage> {
  late TextEditingController mobileController;

  @override
  void initState() {
    mobileController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    mobileController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray,
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.mark_email_read_sharp,
                      color: Colors.deepPurple,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Check Details".toUpperCase(),
                      style: const TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 18.0,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const Text(
                "Input your telephone number in the field below to verify if your details are already registered",
                style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 16.0,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Telephone",
                    style: header16(),
                  ),
                  Row(
                    children: [
                      TextFieldTemplate(
                        hintText: "02431234567",
                        controller: mobileController,
                        obscureText: false,
                        height: 50,
                        textInputType: TextInputType.phone,
                        textInputAction: TextInputAction.done,
                        enabled: true,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
