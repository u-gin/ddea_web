// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:typed_data';

import 'package:ddea_web/utils/constants.dart';
import 'package:flutter/material.dart';

class UserListTemplate extends StatelessWidget {
  final Uint8List? imageBytes;
  final String fullName, telephone, dateOfBirth, dateJoined, connectGroup;

  const UserListTemplate({
    Key? key,
    this.imageBytes,
    required this.fullName,
    required this.telephone,
    required this.dateOfBirth,
    required this.dateJoined,
    required this.connectGroup,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: canvasWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /* ClipOval(
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[300],
                    border: Border.all(
                      width: 2,
                      color: Colors.white,
                    ),
                    image: DecorationImage(
                      image: MemoryImage(
                        imageBytes,
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ), */

                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[300],
                      border: Border.all(
                        width: 2,
                        color: Colors.white,
                      ),
                    ),
                    child: const Icon(
                      Icons.person,
                      color: Colors.grey,
                      size: 30,
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  SizedBox(
                    width: 200,
                    child: Center(
                      child: Text(
                        fullName,
                        style: textStyle(),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 150,
                child: Center(
                  child: Text(
                    telephone,
                    style: textStyle(),
                  ),
                ),
              ),
              SizedBox(
                width: 150,
                child: Center(
                  child: Text(
                    dateOfBirth,
                    style: textStyle(),
                  ),
                ),
              ),
              SizedBox(
                width: 150,
                child: Center(
                  child: Text(
                    dateJoined,
                    style: textStyle(),
                  ),
                ),
              ),
              SizedBox(
                width: 150,
                child: Center(
                  child: Text(
                    connectGroup,
                    style: textStyle(),
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
            child: Container(
              height: 1,
              width: canvasWidth,
              //color: Colors.grey[200],
              color: Colors.grey[50],
            ),
          )
        ],
      ),
    );
  }
}
