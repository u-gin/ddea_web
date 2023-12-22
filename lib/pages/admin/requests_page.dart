import 'dart:typed_data';

import 'package:ddea_web/helpers/firebase_provider.dart';
import 'package:ddea_web/pages/admin/requests_details_page.dart';
import 'package:ddea_web/pages/admin/user_list_template.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import '../../helpers/firebase_service.dart';
import '../../utils/constants.dart';

class RequestsPage extends StatefulWidget {
  const RequestsPage({super.key});
  static const String routeName = "requests";

  @override
  State<RequestsPage> createState() => _RequestsPageState();
}

class _RequestsPageState extends State<RequestsPage> {
  final FirebaseDatabase databaseInstance = FirebaseDatabase.instance;
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  FirebaseService get service => GetIt.I<FirebaseService>();

  bool isImageLoading = false;
  String? userImageUrl;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[10],
      body: SizedBox(
        height: canvasHeight,
        width: canvasWidth,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 220),
                child: Text(
                  "All request",
                  style: memberDetailsHeaderTextStyle(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 50, left: 220),
                child: Text(
                  "Click on a member to view and verify details",
                  style: memberDetailsQTextStyle(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 50,
                        height: 50,
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      SizedBox(
                        width: 200,
                        child: Center(
                          child: Text(
                            "Full name",
                            style: headerTextStyle(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 150,
                    child: Center(
                      child: Text(
                        "Telephone",
                        style: headerTextStyle(),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    child: Center(
                      child: Text(
                        "Date of birth",
                        style: headerTextStyle(),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    child: Center(
                      child: Text(
                        "Date joined",
                        style: headerTextStyle(),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    child: Center(
                      child: Text(
                        "Connect group",
                        style: headerTextStyle(),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Consumer<FirebaseProvider>(
                  builder: (context, firebase, child) {
                    if (firebase.allRequests.isEmpty) {
                      return SizedBox(
                        width: canvasWidth,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 40.0),
                          child: Center(
                            child: Text(
                              'No data available for this category',
                              textAlign: TextAlign.center,
                              style: textStyle(),
                            ),
                          ),
                        ),
                      );
                    }
                    if (firebase.isLoading) {
                      return const Center(
                        child: SizedBox(
                          height: 25,
                          width: 25,
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.deepPurple,
                            strokeWidth: 3,
                          ),
                        ),
                      );
                    }

                    return ListView.builder(
                      itemCount: firebase.allRequests.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.to(
                              () => const RequestsDetailsPage(),
                              arguments: [
                                firebase.allRequests[index],
                                getUserImageUrl(
                                  firebase.allRequests[index].telephone!,
                                )
                              ],
                            );
                          },
                          child: UserListTemplate(
                            key:
                                ValueKey(firebase.allRequests[index].fullName!),
                            imageUrl: getUserImageUrl(
                                firebase.allRequests[index].telephone!),
                            fullName: firebase.allRequests[index].fullName!,
                            telephone: firebase.allRequests[index].telephone!,
                            dateOfBirth:
                                firebase.allRequests[index].dateOfBirth!,
                            dateJoined: firebase.allRequests[index].dateAdded!,
                            connectGroup:
                                firebase.allRequests[index].connectGroup!,
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<Uint8List?> getUserImageUrl(String userId) async {
    try {
      final Reference reference =
          FirebaseStorage.instance.ref('ddea/$userId.jpg');
      final Uint8List? imageBytes = await reference.getData();
      return imageBytes;
    } catch (e) {
      debugPrint('Error retrieving user image: $e');
      return null; // Return null if the image doesn't exist or an error occurs.
    }
  }
}
