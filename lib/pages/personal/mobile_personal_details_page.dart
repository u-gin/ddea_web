import 'dart:typed_data';

import 'package:ddea_web/utils/constants.dart';
import 'package:ddea_web/widgets/button_template.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import '../../utils/my_controller.dart';
import '../../widgets/text_field_template.dart';

class MobilePersonalDetailsPage extends StatefulWidget {
  const MobilePersonalDetailsPage({super.key});

  @override
  State<MobilePersonalDetailsPage> createState() =>
      _MobilePersonalDetailsPageState();
}

class _MobilePersonalDetailsPageState extends State<MobilePersonalDetailsPage> {
  late TextEditingController nameController;
  late TextEditingController mobileController;
  late TextEditingController hometownController;
  late TextEditingController placeOfBirthController;
  late TextEditingController dateOfBirthController;

  late String fullname, placeOfBirth, telephone, hometown, gender, dateOfBirth;

  int groupValue = 0;
  String selectedGeder = "";

  Uint8List? imageBytes;

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30),
      child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
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
                      fontSize: 14.0,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Upload image",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13.0,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Row(
                    children: [
                      imageBytes != null
                          ? ClipOval(
                              child: Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey[300],
                                  border: Border.all(
                                    width: 2,
                                    color: Colors.white,
                                  ),
                                  image: DecorationImage(
                                    image: MemoryImage(
                                      imageBytes!,
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            )
                          : Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey[300],
                                border: Border.all(
                                  width: 2,
                                  color: Colors.white,
                                ),
                              ),
                              child: const Icon(
                                Icons.person,
                                color: Colors.grey,
                                size: 30,
                              ),
                            ),
                      const SizedBox(
                        width: 10,
                      ),
                      ButtonTemplate(
                        buttonName: "Pick image",
                        buttonColor: Colors.deepPurple,
                        buttonHeight: 40,
                        buttonWidth: 100,
                        buttonAction: () {
                          pickImage();
                        },
                        fontColor: Colors.white,
                        textSize: 10,
                        buttonBorderRadius: 8,
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Full name",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13.0,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextFieldTemplate(
                hintText: "Kofi Manu",
                controller: nameController,
                obscureText: false,
                height: 40,
                width: Get.width,
                textFieldColor: Colors.white,
                textInputType: TextInputType.name,
                textInputAction: TextInputAction.next,
                enabled: true,
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Mobile number",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13.0,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextFieldTemplate(
                hintText: "+2331234567",
                controller: mobileController,
                obscureText: false,
                height: 40,
                width: Get.width,
                textInputType: TextInputType.name,
                textInputAction: TextInputAction.next,
                enabled: true,
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Place of birth",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13.0,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextFieldTemplate(
                hintText: "Accra",
                controller: placeOfBirthController,
                obscureText: false,
                height: 40,
                width: Get.width,
                textInputType: TextInputType.name,
                textInputAction: TextInputAction.next,
                enabled: true,
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Hometown",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13.0,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextFieldTemplate(
                hintText: "Hohoe",
                controller: hometownController,
                obscureText: false,
                height: 40,
                width: Get.width,
                textInputType: TextInputType.name,
                textInputAction: TextInputAction.next,
                enabled: true,
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Gender",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13.0,
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
                        size: GFSize.MEDIUM,
                        activeBgColor: Colors.deepPurple,
                        inactiveBorderColor: Colors.transparent,
                        activeBorderColor: Colors.deepPurple,
                        value: 1,
                        groupValue: groupValue,
                        onChanged: (value) {
                          setState(() {
                            groupValue = value;
                            selectedGeder = "Male";
                          });
                        },
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(
                        "Male",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13.0,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 20,
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
                        size: GFSize.MEDIUM,
                        activeBgColor: Colors.deepPurple,
                        inactiveBorderColor: Colors.transparent,
                        activeBorderColor: Colors.deepPurple,
                        value: 2,
                        groupValue: groupValue,
                        onChanged: (value) {
                          setState(() {
                            groupValue = value;
                            selectedGeder = "Female";
                          });
                        },
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(
                        "Female",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13.0,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Date of birth",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13.0,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextFieldTemplate(
                hintText: "01/11/2001",
                controller: dateOfBirthController,
                obscureText: false,
                height: 40,
                width: Get.width,
                textInputType: TextInputType.name,
                textInputAction: TextInputAction.next,
                enabled: true,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          ButtonTemplate(
            buttonName: "Next",
            buttonColor: Colors.deepPurple,
            buttonHeight: 60,
            buttonAction: () {
              if (nameController.text == "" ||
                  mobileController.text == "" ||
                  placeOfBirthController.text == "" ||
                  dateOfBirthController.text == "" ||
                  hometownController.text == "" ||
                  groupValue == 0 ||
                  imageBytes == null) {
                Get.snackbar(
                  "Warrning",
                  "All fields are required!!",
                  colorText: Colors.white,
                  backgroundColor: Colors.red,
                  borderRadius: 8.0,
                  margin: const EdgeInsets.only(top: 60, left: 30, right: 30),
                  duration: const Duration(seconds: 5),
                );
              } else {
                fullname = nameController.text.toString().trim();
                telephone = mobileController.text.toString().trim();
                placeOfBirth = placeOfBirthController.text.toString().trim();
                dateOfBirth = dateOfBirthController.text.toString().trim();
                hometown = hometownController.text.toString().trim();
                gender = selectedGeder.toString();
                saveDataToLocalStorage(fullname, dateOfBirth, gender, hometown,
                    placeOfBirth, telephone);
                setState(() {
                  Get.find<MyController>().increment();
                });
              }
            },
            fontColor: Colors.white,
            textSize: 15,
            buttonBorderRadius: 8,
            buttonWidth: 300,
          )
        ],
      ),
    );
  }

  saveDataToLocalStorage(String fullName, String dateOfBirth, String gender,
      String hometown, String placeOfBirth, String telephone) {
    storage.write("fullName", fullName);
    storage.write("dateOfBirth", dateOfBirth);
    storage.write("gender", gender);
    storage.write("hometown", hometown);
    storage.write("placeOfBirth", placeOfBirth);
    storage.write("telephone", telephone);
    storage.write("imageBtes", imageBytes!);
  }

  Future<void> pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null) {
      setState(() {
        imageBytes = result.files.single.bytes;
      });
    }
  }
}
