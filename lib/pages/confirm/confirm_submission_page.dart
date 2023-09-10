import 'package:ddea_web/pages/success/desktop_success_page.dart';
import 'package:ddea_web/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';
import '../../widgets/button_template.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ConfirmSubmissionPage extends StatefulWidget {
  const ConfirmSubmissionPage({super.key});

  @override
  State<ConfirmSubmissionPage> createState() => _ConfirmSubmissionPageState();
}

class _ConfirmSubmissionPageState extends State<ConfirmSubmissionPage> {
  final FirebaseDatabase database = FirebaseDatabase.instance;
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  bool isLoading = false;

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
                              Icons.check_circle,
                              color: Colors.deepPurple,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Confirm Details".toUpperCase(),
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
                      rowItem("Fullname", userDetails["fullName"]),
                      rowItem("Mobile number", userDetails["telephone"]),
                      rowItem("Date of birth", userDetails["dateOfBirth"]),
                      rowItem("Hometown", userDetails["hometown"]),
                      rowItem("Gender", userDetails["gender"]),
                      rowItem("Place of birth", userDetails["placeOfBirth"]),
                      rowItem("Place of residence",
                          userDetails["placeOfResidence"]),
                      rowItem("Residential address",
                          userDetails["residentialAddress"]),
                      rowItem("Profession", userDetails["profession"]),
                      rowItem("Place of work", userDetails["placeOfWork"]),
                      rowItem("Baptized by", userDetails["baptizedBy"]),
                      rowItem("Position held", userDetails["positionHeld"]),
                      rowItem("Communicant", userDetails["communicant"]),
                      rowItem("Shepherd", userDetails["shepherd"]),
                      rowItem("Ministry", userDetails["ministry"]),
                      rowItem("Connect group", userDetails["connectGroup"]),
                      rowItem("Baptism received", userDetails["baptismType"]),
                      rowItem("Date added", convertDate(DateTime.now())),
                      rowItem("Time added", convertTime(DateTime.now())),
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
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonTemplate(
                  buttonName: "Edit",
                  buttonColor: const Color.fromARGB(255, 174, 78, 191),
                  buttonHeight: 60,
                  buttonAction: () {
                    /* setState(() {
                      Get.find<MyController>().decrement();
                    }); */
                  },
                  fontColor: Colors.white,
                  textSize: 15,
                  buttonBorderRadius: 8,
                  buttonWidth: 100,
                ),
                const SizedBox(
                  width: 10,
                ),
                ButtonTemplate(
                  buttonName: "Finish",
                  buttonColor: Colors.deepPurple,
                  buttonHeight: 60,
                  loading: isLoading,
                  buttonAction: () {
                    setState(() {
                      isLoading = true;
                    });
                    sendDataToFirebase((success) {
                      if (success) {
                        Get.to(() => const DesktopSuccessPage());
                      } else {
                        debugPrint("Failed");
                      }
                    });
                    //Get.to(() => const DesktopSuccessPage());
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

  rowItem(String labelText, String answerText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            '$labelText: ',
            textAlign: TextAlign.end,
            style: TextStyle(
              fontFamily: "Poppins",
              fontWeight: FontWeight.w500,
              fontSize: 16.0,
              color: AppColors.black,
            ),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Expanded(
          child: Text(
            answerText,
            textAlign: TextAlign.start,
            style: const TextStyle(
              fontFamily: "Poppins",
              fontWeight: FontWeight.w700,
              fontSize: 18.0,
              color: Colors.deepPurpleAccent,
            ),
          ),
        ),
      ],
    );
  }

  sendDataToFirebase(Function(bool success) callback) async {
    final databaseReference = database.ref("ddea/members");
    final firebaseStorageReference = firebaseStorage.ref("ddea/members");

    await databaseReference.push().set({
      "Fullname": userDetails["fullName"],
      "Mobile number": userDetails["telephone"],
      "Place of birth": userDetails["placeOfBirth"],
      "Hometown": userDetails["hometown"],
      "Gender": userDetails["gender"],
      "Date of birth": userDetails["dateOfBirth"],
      "Place of residence": userDetails["placeOfResidence"],
      "Residential address": userDetails["residentialAddress"],
      "Profession": userDetails["profession"],
      "Place of work": userDetails["placeOfWork"],
      "Baptized by": userDetails["baptizedBy"],
      "Position held": userDetails["positionHeld"],
      "Communicant": userDetails["communicant"],
      "Shepherd": userDetails["shepherd"],
      "Baptism received": userDetails["baptismType"],
      "Connect group": userDetails["connectGroup"],
      "Ministry": userDetails["ministry"],
      "Date added": convertDate(DateTime.now()),
      "Time added": convertTime(DateTime.now()),
    }).then((value) {
      firebaseStorageReference.putData(userDetails["imageBytes"]).then((value) {
        setState(() {
          isLoading = false;
        });
        callback(true);
      }).catchError((error) {
        setState(() {
          isLoading = false;
        });
        callback(false);
      });
    }).catchError((error) {
      setState(() {
        isLoading = false;
      });
      callback(false);
    });
  }
}
