import 'package:flutter/material.dart';

class MemberDetailsPage extends StatelessWidget {
  const MemberDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.purple,
              ),
            ),
            Expanded(
              flex: 7,
              child: Container(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
