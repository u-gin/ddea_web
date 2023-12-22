import 'dart:typed_data';

import 'package:ddea_web/helpers/firebase_provider.dart';
import 'package:ddea_web/pages/admin/member_details_page.dart';
import 'package:ddea_web/pages/admin/requests_page.dart';
import 'package:ddea_web/pages/admin/user_list_template.dart';
import 'package:ddea_web/utils/constants.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});
  static const String routeName = "dashboard";

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late TextEditingController searchController;
  final FirebaseDatabase databaseInstance = FirebaseDatabase.instance;
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  /* List<dynamic> whichList = [
    FirebaseProvider().allRequests,
    justMembers,
    justElders,
    justDeaconesses,
    justDeacons,
  ]; */

  /* _DashboardState() {
    initializeFilteredList();
  } */

  //List<UserModel> filteredList = [];

  /* List<String> filterNames = [
    "All",
    "Members",
    "Elders",
    "Deaconesses",
    "Deacons"
  ]; */
  //bool isLoading = false;
  bool isImageLoading = false;
  String? userImageUrl;

  //int selectedIndex = 0;

  @override
  void initState() {
    searchController = TextEditingController();
    super.initState();
  }

  /* void runSearch(List<UserModel> mainList, String value) {
    List<UserModel> results = [];
    if (value.isEmpty) {
      results = mainList;
    } else {
      results = mainList
          .where((element) =>
              element.fullName!.toLowerCase().contains(value.toLowerCase()) ||
              element.connectGroup!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    }
    setState(() {
      filteredList = results;
    });
  } */

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
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 220.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          "All approved users",
                          style: memberDetailsHeaderTextStyle(),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Click on a member to view details",
                          style: memberDetailsQTextStyle(),
                        ),
                      ],
                    ),
                    /* Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: Container(
                                    height: 50,
                                    width: 300,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: Colors.white,
                                    ),
                                    child: Center(
                                      child: TextField(
                                        onChanged: (value) {
                                          runSearch(filteredList, value);
                                        },
                                        obscureText: false,
                                        autofocus: false,
                                        enabled: true,
                                        maxLines: 1,
                                        keyboardType: TextInputType.name,
                                        textInputAction: TextInputAction.search,
                                        autocorrect: false,
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                              color: Colors.deepPurple,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                              color: Colors.deepPurple,
                                            ),
                                          ),
                                          contentPadding: const EdgeInsets.only(
                                            left: 14.0,
                                            right: 14.0,
                                            top: 10,
                                            bottom: 10,
                                          ),
                                          hintStyle: TextStyle(
                                            color: AppColors.hintTextColor,
                                            fontSize: 14.0,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500,
                                          ),
                                          hintText: "Search name",
                                        ),
                                        style: TextStyle(
                                          color: AppColors.black,
                                          fontSize: 17.0,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ), */
                    /* SizedBox(
                          height: 50,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: filterNames.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedIndex = index;
                                      initializeFilteredList();
                                    });
                                  },
                                  child: Container(
                                    height: 50,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: selectedIndex == index
                                            ? Colors.deepPurple
                                            : Colors.white),
                                    child: Center(
                                      child: Text(
                                        filterNames[index],
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.w400,
                                          color: selectedIndex == index
                                              ? Colors.white
                                              : Colors.deepPurple,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ), */
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const RequestsPage());
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.deepPurpleAccent,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 15),
                          child: Text(
                            "View requests",
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                                fontSize: 14.0),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
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
              Expanded(child: Consumer<FirebaseProvider>(
                builder: (context, firebase, child) {
                  if (firebase.isLoadingAllUsers) {
                    return const CircularProgressIndicator(
                      color: Colors.deepPurple,
                      strokeWidth: 3,
                    );
                  }
                  if (firebase.allUsers.isEmpty) {
                    return Center(
                      child: Text(
                        "No data found in this list",
                        style: textStyle(),
                      ),
                    );
                  }
                  return ListView.builder(
                    itemCount: firebase.allUsers.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(
                            () => MemberDetailsPage(),
                            arguments: [
                              firebase.allUsers[index],
                              getUserImageUrl(
                                  firebase.allUsers[index].telephone!)
                            ],
                          );
                        },
                        child: UserListTemplate(
                          key: ValueKey(firebase.allUsers[index].fullName!),
                          imageUrl: getUserImageUrl(
                              firebase.allUsers[index].telephone!),
                          fullName: firebase.allUsers[index].fullName!,
                          telephone: firebase.allUsers[index].telephone!,
                          dateOfBirth: firebase.allUsers[index].dateOfBirth!,
                          dateJoined: firebase.allUsers[index].dateAdded!,
                          connectGroup: firebase.allUsers[index].connectGroup!,
                        ),
                      );
                    },
                  );
                },
              )),
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
