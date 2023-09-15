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

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late TextEditingController nameController;
  final FirebaseDatabase databaseInstance = FirebaseDatabase.instance;
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  late List<List<UserModel>> whichList = [
    allUsers,
    justMembers,
    justElders,
    justDeaconesses,
    justDeacons,
  ];

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
    nameController = TextEditingController();
    getAllUserData();

    super.initState();
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
                        Row(
                          children: [
                            TextFieldTemplate(
                              hintText: "Search name",
                              controller: nameController,
                              obscureText: false,
                              height: 50,
                              width: 300,
                              textFieldOutlineColor: Colors.deepPurple,
                              textInputType: TextInputType.name,
                              textInputAction: TextInputAction.search,
                              enabled: true,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.deepPurple,
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Icon(
                                  Icons.search,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 60,
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
                      child: whichList[selectedIndex].isEmpty
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
                              itemCount: whichList[selectedIndex].length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Get.to(
                                      () => MemberDetailsPage(),
                                      arguments: [
                                        whichList[selectedIndex][index],
                                        getUserImageUrl(whichList[selectedIndex]
                                                [index]
                                            .telephone!)
                                      ],
                                    );
                                  },
                                  child: UserListTemplate(
                                    imageUrl: getUserImageUrl(
                                        whichList[selectedIndex][index]
                                            .telephone!),
                                    fullName: whichList[selectedIndex][index]
                                        .fullName!,
                                    telephone: whichList[selectedIndex][index]
                                        .telephone!,
                                    dateOfBirth: whichList[selectedIndex][index]
                                        .dateOfBirth!,
                                    dateJoined: whichList[selectedIndex][index]
                                        .dateAdded!,
                                    connectGroup: whichList[selectedIndex]
                                            [index]
                                        .connectGroup!,
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
