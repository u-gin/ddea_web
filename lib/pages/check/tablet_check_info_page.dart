import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../helpers/firebase_provider.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/my_controller.dart';
import '../../widgets/button_template.dart';
import '../../widgets/text_field_template.dart';

class TabletCheckInfoPage extends StatefulWidget {
  const TabletCheckInfoPage({super.key});

  @override
  State<TabletCheckInfoPage> createState() => _TabletCheckInfoPageState();
}

class _TabletCheckInfoPageState extends State<TabletCheckInfoPage> {
  late TextEditingController mobileController;
  bool? registered;
  String mobile = '';
  final _phoneNumberRegex = RegExp(r'^[1-9][0-9]{10,15}$');

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
                padding: const EdgeInsets.only(top: 5.0, bottom: 40),
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
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color.fromARGB(255, 208, 208, 208),
                ),
                child: const Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 80.0, horizontal: 100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Follow the instructions below to input your telephone number in the field below to verify if your details are already registered",
                        //textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        "1. Start with country code without the '+'. Eg. 233 for Ghana, 44 for UK. \n\n2. Remove all leading zero after country code. Eg. 233244123456 not 2330244123456. \n\n3. No brackets '()' or symbols '+ - .', just numbers. \n\n4. Leave no spaces between the numbers",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Consumer<FirebaseProvider>(
                    builder: (context, firebase, child) {
                      if (firebase.isLoadingAllUsers) {
                        return const CircularProgressIndicator(
                          backgroundColor: Colors.deepPurple,
                          strokeWidth: 2,
                        );
                      }
                      return Column(
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
                                  mobile = mobileController.text.toString();
                                  if (_phoneNumberRegex.hasMatch(mobile)) {
                                    setState(() {
                                      registered = firebase.allUsers.any(
                                          (element) =>
                                              mobile.substring(
                                                  mobile.length - 9) ==
                                              element.telephone!.substring(
                                                  element.telephone!.length -
                                                      9));
                                    });
                                  } else {
                                    Get.snackbar(
                                      "Warrning",
                                      "Phone number is not valid",
                                      colorText: Colors.white,
                                      backgroundColor: Colors.red,
                                      borderRadius: 8.0,
                                      margin: const EdgeInsets.only(
                                          top: 60, left: 380, right: 380),
                                      duration: const Duration(seconds: 5),
                                    );
                                  }
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
                              ),
                            ],
                          )
                        ],
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
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
                height: 60,
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
                    userDetails["telephone"] = mobile;
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
      ),
    );
  }
}
