import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:mozztask/core/logger/logger.dart';
import 'package:mozztask/features/data/models/user_model.dart';
import 'package:mozztask/features/presentation/bloc/users/users_state.dart';

class FirebaseService {
  final DatabaseReference _databaseReference =
      FirebaseDatabase.instance.reference();
  final Dio dio;

  FirebaseService(this.dio);

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
  }
}
