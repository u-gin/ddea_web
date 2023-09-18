import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import 'package:ddea_web/widgets/button_template.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/my_controller.dart';
import '../../widgets/text_field_template.dart';

class DesktopPersonalDetailsPage extends StatefulWidget {
  const DesktopPersonalDetailsPage({super.key});

  @override
  State<DesktopPersonalDetailsPage> createState() =>
      _DesktopPersonalDetailsPageState();
}

class _DesktopPersonalDetailsPageState
    extends State<DesktopPersonalDetailsPage> {
  late TextEditingController nameController;
  late TextEditingController mobileController;
  late TextEditingController hometownController;
  late TextEditingController placeOfBirthController;

  DateTime selectedDay = DateTime.now();
  late GlobalKey keyDate;

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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Upload image",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: imageBytes != null
                          ? ClipOval(
                              child: Container(
                                width: 150,
                                height: 150,
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
                              width: 150,
                              height: 150,
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
                                size: 90,
                              ),
                            ),
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
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Full name",
                          style: header16(),
                        ),
                        TextFieldTemplate(
                          hintText: "Kofi Manu",
                          controller: nameController,
                          obscureText: false,
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
                        Text(
                          "Mobile number",
                          style: header16(),
                        ),
                        TextFieldTemplate(
                          hintText: "+2331234567",
                          controller: mobileController,
                          obscureText: false,
                          height: 50,
                          textInputType: TextInputType.number,
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Place of birth",
                          style: header16(),
                        ),
                        TextFieldTemplate(
                          hintText: "Accra",
                          controller: placeOfBirthController,
                          obscureText: false,
                          height: 50,
                          textInputType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          enabled: true,
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hometown",
                          style: header16(),
                        ),
                        TextFieldTemplate(
                          hintText: "Hohoe",
                          controller: hometownController,
                          obscureText: false,
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Date of birth",
                            style: header16(),
                          ),
                          GestureDetector(
                            onTap: () async {
                              final DateTime? dateTime = await showDatePicker(
                                context: context,
                                initialDate: selectedDay,
                                firstDate: DateTime.utc(1900, 1, 11),
                                lastDate: DateTime.now(),
                              );
                              if (dateTime != null) {
                                setState(() {
                                  selectedDay = dateTime;
                                });
                              }
                            },
                            child: Container(
                              height: 50,
                              width: 300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      convertDate(selectedDay),
                                      style: TextStyle(
                                        color: AppColors.black,
                                        fontSize: 17.0,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_down,
                                      color: AppColors.colorFromHex("#C6CDD3"),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 300,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Gender",
                            style: header16(),
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
                                        selectedGeder = "Male";
                                      });
                                    },
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "Male",
                                    style: header16(),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 40,
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
                                        selectedGeder = "Female";
                                      });
                                    },
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "Female",
                                    style: header16(),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
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
                if (nameController.text == "" ||
                    mobileController.text == "" ||
                    placeOfBirthController.text == "" ||
                    hometownController.text == "" ||
                    groupValue == 0 ||
                    imageBytes == null) {
                  Get.snackbar(
                    "Warrning",
                    "All fields are required!!",
                    colorText: Colors.white,
                    backgroundColor: Colors.red,
                    borderRadius: 8.0,
                    margin:
                        const EdgeInsets.only(top: 60, left: 380, right: 380),
                    duration: const Duration(seconds: 5),
                  );
                } else {
                  fullname = nameController.text.toString().trim();
                  telephone = mobileController.text.toString().trim();
                  placeOfBirth = placeOfBirthController.text.toString().trim();
                  hometown = hometownController.text.toString().trim();
                  gender = selectedGeder.toString();
                  saveDataToLocalStorage(fullname, convertDate(selectedDay),
                      gender, hometown, placeOfBirth, telephone);
                  setState(() {
                    Get.find<MyController>().increment();
                  });
                }
                //Get.find<MyController>().increment();
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

  saveDataToLocalStorage(String fullName, String dateOfBirth, String gender,
      String hometown, String placeOfBirth, String telephone) {
    userDetails["fullName"] = fullName;
    userDetails["dateOfBirth"] = dateOfBirth;
    userDetails["gender"] = gender;
    userDetails["hometown"] = hometown;
    userDetails["placeOfBirth"] = placeOfBirth;
    userDetails["telephone"] = telephone;
    userDetails["imageBytes"] = imageBytes;
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
