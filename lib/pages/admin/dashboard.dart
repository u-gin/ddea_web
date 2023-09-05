import 'package:ddea_web/pages/admin/user_list_template.dart';
import 'package:ddea_web/utils/constants.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: canvasWidth,
        height: canvasHeight,
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.lightBlueAccent,
              ),
            ),
            Expanded(
              flex: 7,
              child: SizedBox(
                height: canvasHeight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 100),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              const SizedBox(
                                width: 50,
                              ),
                              const SizedBox(
                                width: 50,
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
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0, bottom: 20, left: 200, right: 100),
                        child: Container(
                          height: 1,
                          width: canvasWidth,
                          color: Colors.grey[400],
                        ),
                      ),
                      Expanded(
                        flex: 8,
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
            ),
          ],
        ),
      ),
    );
  }
}
