import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:ddea_web/utils/constants.dart';
import 'package:ddea_web/widgets/button_template.dart';
import 'package:intl/intl.dart';
import '../../utils/colors.dart';
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
  late Offset buttonPosition;
  late Size buttonSize;
  OverlayEntry? _overlayEntry;
  bool isMenuOpen = false;

  DateTime selectedDay = DateTime.now();
  final DateTime _currentDay = DateTime.now();
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
    //dateOfBirthController = TextEditingController();
    keyDate = LabeledGlobalKey("button_icon");
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
                          const Text(
                            "Date of birth",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w400,
                            ),
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
                                        selectedGeder = "Male";
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
                /* if (nameController.text == "" ||
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
                } */
                Get.find<MyController>().increment();
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

  /* OverlayEntry _overlayEntryBuilder(
      Widget overlayToOpen, double? left, double width, double? right) {
    return OverlayEntry(
      builder: (context) {
        return Positioned(
          top: buttonPosition.dy + buttonSize.height,
          left: left,
          right: right,
          width: width,
          child: Material(
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: overlayToOpen,
              ),
            ),
          ),
        );
      },
    );
  } */

  /* closeMenu() {
    if (_overlayEntry != null && _overlayEntry!.mounted) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
    isMenuOpen = !isMenuOpen;
  }

  findButton(GlobalKey key) {
    RenderBox? renderBox = key.currentContext!.findRenderObject() as RenderBox?;
    buttonSize = renderBox!.size;
    buttonPosition = renderBox.localToGlobal(Offset.zero);
  }

  void openDateMenu(StateSetter setState, GlobalKey key) {
    findButton(key);
    _overlayEntry = _overlayEntryBuilder(
        tableCalendar(setState), buttonPosition.dx, buttonSize.width, null);
    Overlay.of(context).insert(_overlayEntry!);
    isMenuOpen = !isMenuOpen;
  }

  tableCalendar(StateSetter setState) async {
    return await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.utc(1900, 1, 11),
      lastDate: DateTime.now(),
    );
  } */

  /* tableCalendar(StateSetter setState) {
    return TableCalendar(
      firstDay: DateTime.utc(1900, 1, 11),
      lastDay: DateTime.now(),
      focusedDay: _currentDay,
      currentDay: _currentDay,
      rowHeight: 32,
      calendarFormat: _calendarFormat,
      availableGestures: AvailableGestures.all,
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        leftChevronPadding: EdgeInsets.zero,
        leftChevronMargin: EdgeInsets.zero,
        rightChevronPadding: EdgeInsets.zero,
        rightChevronMargin: EdgeInsets.zero,
        titleTextStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.grey[900],
            fontFamily: "Metropolis"),
      ),
      daysOfWeekHeight: 24,
      startingDayOfWeek: StartingDayOfWeek.monday,
      daysOfWeekStyle: DaysOfWeekStyle(
        weekdayStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          fontFamily: "Metropolis",
          color: AppColors.colorFromHex("#0E1339"),
        ),
        weekendStyle: TextStyle(
          fontSize: 12,
          fontFamily: "Metropolis",
          fontWeight: FontWeight.w500,
          color: AppColors.colorFromHex("#0E1339"),
        ),
      ),
      calendarStyle: CalendarStyle(
        todayTextStyle: TextStyle(
          fontSize: 12,
          fontFamily: "Metropolis",
          fontWeight: FontWeight.w600,
          color: AppColors.primary,
        ),
        withinRangeDecoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.colorFromHex("#F4F5FB"),
        ),
        defaultTextStyle: TextStyle(
          fontSize: 12,
          fontFamily: "Metropolis",
          fontWeight: FontWeight.w600,
          color: AppColors.colorFromHex("#34405E"),
        ),
        outsideTextStyle: TextStyle(
          fontSize: 12,
          fontFamily: "Metropolis",
          fontWeight: FontWeight.w600,
          color: AppColors.colorFromHex("#AEB2BF"),
        ),
        weekendTextStyle: TextStyle(
          fontSize: 12,
          fontFamily: "Metropolis",
          fontWeight: FontWeight.w600,
          color: AppColors.colorFromHex("#34405E"),
        ),
        defaultDecoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.colorFromHex("#F4F5FB"),
        ),
        weekendDecoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.colorFromHex("#F4F5FB"),
        ),
        todayDecoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.primaryLight,
        ),
        selectedDecoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.primary,
        ),
        selectedTextStyle: const TextStyle(
          fontSize: 12,
          fontFamily: "Metropolis",
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ), //
      ),
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
      onDaySelected: (selectedDay, currentDay) {
        if (selectedDay.isAfter(DateTime.now()) ||
            selectedDay == DateTime.now()) {
          Get.snackbar(
            "Error",
            "Please select a valid data of birth",
            colorText: Colors.white,
            backgroundColor: Colors.red,
            borderRadius: 8.0,
            margin: const EdgeInsets.only(top: 60, left: 380, right: 380),
            duration: const Duration(seconds: 5),
          );
        } else if (!isSameDay(_selectedDay, selectedDay)) {
          setState((() {
            _selectedDay = selectedDay;
            closeMenu();
          }));
        }
      },
      onFormatChanged: (format) {
        if (_calendarFormat != format) {
          setState(() {
            _calendarFormat = format;
          });
        }
      },
      onPageChanged: (focusedDay) {},
    );
  } */

  String convertDate(DateTime? dateToConvert) {
    final dateFormat = DateFormat('dd.MM.yyyy');
    if (dateToConvert == null) {
      return '00.00.00';
    } else {
      return dateFormat.format(dateToConvert);
    }
  }
}
