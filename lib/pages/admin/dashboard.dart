import 'package:ddea_web/pages/admin/user_list_template.dart';
import 'package:ddea_web/utils/constants.dart';
import 'package:ddea_web/widgets/text_field_template.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late TextEditingController nameController;

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
              SizedBox(
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
