import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:mozztask/core/resources/data_state.dart';
import 'package:mozztask/features/data/models/user_model.dart';

class FirebaseService {
  final DatabaseReference _databaseReference =
      FirebaseDatabase.instance.reference();
  final Dio dio;

  FirebaseService(this.dio);

  Future<DataState<List<User>>> getUsers() async {
    try {
      final DatabaseEvent snapshot =
          await _databaseReference.child('users').child('userList').once();

      List<User> users = [];

      if (snapshot.snapshot.value != null) {
        for (var child in snapshot.snapshot.children) {
          var jsonPost = jsonEncode(child.value);
          Map<String, dynamic> map = jsonDecode(jsonPost);
          var user = User(
              firstname: map['firstname'],
              lastname: map['lastname'],
              lastonline: map['lastonline'],
              userId: map['userId'],
              lastmessage: map['lastmessage'],
              lastmessageowner: map['lastMessageOwner'] as bool);
          users.add(user);
        }
        return DataSuccess(users);
      } else {
        return DataSuccess([]);
      }
    } on DioError catch (e) {
      print("Error fetching users: $e");
      return DataFailed(e);
    }
  }
}
