import 'dart:typed_data';

import 'package:ddea_web/utils/colors.dart';
import 'package:ddea_web/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MemberDetailsPage extends StatelessWidget {
  MemberDetailsPage({super.key});

  final List member = Get.arguments;

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
                            /* return ClipOval(
                              child: Container(
                                width: 150,
                                height: 150,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: MemoryImage(
                                      url,
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ); */
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
                      height: 5,
                    ),
                    Text(
                      member[0].copId,
                      style: memberIDTextStyle(),
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
}
