// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  String fullName;
  String telephone;
  String gender;
  String dateOfBirth;
  String hometown;
  String placeOfResidence;
  String residentialAddress;
  String placeOfWork;
  String occupation;
  String baptizedBy;
  String communicant;
  String positionHeld;

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
  });

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
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(fullName: $fullName, telephone: $telephone, gender: $gender, dateOfBirth: $dateOfBirth, hometown: $hometown, placeOfResidence: $placeOfResidence, residentialAddress: $residentialAddress, placeOfWork: $placeOfWork, occupation: $occupation, baptizedBy: $baptizedBy, communicant: $communicant, positionHeld: $positionHeld)';
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
        other.positionHeld == positionHeld;
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
        positionHeld.hashCode;
  }
}
