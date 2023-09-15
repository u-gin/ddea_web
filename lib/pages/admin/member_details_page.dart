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
                            return ClipOval(
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
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/* 
 String? fullName;
  String? telephone;
  String? gender;
  String? dateOfBirth;
  String? hometown;
  String? placeOfResidence;
  String? residentialAddress;
  String? placeOfWork;
  String? occupation;
  String? baptizedBy;
  String? communicant;
  String? positionHeld;
  String? baptismType;
  String? connectGroup;
  String? dateAdded;
  String? ministry;
  String? placeOfBirth;
  String? shepherd;
  String? timeAdded;
 */
