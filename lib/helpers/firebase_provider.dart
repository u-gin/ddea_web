import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../models/user_model.dart';
import 'firebase_service.dart';

class FirebaseProvider extends ChangeNotifier {
  FirebaseService get service => GetIt.I<FirebaseService>();
  List<UserModel> _allRequests = [];
  List<UserModel> _allUsers = [];
  List<UserModel> get allRequests => _allRequests;
  List<UserModel> get allUsers => _allUsers;
  bool isLoading = true;
  bool isLoadingMove = false;
  bool isLoadingDelete = false;
  bool isLoadingAllUsers = false;

  FirebaseProvider() {
    retrieveRequests();
    retrieveAllUsers();
  }

  retrieveRequests() async {
    _allRequests = await service.retrieveRequests();
    isLoading = false;
    notifyListeners();
  }

  retrieveAllUsers() async {
    _allUsers = await service.retrieveAllUsers();
    isLoadingAllUsers = false;
    notifyListeners();
  }

  moveRequestsToApproved(
      String node, String key, Function(bool success) callback) {
    service.moveData(node, key, callback);
    isLoadingMove = false;
    notifyListeners();
  }

  deleteRequest(String node, String key, Function(bool success) callback) {
    service.deleteData(node, key, callback);
    isLoadingDelete = false;
    notifyListeners();
  }
}
