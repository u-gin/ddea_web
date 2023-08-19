import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import '../utils/colors.dart';
import '../utils/constants.dart';
import '../utils/my_controller.dart';
import '../widgets/button_template.dart';
import '../widgets/text_field_template.dart';

class ReligiousDetailsPage extends StatefulWidget {
  const ReligiousDetailsPage({super.key});

  @override
  State<ReligiousDetailsPage> createState() => _ReligiousDetailsPageState();
}

class _ReligiousDetailsPageState extends State<ReligiousDetailsPage> {
  late TextEditingController baptizedByController;

  late String baptizedBy, positionHeld, communicant;

  int groupValue = 0;

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
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Baptized by",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextFieldTemplate(
                                hintText: "Ps. Andrews Okyere",
                                controller: baptizedByController,
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
                                "Position held",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                height: 50,
                                width: 400,
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
                                              alignment: AlignmentDirectional
                                                  .centerStart,
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
                                "Communicant",
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
                                        "Yes",
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
                                        "No",
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonTemplate(
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
                  buttonWidth: 200,
                ),
                const SizedBox(
                  width: 10,
                ),
                ButtonTemplate(
                  buttonName: "Done",
                  buttonColor: Colors.deepPurple,
                  buttonHeight: 60,
                  buttonAction: () {
                    baptizedBy = baptizedByController.text.toString().trim();
                    positionHeld = dropdownValue.toString().trim();
                    communicant = groupValue.toString();
                    saveDataToLocalStorage(
                        baptizedBy, positionHeld, communicant);
                    setState(() {
                      Get.find<MyController>().increment();
                    });
                  },
                  fontColor: Colors.white,
                  textSize: 15,
                  buttonBorderRadius: 8,
                  buttonWidth: 200,
                ),
              ],
            )
          ],
        ),
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
