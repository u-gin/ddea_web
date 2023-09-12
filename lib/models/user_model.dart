// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';

class UserModel {
  String? fullName;
  String? telephone;
  String? gender;
  String? dateOfBirth;
  String? hometown;
  String? placeOfResidence;
  String? residentialAddress;
  String? placeOfWork;
  String? occupation;
  String? baptizedBy;
  String? communicant;
  String? positionHeld;
  String? baptismType;
  String? connectGroup;
  String? dateAdded;
  String? ministry;
  String? placeOfBirth;
  String? shepherd;
  String? timeAdded;

  UserModel({
    required this.fullName,
    required this.telephone,
    required this.gender,
    required this.dateOfBirth,
    required this.hometown,
    required this.placeOfResidence,
    required this.residentialAddress,
    required this.placeOfWork,
    required this.occupation,
    required this.baptizedBy,
    required this.communicant,
    required this.positionHeld,
    required this.baptismType,
    required this.connectGroup,
    required this.dateAdded,
    required this.ministry,
    required this.placeOfBirth,
    required this.shepherd,
    required this.timeAdded,
  });

  factory UserModel.fromSnapshot(DataSnapshot snapshot) {
    final data = snapshot.value as Map<String, dynamic>?;
    return UserModel(
      fullName: data?['Fullname'] as String,
      telephone: data?['Mobile number'] as String,
      gender: data?['Gender'] as String,
      dateOfBirth: data?['Date of birth'] as String,
      hometown: data?['Hometown'] as String,
      placeOfResidence: data?['Place of residence'] as String,
      residentialAddress: data?['Residential address'] as String,
      placeOfWork: data?['Place of work'] as String,
      occupation: data?['Profession'] as String,
      baptizedBy: data?['Baptized by'] as String,
      communicant: data?['Communicant'] as String,
      positionHeld: data?['Position held'] as String,
      baptismType: data?['Baptism received'] as String,
      connectGroup: data?['Connect group'] as String,
      dateAdded: data?['Date added'] as String,
      ministry: data?['Ministry'] as String,
      placeOfBirth: data?['Place of birth'] as String,
      shepherd: data?['Shepherd'] as String,
      timeAdded: data?['Time added'] as String,
    );
  }

  UserModel copyWith({
    String? fullName,
    String? telephone,
    String? gender,
    String? dateOfBirth,
    String? hometown,
    String? placeOfResidence,
    String? residentialAddress,
    String? placeOfWork,
    String? occupation,
    String? baptizedBy,
    String? communicant,
    String? positionHeld,
    String? baptismType,
    String? connectGroup,
    String? dateAdded,
    String? ministry,
    String? placeOfBirth,
    String? shepherd,
    String? timeAdded,
  }) {
    return UserModel(
      fullName: fullName ?? this.fullName,
      telephone: telephone ?? this.telephone,
      gender: gender ?? this.gender,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      hometown: hometown ?? this.hometown,
      placeOfResidence: placeOfResidence ?? this.placeOfResidence,
      residentialAddress: residentialAddress ?? this.residentialAddress,
      placeOfWork: placeOfWork ?? this.placeOfWork,
      occupation: occupation ?? this.occupation,
      baptizedBy: baptizedBy ?? this.baptizedBy,
      communicant: communicant ?? this.communicant,
      positionHeld: positionHeld ?? this.positionHeld,
      baptismType: baptismType ?? this.baptismType,
      connectGroup: connectGroup ?? this.connectGroup,
      dateAdded: dateAdded ?? this.dateAdded,
      ministry: ministry ?? this.ministry,
      placeOfBirth: placeOfBirth ?? this.placeOfBirth,
      shepherd: shepherd ?? this.shepherd,
      timeAdded: timeAdded ?? this.timeAdded,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fullName': fullName,
      'telephone': telephone,
      'gender': gender,
      'dateOfBirth': dateOfBirth,
      'hometown': hometown,
      'placeOfResidence': placeOfResidence,
      'residentialAddress': residentialAddress,
      'placeOfWork': placeOfWork,
      'occupation': occupation,
      'baptizedBy': baptizedBy,
      'communicant': communicant,
      'positionHeld': positionHeld,
      'baptismType': baptismType,
      'connectGroup': connectGroup,
      'dateAdded': dateAdded,
      'ministry': ministry,
      'placeOfBirth': placeOfBirth,
      'shepherd': shepherd,
      'timeAdded': timeAdded,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      fullName: map['fullName'] as String,
      telephone: map['telephone'] as String,
      gender: map['gender'] as String,
      dateOfBirth: map['dateOfBirth'] as String,
      hometown: map['hometown'] as String,
      placeOfResidence: map['placeOfResidence'] as String,
      residentialAddress: map['residentialAddress'] as String,
      placeOfWork: map['placeOfWork'] as String,
      occupation: map['occupation'] as String,
      baptizedBy: map['baptizedBy'] as String,
      communicant: map['communicant'] as String,
      positionHeld: map['positionHeld'] as String,
      baptismType: map['baptismType'] as String,
      connectGroup: map['connectGroup'] as String,
      dateAdded: map['dateAdded'] as String,
      ministry: map['ministry'] as String,
      placeOfBirth: map['placeOfBirth'] as String,
      shepherd: map['shepherd'] as String,
      timeAdded: map['timeAdded'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(fullName: $fullName, telephone: $telephone, gender: $gender, dateOfBirth: $dateOfBirth, hometown: $hometown, placeOfResidence: $placeOfResidence, residentialAddress: $residentialAddress, placeOfWork: $placeOfWork, occupation: $occupation, baptizedBy: $baptizedBy, communicant: $communicant, positionHeld: $positionHeld, baptismType: $baptismType, connectGroup: $connectGroup, dateAdded: $dateAdded, ministry: $ministry, placeOfBirth: $placeOfBirth, shepherd: $shepherd, timeAdded: $timeAdded)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.fullName == fullName &&
        other.telephone == telephone &&
        other.gender == gender &&
        other.dateOfBirth == dateOfBirth &&
        other.hometown == hometown &&
        other.placeOfResidence == placeOfResidence &&
        other.residentialAddress == residentialAddress &&
        other.placeOfWork == placeOfWork &&
        other.occupation == occupation &&
        other.baptizedBy == baptizedBy &&
        other.communicant == communicant &&
        other.positionHeld == positionHeld &&
        other.baptismType == baptismType &&
        other.connectGroup == connectGroup &&
        other.dateAdded == dateAdded &&
        other.ministry == ministry &&
        other.placeOfBirth == placeOfBirth &&
        other.shepherd == shepherd &&
        other.timeAdded == timeAdded;
  }

  @override
  int get hashCode {
    return fullName.hashCode ^
        telephone.hashCode ^
        gender.hashCode ^
        dateOfBirth.hashCode ^
        hometown.hashCode ^
        placeOfResidence.hashCode ^
        residentialAddress.hashCode ^
        placeOfWork.hashCode ^
        occupation.hashCode ^
        baptizedBy.hashCode ^
        communicant.hashCode ^
        positionHeld.hashCode ^
        baptismType.hashCode ^
        connectGroup.hashCode ^
        dateAdded.hashCode ^
        ministry.hashCode ^
        placeOfBirth.hashCode ^
        shepherd.hashCode ^
        timeAdded.hashCode;
  }
}
