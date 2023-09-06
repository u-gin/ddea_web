import 'package:ddea_web/pages/admin/user_list_template.dart';
import 'package:ddea_web/utils/constants.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[10],
      body: SizedBox(
        width: canvasWidth,
        height: canvasHeight,
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 200),
                  child: Container(
                    height: 1,
                    width: canvasWidth,
                    color: Colors.grey[400],
                  ),
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
      ),
    );
  }
}
