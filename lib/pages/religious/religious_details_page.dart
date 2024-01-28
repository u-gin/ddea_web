import 'dart:js_util';

import 'package:ddea_web/pages/religious/constants.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/my_controller.dart';
import '../../widgets/button_template.dart';
import '../../widgets/text_field_template.dart';

class ReligiousDetailsPage extends StatefulWidget {
  const ReligiousDetailsPage({
    super.key,
  });

  @override
  State<ReligiousDetailsPage> createState() => _ReligiousDetailsPageState();
}

class _ReligiousDetailsPageState extends State<ReligiousDetailsPage> {
  final FirebaseDatabase database = FirebaseDatabase.instance;

  late TextEditingController baptizedByController;
  List<bool> checkedItems =
      List.generate(ministryList.length, (index) => false);

  late String baptizedBy, communicant;

  late Offset buttonPosition;
  late Size buttonSize;
  OverlayEntry? _overlayEntry;
  bool isMenuOpen = false;
  late GlobalKey keyPositionHeld,
      keyShepherd,
      keyConnectGroup,
      keyMinistry,
      keyBaptismReceived;
  int groupValue = 0;
  String communicantValue = "";

  String positionHeld = "Please select";
  String shepherd = "N/A";
  String ministry = "Please select as many as apply";
  String connectGroup = "Please select";
  String baptismType = "Please select";
  List selectedMinistryList = [];

  bool showShepherd = false;

  @override
  void initState() {
    baptizedByController = TextEditingController();
    keyPositionHeld = LabeledGlobalKey("button_icon");
    keyShepherd = LabeledGlobalKey("button_icon");
    keyConnectGroup = LabeledGlobalKey("button_icon");
    keyMinistry = LabeledGlobalKey("button_icon");
    keyBaptismReceived = LabeledGlobalKey("button_icon");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      connectGroup = connectGroupList[
          modulo(numberOfEntriesMade!, connectGroupList.length)];

      if (showShepherd) {
        shepherd =
            shepherdList[modulo(numberOfMembersEntered!, shepherdList.length)];
      }
    });
    return GestureDetector(
        onTap: () => closeMenu(),
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
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
                        requiredInfoDesktop(),
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
                                  height: 50,
                                  textInputType: TextInputType.name,
                                  textInputAction: TextInputAction.next,
                                  enabled: true,
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Column(
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
                                  GestureDetector(
                                    onTap: () {
                                      if (isMenuOpen) {
                                        closeMenu();
                                      } else {
                                        openPositionHeldMenu(
                                            setState, keyPositionHeld);
                                      }
                                    },
                                    child: Container(
                                      key: keyPositionHeld,
                                      height: 50,
                                      width: 300,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
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
                                              positionHeld,
                                              style: positionHeld ==
                                                      "Please select"
                                                  ? TextStyle(
                                                      color: AppColors
                                                          .hintTextColor,
                                                      fontSize: 14.0,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    )
                                                  : TextStyle(
                                                      color: AppColors.black,
                                                      fontSize: 17.0,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                            ),
                                            Icon(
                                              Icons.keyboard_arrow_down,
                                              color: AppColors.colorFromHex(
                                                  "#C6CDD3"),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Baptism received",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.0,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      if (isMenuOpen) {
                                        closeMenu();
                                      } else {
                                        openBaptismTypeMenu(
                                            setState, keyBaptismReceived);
                                      }
                                    },
                                    child: Container(
                                      key: keyBaptismReceived,
                                      height: 50,
                                      width: 300,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
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
                                              baptismType,
                                              style: baptismType ==
                                                      "Please select"
                                                  ? TextStyle(
                                                      color: AppColors
                                                          .hintTextColor,
                                                      fontSize: 14.0,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    )
                                                  : TextStyle(
                                                      color: AppColors.black,
                                                      fontSize: 17.0,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                            ),
                                            Icon(
                                              Icons.keyboard_arrow_down,
                                              color: AppColors.colorFromHex(
                                                  "#C6CDD3"),
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
                                            inactiveBorderColor:
                                                Colors.transparent,
                                            activeBorderColor:
                                                Colors.deepPurple,
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
                                            inactiveBorderColor:
                                                Colors.transparent,
                                            activeBorderColor:
                                                Colors.deepPurple,
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
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 10.0, left: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Ministry",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.0,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      if (isMenuOpen) {
                                        closeMenu();
                                      } else {
                                        openMinistryMenu(setState, keyMinistry);
                                      }
                                    },
                                    child: Container(
                                      key: keyMinistry,
                                      height: 50,
                                      width: 300,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        color: Colors.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: 200,
                                              child: Text(
                                                ministry,
                                                style: ministry ==
                                                        "Please select as many as apply"
                                                    ? TextStyle(
                                                        color: AppColors
                                                            .hintTextColor,
                                                        fontSize: 14.0,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      )
                                                    : TextStyle(
                                                        color: AppColors.black,
                                                        fontSize: 17.0,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                              ),
                                            ),
                                            Icon(
                                              Icons.keyboard_arrow_down,
                                              color: AppColors.colorFromHex(
                                                  "#C6CDD3"),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Connect group",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.0,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  GestureDetector(
                                    /* onTap: () {
                                      if (isMenuOpen) {
                                        closeMenu();
                                      } else {
                                        openConnectGroupMenu(
                                            setState, keyConnectGroup);
                                      }
                                    }, */
                                    child: Container(
                                      key: keyConnectGroup,
                                      height: 50,
                                      width: 300,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
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
                                              connectGroup,
                                              style: connectGroup ==
                                                      "Please select"
                                                  ? TextStyle(
                                                      color: AppColors
                                                          .hintTextColor,
                                                      fontSize: 14.0,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    )
                                                  : TextStyle(
                                                      color: AppColors.black,
                                                      fontSize: 17.0,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                            ),
                                            Icon(
                                              Icons.keyboard_arrow_down,
                                              color: AppColors.colorFromHex(
                                                  "#C6CDD3"),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        showShepherd
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Shepherd",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.0,
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        GestureDetector(
                                          /* onTap: () {
                                      if (isMenuOpen) {
                                        closeMenu();
                                      } else {
                                        openConnectGroupMenu(
                                            setState, keyConnectGroup);
                                      }
                                    }, */
                                          child: Container(
                                            key: keyShepherd,
                                            height: 50,
                                            width: 300,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              color: Colors.white,
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    shepherd,
                                                    style: shepherd == "N/A"
                                                        ? TextStyle(
                                                            color: AppColors
                                                                .hintTextColor,
                                                            fontSize: 14.0,
                                                            fontFamily:
                                                                'Poppins',
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          )
                                                        : TextStyle(
                                                            color:
                                                                AppColors.black,
                                                            fontSize: 17.0,
                                                            fontFamily:
                                                                'Poppins',
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                  ),
                                                  Icon(
                                                    Icons.keyboard_arrow_down,
                                                    color:
                                                        AppColors.colorFromHex(
                                                            "#C6CDD3"),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 300,
                                  )
                                ],
                              )
                            : const SizedBox()
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
                        if (baptizedByController.text == "" ||
                            positionHeld == "Please select" ||
                            connectGroup == "Please select" ||
                            ministry == "Please select as many as apply" ||
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
                          baptizedBy =
                              baptizedByController.text.toString().trim();
                          positionHeld = positionHeld.toString().trim();
                          communicant = communicantValue.toString();

                          saveDataToLocalStorage(
                            baptizedBy,
                            positionHeld,
                            communicant,
                            ministry,
                            connectGroup,
                            baptismType,
                            shepherd,
                          );
                          if (showShepherd) {
                            final DatabaseReference numberOfMembersRef =
                                database.ref("ddea/number_of_members");
                            if (numberOfMembersEntered != null) {
                              int updatedValue = numberOfMembersEntered! + 1;
                              numberOfMembersRef
                                  .set(updatedValue)
                                  .then((value) {
                                setState(() {
                                  isMember = true;
                                  Get.find<MyController>().increment();
                                });
                              });
                            }
                          } else {
                            setState(() {
                              Get.find<MyController>().increment();
                            });
                          }
                        }
                        //Get.find<MyController>().increment();
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
        ));
  }

  saveDataToLocalStorage(
    String baptizedBy,
    String positionHeld,
    String communicant,
    String ministry,
    String connectGroup,
    String baptismType,
    String shepherd,
  ) {
    userDetails["baptizedBy"] = baptizedBy;
    userDetails["positionHeld"] = positionHeld;
    userDetails["communicant"] = communicant;
    userDetails["shepherd"] = shepherd;
    userDetails["ministry"] = ministry;
    userDetails["connectGroup"] = connectGroup;
    userDetails["baptismType"] = baptismType;
  }

  OverlayEntry _overlayEntryBuilder(
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
                height: 200,
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
  }

  closeMenu() {
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

  void openPositionHeldMenu(StateSetter setState, GlobalKey key) {
    findButton(key);
    _overlayEntry = _overlayEntryBuilder(positionHeldDropdown(setState, key),
        buttonPosition.dx, buttonSize.width, null);
    Overlay.of(context).insert(_overlayEntry!);
    isMenuOpen = !isMenuOpen;
  }

  void openShepherdMenu(StateSetter setState, GlobalKey key) {
    findButton(key);
    _overlayEntry = _overlayEntryBuilder(shepherdDropdown(setState, key),
        buttonPosition.dx, buttonSize.width, null);
    Overlay.of(context).insert(_overlayEntry!);
    isMenuOpen = !isMenuOpen;
  }

  void openMinistryMenu(StateSetter setState, GlobalKey key) {
    findButton(key);
    _overlayEntry = _overlayEntryBuilder(ministryDropdown(setState, key),
        buttonPosition.dx, buttonSize.width, null);
    Overlay.of(context).insert(_overlayEntry!);
    isMenuOpen = !isMenuOpen;
  }

  void openConnectGroupMenu(StateSetter setState, GlobalKey key) {
    findButton(key);
    _overlayEntry = _overlayEntryBuilder(connectGroupDropdown(setState, key),
        buttonPosition.dx, buttonSize.width, null);
    Overlay.of(context).insert(_overlayEntry!);
    isMenuOpen = !isMenuOpen;
  }

  void openBaptismTypeMenu(StateSetter setState, GlobalKey key) {
    findButton(key);
    _overlayEntry = _overlayEntryBuilder(baptismTypeDropdown(setState, key),
        buttonPosition.dx, buttonSize.width, null);
    Overlay.of(context).insert(_overlayEntry!);
    isMenuOpen = !isMenuOpen;
  }

  positionHeldDropdown(StateSetter setState, GlobalKey key) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
        padding: const EdgeInsets.all(10),
        shrinkWrap: false,
        itemCount: positionHeldList.length,
        itemBuilder: ((context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                positionHeld = positionHeldList[index];
                if (positionHeld == "Member (M)") {
                  setState(() {
                    showShepherd = true;
                  });
                } else {
                  setState(() {
                    showShepherd = false;
                  });
                }
                closeMenu();
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                positionHeldList[index],
                style: const TextStyle(
                  fontSize: 14,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  shepherdDropdown(StateSetter setState, GlobalKey key) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: shepherdList.length,
        physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics()),
        itemBuilder: ((context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                shepherd = shepherdList[index];
                closeMenu();
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                shepherdList[index],
                style: const TextStyle(
                  fontSize: 14,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  ministryDropdown(StateSetter setState, GlobalKey key) {
    return StatefulBuilder(builder: (context, setStater) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: [
            Expanded(
              flex: 8,
              child: ListView.builder(
                padding: const EdgeInsets.all(10),
                shrinkWrap: false,
                itemCount: ministryList.length,
                itemBuilder: ((context, index) {
                  return CheckboxListTile(
                    title: Text(
                      ministryList[index],
                      style: const TextStyle(
                        fontSize: 14,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    autofocus: false,
                    activeColor: Colors.deepPurple,
                    checkColor: Colors.white,
                    selected: checkedItems[index],
                    value: checkedItems[index],
                    onChanged: (bool? value) {
                      setStater(() {
                        checkedItems[index] = value!;
                        if (selectedMinistryList
                            .contains(ministryList[index])) {
                          selectedMinistryList.remove(ministryList[index]);
                        } else {
                          selectedMinistryList.add(ministryList[index]);
                        }
                        debugPrint(selectedMinistryList.length.toString());
                      });
                    },
                  );
                }),
              ),
            ),
            Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    String allMinistries = "";
                    for (int i = 0; i < selectedMinistryList.length; i++) {
                      allMinistries += selectedMinistryList[i];
                      if (i == selectedMinistryList.length - 1) {
                        break;
                      } else {
                        allMinistries = allMinistries + "," + " ";
                      }
                    }
                    ministry = allMinistries;
                    debugPrint(ministry);
                  });
                  closeMenu();
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(8)),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Text(
                      "Done",
                      style: TextStyle(
                        fontSize: 10,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    });
  }

  connectGroupDropdown(StateSetter setState, GlobalKey key) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
        padding: const EdgeInsets.all(10),
        shrinkWrap: false,
        itemCount: connectGroupList.length,
        itemBuilder: ((context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                connectGroup = connectGroupList[index];
                closeMenu();
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                connectGroupList[index],
                style: const TextStyle(
                  fontSize: 14,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  baptismTypeDropdown(StateSetter setState, GlobalKey key) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
        padding: const EdgeInsets.all(10),
        shrinkWrap: false,
        itemCount: baptismTypeList.length,
        itemBuilder: ((context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                baptismType = baptismTypeList[index];
                closeMenu();
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                baptismTypeList[index],
                style: const TextStyle(
                  fontSize: 14,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
