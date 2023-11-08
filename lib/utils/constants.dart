import 'package:ddea_web/models/user_model.dart';
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
List<UserModel> allUsers = [];
List<UserModel> justMembers = [];
List<UserModel> justElders = [];
List<UserModel> justDeacons = [];
List<UserModel> justDeaconesses = [];
List<UserModel> justPastor = [];
List<UserModel> justPresidingElder = [];
List<String> userImages = [];

int? numberOfEntriesMade;

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
      color: Colors.black);
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
