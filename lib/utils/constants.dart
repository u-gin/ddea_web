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

TextStyle textStyle() {
  return const TextStyle(
    fontSize: 15.0,
    fontFamily: "Poppins",
    fontWeight: FontWeight.w500,
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
