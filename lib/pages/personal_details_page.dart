import 'package:ddea_web/widgets/button_template.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import '../utils/my_controller.dart';
import '../widgets/text_field_template.dart';

class PersonalDetailsPage extends StatefulWidget {
  const PersonalDetailsPage({super.key});

  @override
  State<PersonalDetailsPage> createState() => _PersonalDetailsPageState();
}

class _PersonalDetailsPageState extends State<PersonalDetailsPage> {
  late TextEditingController nameController;
  late TextEditingController mobileController;
  late TextEditingController hometownController;
  late TextEditingController placeOfBirthController;
  late TextEditingController dateOfBirthController;

  int groupValue = 0;

  @override
  void initState() {
    nameController = TextEditingController();
    mobileController = TextEditingController();
    hometownController = TextEditingController();
    placeOfBirthController = TextEditingController();
    dateOfBirthController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Expanded(
                  flex: 1,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: 8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0, bottom: 60),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.info,
                              color: Colors.deepPurple,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Personal Details".toUpperCase(),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Full name",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextFieldTemplate(
                                hintText: "Kofi Manu",
                                controller: nameController,
                                obscureText: false,
                                width: 400,
                                height: 50,
                                textInputType: TextInputType.name,
                                textInputAction: TextInputAction.next,
                                enabled: true,
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Mobile number",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextFieldTemplate(
                                hintText: "+2331234567",
                                controller: mobileController,
                                obscureText: false,
                                width: 400,
                                height: 50,
                                textInputType: TextInputType.name,
                                textInputAction: TextInputAction.next,
                                enabled: true,
                              )
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Place of birth",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextFieldTemplate(
                                hintText: "Accra",
                                controller: placeOfBirthController,
                                obscureText: false,
                                width: 400,
                                height: 50,
                                textInputType: TextInputType.name,
                                textInputAction: TextInputAction.next,
                                enabled: true,
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Hometown",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextFieldTemplate(
                                hintText: "Hohoe",
                                controller: hometownController,
                                obscureText: false,
                                width: 400,
                                height: 50,
                                textInputType: TextInputType.name,
                                textInputAction: TextInputAction.next,
                                enabled: true,
                              )
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Gender",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      GFRadio(
                                        type: GFRadioType.custom,
                                        activeIcon: const Icon(
                                          Icons.check,
                                          color: Colors.white,
                                        ),
                                        radioColor: Colors.transparent,
                                        size: GFSize.LARGE,
                                        activeBgColor: Colors.deepPurple,
                                        inactiveBorderColor: Colors.transparent,
                                        activeBorderColor: Colors.deepPurple,
                                        value: 1,
                                        groupValue: groupValue,
                                        onChanged: (value) {
                                          setState(() {
                                            groupValue = value;
                                          });
                                        },
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      const Text(
                                        "Male",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.0,
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 100,
                                  ),
                                  Row(
                                    children: [
                                      GFRadio(
                                        type: GFRadioType.custom,
                                        activeIcon: const Icon(
                                          Icons.check,
                                          color: Colors.white,
                                        ),
                                        radioColor: Colors.transparent,
                                        size: GFSize.LARGE,
                                        activeBgColor: Colors.deepPurple,
                                        inactiveBorderColor: Colors.transparent,
                                        activeBorderColor: Colors.deepPurple,
                                        value: 2,
                                        groupValue: groupValue,
                                        onChanged: (value) {
                                          setState(() {
                                            groupValue = value;
                                          });
                                        },
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      const Text(
                                        "Female",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.0,
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Date of birth",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextFieldTemplate(
                                hintText: "01/11/2001",
                                controller: dateOfBirthController,
                                obscureText: false,
                                width: 400,
                                height: 50,
                                textInputType: TextInputType.name,
                                textInputAction: TextInputAction.next,
                                enabled: true,
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Expanded(
                  flex: 1,
                  child: SizedBox(),
                ),
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            ButtonTemplate(
              buttonName: "Next",
              buttonColor: Colors.deepPurple,
              buttonHeight: 60,
              buttonAction: () {
                setState(() {
                  Get.find<MyController>().increment();
                });
              },
              fontColor: Colors.white,
              textSize: 15,
              buttonBorderRadius: 8,
              buttonWidth: 300,
            )
          ],
        ),
      ),
    );
  }
}
