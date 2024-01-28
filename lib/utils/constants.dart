import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

double? canvasWidth;
double? canvasHeight;

String convertDate(DateTime? dateToConvert) {
  final dateFormat = DateFormat('dd.MM.yyyy');
  if (dateToConvert == null) {
    return '00.00.00';
  } else {
    return dateFormat.format(dateToConvert);
  }
}

String convertTime(DateTime? timeToConvert) {
  final timeFormat = DateFormat.Hms();
  if (timeToConvert == null) {
    return '00.00.00';
  } else {
    return timeFormat.format(timeToConvert);
  }
}

Map<String, dynamic> userDetails = {};

/* List<UserModel> justMembers = [];
List<UserModel> justElders = [];
List<UserModel> justDeacons = [];
List<UserModel> justDeaconesses = [];
List<UserModel> justPastor = [];
List<UserModel> justPresidingElder = [];
List<String> userImages = [];

List<UserModel> tempMembers = [];
List<UserModel> tempElders = [];
List<UserModel> tempDeacons = [];
List<UserModel> tempDeaconesses = [];
List<UserModel> tempPastor = [];
List<UserModel> tempPresidingElder = []; */

int? numberOfEntriesMade;
int? numberOfMembersEntered;
bool? isMember;

TextStyle textStyle() {
  return const TextStyle(
    fontSize: 15.0,
    fontFamily: "Poppins",
    fontWeight: FontWeight.w500,
  );
}

TextStyle memberDetailsHeaderTextStyle() {
  return const TextStyle(
      fontSize: 22.0,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w600,
      color: Colors.black);
}

TextStyle memberDetailsTextStyle() {
  return const TextStyle(
    fontSize: 18.0,
    fontFamily: "Poppins",
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );
}

TextStyle memberIDTextStyle() {
  return const TextStyle(
    fontSize: 18.0,
    fontFamily: "Poppins",
    fontWeight: FontWeight.w700,
    color: Color.fromARGB(255, 143, 70, 15),
  );
}

TextStyle memberDetailsQTextStyle() {
  return const TextStyle(
    fontSize: 16.0,
    fontFamily: "Poppins",
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );
}

TextStyle header16() {
  return const TextStyle(
    fontSize: 16.0,
    fontFamily: "Poppins",
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );
}

TextStyle header13() {
  return const TextStyle(
    fontSize: 13.0,
    fontFamily: "Poppins",
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );
}

TextStyle memberDetailsATextStyle() {
  return const TextStyle(
    fontSize: 20.0,
    fontFamily: "Poppins",
    fontWeight: FontWeight.w600,
    color: Colors.deepPurple,
  );
}

TextStyle headerTextStyle() {
  return const TextStyle(
    fontSize: 17.0,
    fontFamily: "Poppins",
    fontWeight: FontWeight.w600,
    color: Colors.deepPurple,
  );
}

Widget requiredInfoDesktop() {
  return const Padding(
    padding: EdgeInsets.only(top: 20, bottom: 40),
    child: Text(
      "**ALL FIELDS ARE REQUIRED**",
      style: TextStyle(
        fontFamily: "Poppins",
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: Colors.red,
      ),
    ),
  );
}

Widget requiredInfoMobile() {
  return const Padding(
    padding: EdgeInsets.only(top: 20, bottom: 20),
    child: Text(
      "**ALL FIELDS ARE REQUIRED**",
      style: TextStyle(
        fontFamily: "Poppins",
        fontSize: 13,
        fontWeight: FontWeight.w400,
        color: Colors.red,
      ),
    ),
  );
}
