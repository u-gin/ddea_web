// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:typed_data';

import 'package:ddea_web/utils/constants.dart';
import 'package:flutter/material.dart';

class UserListTemplate extends StatelessWidget {
  final Future<Uint8List?> imageUrl;
  final String fullName, telephone, dateOfBirth, dateJoined, connectGroup;

  const UserListTemplate({
    Key? key,
    required this.imageUrl,
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
                    child: FutureBuilder<Uint8List?>(
                      future: imageUrl,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          // The Future is complete, and we have a result.
                          final Uint8List? url = snapshot.data;
                          if (url != null) {
                            // Return a widget that displays the image using imageUrl.
                            /* return Image.memory(
                                url,
                                fit: BoxFit.fill,
                              ); */
                            return CircleAvatar(
                              radius: 50,
                              backgroundImage: MemoryImage(url),
                              child: ClipOval(
                                child: Image.memory(
                                  url,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          } else {
                            // Handle the case where imageUrl is null (e.g., no image available).
                            return const Icon(
                              Icons.person,
                              color: Colors.grey,
                              size: 30,
                            );
                          }
                        } else if (snapshot.hasError) {
                          // Handle the case where an error occurred while fetching the image.
                          return const Icon(
                            Icons.error,
                            color: Colors.red,
                            size: 20,
                          );
                        } else {
                          // The Future is still loading.
                          return const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.deepPurple,
                            ),
                          ); // You can use any loading indicator.
                        }
                      },
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
                        textAlign: TextAlign.center,
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
