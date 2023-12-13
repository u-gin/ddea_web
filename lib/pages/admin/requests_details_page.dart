import 'dart:typed_data';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';

class RequestsDetailsPage extends StatefulWidget {
  const RequestsDetailsPage({super.key});
  static const String routeName = "requests";

  @override
  State<RequestsDetailsPage> createState() => _RequestsDetailsPageState();
}

class _RequestsDetailsPageState extends State<RequestsDetailsPage> {
  final List member = Get.arguments;
  final FirebaseDatabase database = FirebaseDatabase.instance;

  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: Container(
                height: canvasHeight,
                color: AppColors.lightGray,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FutureBuilder<Uint8List?>(
                      future: member[1],
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          final Uint8List? url = snapshot.data;
                          if (url != null) {
                            return CircleAvatar(
                              radius: 150,
                              backgroundImage: MemoryImage(url),
                              child: ClipOval(
                                child: Image.memory(
                                  url,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          } else {
                            return const Icon(
                              Icons.person,
                              color: Colors.grey,
                              size: 30,
                            );
                          }
                        } else if (snapshot.hasError) {
                          return const Icon(
                            Icons.error,
                            color: Colors.red,
                            size: 20,
                          );
                        } else {
                          // The Future is still loading.
                          return const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.deepPurple,
                            ),
                          ); // You can use any loading indicator.
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      member[0].fullName.toString().toUpperCase(),
                      style: memberDetailsHeaderTextStyle(),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      member[0].telephone,
                      style: memberDetailsTextStyle(),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isLoading = true;
                            });
                          },
                          child: Container(
                            width: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.redAccent,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Center(
                                child: isLoading
                                    ? SizedBox(
                                        height: 16,
                                        width: 16,
                                        child: CircularProgressIndicator(
                                          backgroundColor: AppColors.white,
                                          strokeWidth: 1,
                                        ),
                                      )
                                    : const Text(
                                        'Disapprove',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isLoading = true;
                            });
                            moveToApprovedList((success) {
                              if (success) {
                                Get.back();
                              } else {
                                Get.back();
                              }
                            });
                          },
                          child: Container(
                            width: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.deepPurple,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Center(
                                child: isLoading
                                    ? SizedBox(
                                        height: 16,
                                        width: 16,
                                        child: CircularProgressIndicator(
                                          backgroundColor: AppColors.white,
                                          strokeWidth: 1,
                                        ),
                                      )
                                    : const Text(
                                        'Approve',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Date of birth",
                          style: memberDetailsQTextStyle(),
                        ),
                        Text(
                          member[0].dateOfBirth.toString().toUpperCase(),
                          style: memberDetailsATextStyle(),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Place of birth",
                          style: memberDetailsQTextStyle(),
                        ),
                        Text(
                          member[0].placeOfBirth.toString().toUpperCase(),
                          style: memberDetailsATextStyle(),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Hometown",
                          style: memberDetailsQTextStyle(),
                        ),
                        Text(
                          member[0].hometown.toString().toUpperCase(),
                          style: memberDetailsATextStyle(),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Place of work",
                          style: memberDetailsQTextStyle(),
                        ),
                        Text(
                          member[0].placeOfWork.toString().toUpperCase(),
                          style: memberDetailsATextStyle(),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Occupation",
                          style: memberDetailsQTextStyle(),
                        ),
                        Text(
                          member[0].occupation.toString().toUpperCase(),
                          style: memberDetailsATextStyle(),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Communicant",
                          style: memberDetailsQTextStyle(),
                        ),
                        Text(
                          member[0].communicant.toString().toUpperCase(),
                          style: memberDetailsATextStyle(),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Connect group",
                          style: memberDetailsQTextStyle(),
                        ),
                        Text(
                          member[0].connectGroup.toString().toUpperCase(),
                          style: memberDetailsATextStyle(),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Shepherd",
                          style: memberDetailsQTextStyle(),
                        ),
                        Text(
                          member[0].shepherd.toString().toUpperCase(),
                          style: memberDetailsATextStyle(),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Gender",
                          style: memberDetailsQTextStyle(),
                        ),
                        Text(
                          member[0].gender.toString().toUpperCase(),
                          style: memberDetailsATextStyle(),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Place of residence",
                          style: memberDetailsQTextStyle(),
                        ),
                        Text(
                          member[0].placeOfResidence.toString().toUpperCase(),
                          style: memberDetailsATextStyle(),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Resendtial address",
                          style: memberDetailsQTextStyle(),
                        ),
                        Text(
                          member[0].residentialAddress.toString().toUpperCase(),
                          style: memberDetailsATextStyle(),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Baptized by",
                          style: memberDetailsQTextStyle(),
                        ),
                        Text(
                          member[0].baptizedBy.toString().toUpperCase(),
                          style: memberDetailsATextStyle(),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Baptism type",
                          style: memberDetailsQTextStyle(),
                        ),
                        Text(
                          member[0].baptismType.toString().toUpperCase(),
                          style: memberDetailsATextStyle(),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Position held",
                          style: memberDetailsQTextStyle(),
                        ),
                        Text(
                          member[0].positionHeld.toString().toUpperCase(),
                          style: memberDetailsATextStyle(),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Ministry",
                          style: memberDetailsQTextStyle(),
                        ),
                        Text(
                          member[0].ministry.toString().toUpperCase(),
                          style: memberDetailsATextStyle(),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Date added",
                          style: memberDetailsQTextStyle(),
                        ),
                        Text(
                          member[0].dateAdded.toString().toUpperCase(),
                          style: memberDetailsATextStyle(),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  moveToApprovedList(Function(bool success) callback) async {
    final databaseReference =
        database.ref("ddea/approved/members/${userDetails["positionHeld"]}");

    await databaseReference.push().set({
      "Fullname": member[0].fullName,
      "Mobile number": member[0].telephone,
      "Place of birth": member[0].placeOfBirth,
      "Hometown": member[0].hometown,
      "Gender": member[0].gender,
      "Date of birth": member[0].dateOfBirth,
      "Place of residence": member[0].placeOfResidence,
      "Residential address": member[0].residentialAddress,
      "Profession": member[0].profession,
      "Place of work": member[0].placeOfWork,
      "Baptized by": member[0].baptizedBy,
      "Position held": member[0].positionHeld,
      "Communicant": member[0].communicant,
      "Shepherd": member[0].shepherd,
      "Baptism received": member[0].baptismType,
      "Connect group": member[0].connectGroup,
      "Ministry": member[0].connectGroup,
      "Date added": member[0].dateAdded,
      "Time added": member[0].timeAdded,
    }).then((value) {
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
  }

  deleteEntry(Function(bool success) callback) async {
    final databaseReference =
        database.ref("ddea/members/${userDetails["positionHeld"]}");

    //databaseReference.ref.child(path)
  }
}
