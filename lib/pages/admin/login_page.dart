import 'package:ddea_web/utils/colors.dart';
import 'package:ddea_web/utils/constants.dart';
import 'package:flutter/material.dart';

import '../../widgets/text_field_template.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController passcodeController;

  @override
  void initState() {
    passcodeController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: canvasWidth,
        height: canvasHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                "ADMIN LOGIN PAGE",
                style: TextStyle(
                  fontSize: 30.0,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Enter passcode",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextFieldTemplate(
                  hintText: "***********",
                  controller: passcodeController,
                  obscureText: true,
                  height: 50,
                  textInputType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.next,
                  enabled: true,
                  textFieldColor: AppColors.primary,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
