import 'package:ddea_web/pages/success/desktop_success_page.dart';
import 'package:ddea_web/utils/colors.dart';
import 'package:ddea_web/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/button_template.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ConfirmSubmissionPage extends StatelessWidget {
  ConfirmSubmissionPage({super.key});

  final FirebaseDatabase database = FirebaseDatabase.instance;
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;

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
                      /* rowItem("Fullname", storage.read("fullName")),
                      rowItem("Mobile number", storage.read("telephone")),
                      rowItem("Place of birth", storage.read("dateOfBirth")),
                      rowItem("Hometown", storage.read("hometown")),
                      rowItem("Gender", storage.read("gender")),
                      rowItem("Date of birth", storage.read("placeOfBirth")),
                      rowItem("Place of residence",
                          storage.read("placeOfResidence")),
                      rowItem("Residential address",
                          storage.read("residentialAddress")),
                      rowItem("Profession", storage.read("profession")),
                      rowItem("Place of work", storage.read("placeOfWork")),
                      rowItem("Baptized by", storage.read("baptizedBy")),
                      rowItem("Position held", storage.read("positionHeld")),
                      rowItem("Communicant", storage.read("communicant")), */
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
                  buttonAction: () {
                    /* sendDataToFirebase((success) {
                      if (success) {
                        debugPrint("Successful");
                        Get.to(() => const SuccessPage());
                      } else {
                        debugPrint("Failed");
                      }
                    }); */
                    Get.to(() => const DesktopSuccessPage());
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
    final firebaseStorageReference =
        firebaseStorage.ref("ddea/${storage.read("fullName")}");

    await databaseReference.push().set({
      "Fullname": storage.read("fullName"),
      "Mobile number": storage.read("telephone"),
      "Place of birth": storage.read("placeOfBirth"),
      "Hometown": storage.read("hometown"),
      "Gender": storage.read("gender"),
      "Date of birth": storage.read("dateOfBirth"),
      "Place of residence": storage.read("placeOfResidence"),
      "Residential address": storage.read("residentialAddress"),
      "Profession": storage.read("profession"),
      "Place of work": storage.read("placeOfWork"),
      "Baptized by": storage.read("baptizedBy"),
      "Position held": storage.read("positionHeld"),
      "Communicant": storage.read("communicant")
    }).then((value) {
      firebaseStorageReference.putData(storage.read("imageBtes")).then((value) {
        callback(true);
      }).catchError((error) {
        callback(false);
      });
    }).catchError((error) {
      callback(false);
    });
  }
}
