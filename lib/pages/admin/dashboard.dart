import 'dart:typed_data';

import 'package:ddea_web/models/user_model.dart';
import 'package:ddea_web/pages/admin/member_details_page.dart';
import 'package:ddea_web/pages/admin/user_list_template.dart';
import 'package:ddea_web/utils/constants.dart';
import 'package:ddea_web/widgets/text_field_template.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late TextEditingController searchController;
  final FirebaseDatabase databaseInstance = FirebaseDatabase.instance;
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  late List<List<UserModel>> whichList = [
    allUsers,
    justMembers,
    justElders,
    justDeaconesses,
    justDeacons,
  ];

  List filteredList = [];

  List<String> filterNames = [
    "All",
    "Members",
    "Elders",
    "Deaconesses",
    "Deacons"
  ];
  bool isLoading = false;
  bool isImageLoading = false;
  String? userImageUrl;

  int selectedIndex = 0;

  @override
  void initState() {
    searchController = TextEditingController();
    filteredList = whichList[selectedIndex];
    getAllUserData();

    super.initState();
  }

  void runSearch(String value) {
    List results = [];
    if (value.isEmpty) {
      results = whichList[selectedIndex];
    } else {
      results = whichList[selectedIndex]
          .where((element) =>
              element.fullName!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    }
    setState(() {
      filteredList = results;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
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
                                  runSearch(value);
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
                        ),
                        SizedBox(
                          height: 0,
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
                                    });
                                  },
                                  child: Container(
                                    height: 50,
                                    width: 150,
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
                        )
                      ],
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
                    Expanded(
                      child: filteredList.isEmpty
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
                              itemCount: filteredList.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Get.to(
                                      () => MemberDetailsPage(),
                                      arguments: [
                                        filteredList[index],
                                        getUserImageUrl(
                                            filteredList[index].telephone!)
                                      ],
                                    );
                                  },
                                  child: UserListTemplate(
                                    key:
                                        ValueKey(filteredList[index].fullName!),
                                    imageUrl: getUserImageUrl(
                                        filteredList[index].telephone!),
                                    fullName: filteredList[index].fullName!,
                                    telephone: filteredList[index].telephone!,
                                    dateOfBirth:
                                        filteredList[index].dateOfBirth!,
                                    dateJoined: filteredList[index].dateAdded!,
                                    connectGroup:
                                        filteredList[index].connectGroup!,
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

  void retrieveUserData(String subnodePath, List<UserModel> userList) {
    setState(() {
      isLoading = true;
    });
    final DatabaseReference databaseReference = databaseInstance.ref();
    databaseReference.child('ddea/$subnodePath').onValue.listen(
        (DatabaseEvent event) {
      final dynamic dataSnapshot = event.snapshot.value;
      if (dataSnapshot != null && dataSnapshot is Map<dynamic, dynamic>) {
        dataSnapshot.forEach((key, user) {
          userList.add(UserModel.fromSnapshot(event.snapshot.child(key)));
          allUsers.addAll(userList);
        });
        setState(() {
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
        debugPrint('No data found for $subnodePath');
      }
    }, onError: (error) {
      setState(() {
        isLoading = false;
      });
      debugPrint('Error fetching data for $subnodePath: $error');
    });
  }

  getAllUserData() {
    retrieveUserData("Elder (Eld)", justElders);
    retrieveUserData("Deacon (Dcn)", justDeacons);
    retrieveUserData("Deaconess (Dcns)", justDeaconesses);
    retrieveUserData("Member (M)", justMembers);
    retrieveUserData("Presiding Elder (PE)", justPresidingElder);
    retrieveUserData("Pastor (Ps)", justPastor);
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
