import 'package:ddea_web/widgets/button_template.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';
import '../../utils/my_controller.dart';
import '../../widgets/text_field_template.dart';

class MobileProfessionalDetailsPage extends StatefulWidget {
  const MobileProfessionalDetailsPage({super.key});

  @override
  State<MobileProfessionalDetailsPage> createState() =>
      _MobileProfessionalDetailsPageState();
}

class _MobileProfessionalDetailsPageState
    extends State<MobileProfessionalDetailsPage> {
  late TextEditingController placeOfResidenceController;
  late TextEditingController residentialAddressController;
  late TextEditingController placeOfWorkController;
  late TextEditingController professionController;

  late String placeOfResidence, residentialAddress, placeOfWork, profession;

  int groupValue = 0;

  @override
  void initState() {
    placeOfResidenceController = TextEditingController();
    residentialAddressController = TextEditingController();
    placeOfWorkController = TextEditingController();
    professionController = TextEditingController();
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
                  "Professional Details".toUpperCase(),
                  style: const TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 14.0,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const Text(
            "Place of residence",
            style: TextStyle(
              color: Colors.black,
              fontSize: 13.0,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w400,
            ),
          ),
          TextFieldTemplate(
            hintText: "Awoshie",
            controller: placeOfResidenceController,
            obscureText: false,
            height: 40,
            textInputType: TextInputType.name,
            textInputAction: TextInputAction.next,
            enabled: true,
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "Residential address",
            style: TextStyle(
              color: Colors.black,
              fontSize: 13.0,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w400,
            ),
          ),
          TextFieldTemplate(
            hintText: "Hughes Street, Ablekuma",
            controller: residentialAddressController,
            obscureText: false,
            height: 40,
            textInputType: TextInputType.text,
            textInputAction: TextInputAction.next,
            enabled: true,
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "Profession",
            style: TextStyle(
              color: Colors.black,
              fontSize: 13.0,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w400,
            ),
          ),
          TextFieldTemplate(
            hintText: "Police",
            controller: professionController,
            obscureText: false,
            height: 40,
            textInputType: TextInputType.name,
            textInputAction: TextInputAction.next,
            enabled: true,
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "Place of work",
            style: TextStyle(
              color: Colors.black,
              fontSize: 13.0,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w400,
            ),
          ),
          TextFieldTemplate(
            hintText: "Ghana Revenue Authority",
            controller: placeOfWorkController,
            obscureText: false,
            height: 40,
            textInputType: TextInputType.name,
            textInputAction: TextInputAction.next,
            enabled: true,
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
                  buttonName: "Prevous",
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
                  //buttonWidth: 200,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 1,
                child: ButtonTemplate(
                  buttonName: "Next",
                  buttonColor: Colors.deepPurple,
                  buttonHeight: 60,
                  buttonAction: () {
                    if (placeOfResidenceController.text == "" ||
                        residentialAddressController.text == "" ||
                        professionController.text == "" ||
                        placeOfWorkController.text == "") {
                      Get.snackbar(
                        "Warrning",
                        "All fields are required!!",
                        colorText: Colors.white,
                        backgroundColor: Colors.red,
                        borderRadius: 8.0,
                        margin:
                            const EdgeInsets.only(top: 60, left: 30, right: 30),
                        duration: const Duration(seconds: 5),
                      );
                    } else {
                      placeOfResidence =
                          placeOfResidenceController.text.toString().trim();
                      residentialAddress =
                          residentialAddressController.text.toString().trim();
                      profession = professionController.text.toString().trim();
                      placeOfWork =
                          placeOfWorkController.text.toString().trim();
                      saveDataToLocalStorage(placeOfResidence,
                          residentialAddress, profession, placeOfWork);
                      setState(() {
                        Get.find<MyController>().increment();
                      });
                    }
                  },
                  fontColor: Colors.white,
                  textSize: 15,
                  buttonBorderRadius: 8,
                  //buttonWidth: 200,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  saveDataToLocalStorage(String placeOfResidence, String residentialAddress,
      String profession, String placeOfWork) {
    storage.write("placeOfResidence", placeOfResidence);
    storage.write("residentialAddress", residentialAddress);
    storage.write("profession", profession);
    storage.write("placeOfWork", placeOfWork);
  }
}
