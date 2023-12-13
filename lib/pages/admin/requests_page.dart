import 'dart:typed_data';

import 'package:ddea_web/pages/admin/requests_details_page.dart';
import 'package:ddea_web/pages/admin/user_list_template.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/user_model.dart';
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

  bool isLoading = false;
  bool isImageLoading = false;
  String? userImageUrl;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(allRequests);
    return Scaffold(
      backgroundColor: Colors.grey[10],
      body: isLoading
          ? const Center(
              child: SizedBox(
                height: 25,
                width: 25,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.deepPurple,
                  strokeWidth: 3,
                ),
              ),
            )
          : SizedBox(
              height: canvasHeight,
              width: canvasWidth,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
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
                      child: allRequests.isEmpty
                          ? SizedBox(
                              width: canvasWidth,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 40.0),
                                child: Text(
                                  'No data available for this category',
                                  textAlign: TextAlign.center,
                                  style: textStyle(),
                                ),
                              ),
                            )
                          : ListView.builder(
                              itemCount: allRequests.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Get.to(
                                      () => const RequestsDetailsPage(),
                                      arguments: [
                                        allRequests[index],
                                        getUserImageUrl(
                                          allRequests[index].telephone!,
                                        )
                                      ],
                                    );
                                  },
                                  child: UserListTemplate(
                                    key: ValueKey(allRequests[index].fullName!),
                                    imageUrl: getUserImageUrl(
                                        allRequests[index].telephone!),
                                    fullName: allRequests[index].fullName!,
                                    telephone: allRequests[index].telephone!,
                                    dateOfBirth:
                                        allRequests[index].dateOfBirth!,
                                    dateJoined: allRequests[index].dateAdded!,
                                    connectGroup:
                                        allRequests[index].connectGroup!,
                                  ),
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
