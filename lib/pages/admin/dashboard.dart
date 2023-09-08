import 'package:ddea_web/pages/admin/user_list_template.dart';
import 'package:ddea_web/utils/constants.dart';
import 'package:ddea_web/widgets/text_field_template.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late TextEditingController nameController;
  final FirebaseDatabase database = FirebaseDatabase.instance;
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  List<String> filterNames = [
    "All",
    "Members",
    "Elders",
    "Deaconesses",
    "Deacons"
  ];

  int selectedIndex = 0;

  @override
  void initState() {
    nameController = TextEditingController();
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
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 200.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      ),
                      const SizedBox(
                        width: 60,
                      ),
                      Text(
                        "Full name",
                        style: headerTextStyle(),
                      ),
                    ],
                  ),
                  Text(
                    "Telephone",
                    style: headerTextStyle(),
                  ),
                  Text(
                    "Date of birth",
                    style: headerTextStyle(),
                  ),
                  Text(
                    "Date joined",
                    style: headerTextStyle(),
                  ),
                  Text(
                    "Connect group",
                    style: headerTextStyle(),
                  )
                ],
              ),
              /* Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 200),
                child: Container(
                  height: 1,
                  width: canvasWidth,
                  color: Colors.grey[400],
                ),
              ), */
              const SizedBox(
                height: 20,
              ),
              Expanded(
                flex: 1,
                child: ListView.builder(
                  itemCount: 90,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return const UserListTemplate(
                      fullName: "fullName",
                      telephone: "telephone",
                      dateOfBirth: "10.11.2023",
                      dateJoined: "10.11.2023",
                      connectGroup: "Elohim",
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
}
