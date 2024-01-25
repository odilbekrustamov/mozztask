import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
<<<<<<< HEAD
import 'package:mozztask/features/data/models/user_model.dart';

abstract class UserState extends Equatable{
  final List<User>? users;
  final DioError ? error;
=======
import 'package:mozztask/core/logger/logger.dart';
import 'package:mozztask/features/data/models/user_model.dart';

class UserState extends Equatable {
  final List<User>? users;
  final DioError? error;
>>>>>>> 4138421c2c006cf323d9fa6f2ce5b8fede8e7176

  const UserState({this.users, this.error});

  @override
<<<<<<< HEAD
  // TODO: implement props
=======
>>>>>>> 4138421c2c006cf323d9fa6f2ce5b8fede8e7176
  List<Object?> get props => [users, error];
}

class UserInitialState extends UserState {
  const UserInitialState();
}

class UsersLoadedState extends UserState {
<<<<<<< HEAD
  const UsersLoadedState(List<User> users): super(users: users);
}

class UsersErrorState extends UserState {
  const UsersErrorState(DioError error): super(error: error);
}
=======
  const UsersLoadedState(List<User> users) : super(users: users);
}

class UsersErrorState extends UserState {
  const UsersErrorState(DioError error) : super(error: error);
}
>>>>>>> 4138421c2c006cf323d9fa6f2ce5b8fede8e7176
