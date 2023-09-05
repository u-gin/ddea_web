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
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 100),
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const UserListTemplate(
                      fullName: "fullName",
                      telephone: "telephone",
                      dateOfBirth: "10.11.2023",
                      dateJoined: "10.11.2023",
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
