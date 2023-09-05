// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:typed_data';

import 'package:ddea_web/utils/constants.dart';
import 'package:flutter/material.dart';

class UserListTemplate extends StatelessWidget {
  final Uint8List imageBytes;
  final String fullName, telephone;

  const UserListTemplate({
    Key? key,
    required this.imageBytes,
    required this.fullName,
    required this.telephone,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Row(
            children: [
              ClipOval(
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
              ),
              Text(
                fullName,
                style: const TextStyle(
                  fontSize: 17.0,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                telephone,
                style: const TextStyle(
                  fontSize: 17.0,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Container(
              height: 1,
              width: canvasWidth,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
