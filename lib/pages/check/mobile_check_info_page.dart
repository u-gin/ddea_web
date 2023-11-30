import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/my_controller.dart';
import '../../widgets/button_template.dart';
import '../../widgets/text_field_template.dart';

class MobileCheckInfoPage extends StatefulWidget {
  const MobileCheckInfoPage({super.key});

  @override
  State<MobileCheckInfoPage> createState() => _MobileCheckInfoPageState();
}

class _MobileCheckInfoPageState extends State<MobileCheckInfoPage> {
  late TextEditingController mobileController;
  bool? registered;

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
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                        GestureDetector(
                          onTap: () {
                            String mobile = mobileController.text.toString();
                            setState(() {
                              registered = allUsers.any(
                                  (element) => element.telephone == mobile);
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.deepPurple,
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(10),
                              child: Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              registered == null
                  ? ""
                  : registered!
                      ? "Details are already registered"
                      : "Details are not registered, click on next to register",
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: registered == null
                  ? 0
                  : registered!
                      ? 0
                      : 40,
              child: ButtonTemplate(
                buttonName: "Next",
                buttonColor: Colors.deepPurple,
                buttonHeight: 60,
                buttonAction: () {
                  Get.find<MyController>().increment();
                },
                fontColor: Colors.white,
                textSize: 15,
                buttonBorderRadius: 8,
                buttonWidth: 300,
              ),
            )
          ],
        ),
      ),
    );
  }
}