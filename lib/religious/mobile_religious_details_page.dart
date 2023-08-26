import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import '../utils/colors.dart';
import '../utils/constants.dart';
import '../utils/my_controller.dart';
import '../widgets/button_template.dart';
import '../widgets/text_field_template.dart';

class MobileReligiousDetailsPage extends StatefulWidget {
  const MobileReligiousDetailsPage({super.key});

  @override
  State<MobileReligiousDetailsPage> createState() =>
      _MobileReligiousDetailsPageState();
}

class _MobileReligiousDetailsPageState
    extends State<MobileReligiousDetailsPage> {
  late TextEditingController baptizedByController;

  late String baptizedBy, positionHeld, communicant;

  int groupValue = 0;
  String communicantValue = "";

  List positionHeldList = [
    "Please select",
    'Member (M)',
    'Presiding Elder (P.E)',
    'Deacon (Dcn)',
    'Deaconess (Dcns)'
  ];
  String dropdownValue = "Please select";

  @override
  void initState() {
    baptizedByController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 60),
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
                  "Religious Details".toUpperCase(),
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
            "Baptized by",
            style: TextStyle(
              color: Colors.black,
              fontSize: 13.0,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w400,
            ),
          ),
          TextFieldTemplate(
            hintText: "Ps. Andrews Okyere",
            controller: baptizedByController,
            obscureText: false,
            height: 40,
            textInputType: TextInputType.name,
            textInputAction: TextInputAction.next,
            enabled: true,
          ),
          const SizedBox(
            height: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Position held",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13.0,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 40,
                width: 300,
                child: DropdownButtonHideUnderline(
                  child: GFDropdown(
                    borderRadius: BorderRadius.circular(10),
                    border: const BorderSide(
                      color: Colors.black12,
                      width: 1,
                    ),
                    hint: Text(
                      'Please select',
                      style: TextStyle(
                        color: AppColors.hintTextColor,
                        fontSize: 14.0,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    dropdownButtonColor: Colors.white,
                    isExpanded: true,
                    isDense: true,
                    focusColor: Colors.transparent,
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 14.0,
                    ),
                    value: dropdownValue,
                    onChanged: (newValue) {
                      setState(() {
                        dropdownValue = newValue.toString();
                      });
                    },
                    items: positionHeldList
                        .map((value) => DropdownMenuItem(
                              value: value,
                              alignment: AlignmentDirectional.centerStart,
                              child: Text(
                                value,
                                style: const TextStyle(
                                  fontFamily: "Poppins",
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "Communicant",
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
                    size: GFSize.LARGE,
                    activeBgColor: Colors.deepPurple,
                    inactiveBorderColor: Colors.transparent,
                    activeBorderColor: Colors.deepPurple,
                    value: 1,
                    groupValue: groupValue,
                    onChanged: (value) {
                      setState(() {
                        groupValue = value;
                        communicantValue = "Yes";
                      });
                    },
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text(
                    "Yes",
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
                    size: GFSize.LARGE,
                    activeBgColor: Colors.deepPurple,
                    inactiveBorderColor: Colors.transparent,
                    activeBorderColor: Colors.deepPurple,
                    value: 2,
                    groupValue: groupValue,
                    onChanged: (value) {
                      setState(() {
                        groupValue = value;
                        communicantValue = "No";
                      });
                    },
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text(
                    "No",
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
            height: 60,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: ButtonTemplate(
                  buttonName: "Previous",
                  buttonColor: const Color.fromARGB(255, 174, 78, 191),
                  buttonHeight: 60,
                  buttonAction: () {
                    setState(() {
                      Get.find<MyController>().decrement();
                    });
                  },
                  fontColor: Colors.white,
                  textSize: 15,
                  buttonBorderRadius: 8,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 1,
                child: ButtonTemplate(
                  buttonName: "Done",
                  buttonColor: Colors.deepPurple,
                  buttonHeight: 60,
                  buttonAction: () {
                    if (baptizedByController.text == "" ||
                        dropdownValue == "Please select" ||
                        communicantValue == "") {
                      Get.snackbar(
                        "Warrning",
                        "All fields are required!!",
                        colorText: Colors.white,
                        backgroundColor: Colors.red,
                        borderRadius: 8.0,
                        margin: const EdgeInsets.only(
                            top: 60, left: 380, right: 380),
                        duration: const Duration(seconds: 5),
                      );
                    } else {
                      baptizedBy = baptizedByController.text.toString().trim();
                      positionHeld = dropdownValue.toString().trim();
                      communicant = communicantValue.toString();
                      saveDataToLocalStorage(
                          baptizedBy, positionHeld, communicant);
                      setState(() {
                        Get.find<MyController>().increment();
                      });
                    }
                  },
                  fontColor: Colors.white,
                  textSize: 15,
                  buttonBorderRadius: 8,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  saveDataToLocalStorage(
      String baptizedBy, String positionHeld, String communicant) {
    storage.write("baptizedBy", baptizedBy);
    storage.write("positionHeld", positionHeld);
    storage.write("communicant", communicant);
  }
}
