<<<<<<< HEAD
=======
import 'dart:async';
>>>>>>> 4138421c2c006cf323d9fa6f2ce5b8fede8e7176
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:firebase_database/firebase_database.dart';
<<<<<<< HEAD
import 'package:mozztask/core/resources/data_state.dart';
import 'package:mozztask/features/data/models/user_model.dart';
=======
import 'package:mozztask/core/logger/logger.dart';
import 'package:mozztask/features/data/models/user_model.dart';
import 'package:mozztask/features/presentation/bloc/users/users_state.dart';
>>>>>>> 4138421c2c006cf323d9fa6f2ce5b8fede8e7176

class FirebaseService {
  final DatabaseReference _databaseReference =
      FirebaseDatabase.instance.reference();
  final Dio dio;

  FirebaseService(this.dio);

<<<<<<< HEAD
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
=======
  StreamController<UserState> _userStreamController =
      StreamController<UserState>.broadcast();

  Stream<UserState> get userStream => _userStreamController.stream;

  void setupFirebaseListener() {
    _databaseReference.child('users').child('userList').onValue.listen((event) {
      LogService.e("Firebase event triggered");
      final snapshot = event.snapshot;
      List<User> users = [];

      if (snapshot.value != null) {
        for (var child in snapshot.children) {
          var jsonPost = jsonEncode(child.value);
          Map<String, dynamic> map = jsonDecode(jsonPost);
          var user = User(
            firstname: map['firstname'],
            lastname: map['lastname'],
            lastonline: map['lastonline'],
            userId: map['userId'],
            lastmessage: map['lastmessage'],
            lastmessageowner: map['lastMessageOwner'] as bool,
          );
          users.add(user);
        }
        _userStreamController.add(UsersLoadedState(users));
      } else {
        _userStreamController.add(UsersLoadedState([]));
      }

    });
>>>>>>> 4138421c2c006cf323d9fa6f2ce5b8fede8e7176
  }
}
