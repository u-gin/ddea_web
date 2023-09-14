import 'package:ddea_web/pages/admin/dashboard.dart';
import 'package:ddea_web/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/button_template.dart';
import '../../widgets/text_field_template.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController passcodeController;
  late TextEditingController emailController;
  bool isLoading = false;

  @override
  void initState() {
    passcodeController = TextEditingController();
    emailController = TextEditingController();
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
                  "Email address",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextFieldTemplate(
                  hintText: "abc@gmail.com",
                  controller: emailController,
                  obscureText: false,
                  height: 50,
                  textInputType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  enabled: true,
                  textFieldOutlineColor: Colors.deepPurple,
                ),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  "Password",
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
                  textInputAction: TextInputAction.go,
                  enabled: true,
                  textFieldOutlineColor: Colors.deepPurple,
                ),
                const SizedBox(
                  height: 32,
                ),
                ButtonTemplate(
                  buttonName: "Go",
                  buttonColor: Colors.deepPurple,
                  buttonHeight: 60,
                  loading: isLoading,
                  buttonAction: () {
                    setState(() {
                      isLoading = true;
                    });
                    signIn();
                  },
                  fontColor: Colors.white,
                  textSize: 15,
                  buttonBorderRadius: 8,
                  buttonWidth: 300,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  signIn() {
    String email = emailController.text.toString().trim();
    String password = passcodeController.text.toString();

    if (email == "" || password == "") {
      setState(() {
        isLoading = false;
      });
    } else {
      signInWithEmailAndPassword(email, password);
    }
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      setState(() {
        isLoading = false;
      });
      Get.to(() => const Dashboard());
      return user;
    } catch (e) {
      Get.snackbar(
        "Warrning",
        "Login failed",
        colorText: Colors.white,
        backgroundColor: Colors.red,
        borderRadius: 8.0,
        margin: const EdgeInsets.only(top: 60, left: 380, right: 380),
        duration: const Duration(seconds: 5),
      );
      setState(() {
        isLoading = false;
      });

      return null;
    }
  }
}
