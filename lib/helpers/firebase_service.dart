import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../models/user_model.dart';

class FirebaseService {
  final FirebaseDatabase databaseInstance = FirebaseDatabase.instance;

  Future<List<UserModel>> retrieveRequests() async {
    List subnodePaths = [
      "Elder (Eld)",
      "Deacon (Dcn)",
      "Deaconess (Dcns)",
      "Member (M)",
      "Presiding Elder (PE)",
      "Pastor (Ps)"
    ];

    final DatabaseReference databaseReference = databaseInstance.ref();
    List<UserModel> userRequests = [];

    for (int i = 0; i < subnodePaths.length; i++) {
      String subnode = subnodePaths[i];
      try {
        DatabaseEvent event = await databaseReference
            .child('ddea/members/$subnode')
            .once(); // Use once() to get a Future

        final dynamic dataSnapshot = event.snapshot.value;
        if (dataSnapshot != null && dataSnapshot is Map<dynamic, dynamic>) {
          dataSnapshot.forEach((key, user) {
            userRequests.add(UserModel.fromSnapshot(event.snapshot.child(key)));
          });
        } else {
          debugPrint('No data found for $subnode');
        }
      } catch (error) {
        debugPrint('Error fetching data for $subnode: $error');
      }
    }
    return userRequests;
  }

  Future<List<UserModel>> retrieveAllUsers() async {
    List subnodePaths = [
      "Elder (Eld)",
      "Deacon (Dcn)",
      "Deaconess (Dcns)",
      "Member (M)",
      "Presiding Elder (PE)",
      "Pastor (Ps)"
    ];

    final DatabaseReference databaseReference = databaseInstance.ref();
    List<UserModel> allusers = [];

    for (int i = 0; i < subnodePaths.length; i++) {
      String subnode = subnodePaths[i];
      try {
        DatabaseEvent event = await databaseReference
            .child('ddea/approved/members/$subnode')
            .once(); // Use once() to get a Future

        final dynamic dataSnapshot = event.snapshot.value;
        if (dataSnapshot != null && dataSnapshot is Map<dynamic, dynamic>) {
          dataSnapshot.forEach((key, user) {
            allusers.add(UserModel.fromSnapshot(event.snapshot.child(key)));
          });
        } else {
          debugPrint('No data found for $subnode');
        }
      } catch (error) {
        debugPrint('Error fetching data for $subnode: $error');
      }
    }

    return allusers;
  }

  void moveData(
      String node, String key, Function(bool success) callback) async {
    DatabaseReference sourceRef =
        databaseInstance.ref("ddea/members/$node/$key");
    DatabaseReference destinationRef =
        databaseInstance.ref("ddea/approved/members/$node/$key");

    // Step 1: Read the Data
    DataSnapshot dataSnapshot =
        await sourceRef.once().then((DatabaseEvent event) {
      return event.snapshot;
    });

    // Step 2: Write to the New Node
    destinationRef.set(dataSnapshot.value);

    // Step 3: Delete the Data from the Source Node
    sourceRef.remove();
  }

  void deleteData(
      String node, String key, Function(bool success) callback) async {
    DatabaseReference sourceRef =
        databaseInstance.ref("ddea/members/$node/$key");
    sourceRef.remove();
  }
}
