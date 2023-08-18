import 'package:ddea_web/utils/colors.dart';
import 'package:flutter/material.dart';

import '../widgets/button_template.dart';
import 'package:firebase_database/firebase_database.dart';

class ConfirmSubmissionPage extends StatelessWidget {
  ConfirmSubmissionPage({super.key});

  final FirebaseDatabase database = FirebaseDatabase.instance;

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
                      rowItem("Fullname", "Eugene Ofori Asiedu"),
                      rowItem("Mobile number", "+233506138718"),
                      rowItem("Place of birth", "Dansoman"),
                      rowItem("Hometown", "Hohoe"),
                      rowItem("Gender", "Male"),
                      rowItem("Date of birth", "1/11/1990"),
                      rowItem("Place of residence", "Dansoman"),
                      rowItem("Residential address", "Hughes Street"),
                      rowItem("Profession", "Police"),
                      rowItem("Place of work", "Dansoman Police Station"),
                      rowItem("Baptized by", "Pastor Andrews Okyere"),
                      rowItem("Position held", "Member"),
                      rowItem("Communicant", "Yes"),
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
                    /* setState(() {
                      Get.find<MyController>().increment();
                    }); */
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

  sendDataToDatabase() {}
}
