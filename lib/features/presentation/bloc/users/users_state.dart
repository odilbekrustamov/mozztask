import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:mozztask/features/data/models/user_model.dart';

abstract class UserState extends Equatable{
  final List<User>? users;
  final DioError ? error;

  const UserState({this.users, this.error});

  @override
  // TODO: implement props
  List<Object?> get props => [users, error];
}

class UserInitialState extends UserState {
  const UserInitialState();
}

class UsersLoadedState extends UserState {
  const UsersLoadedState(List<User> users): super(users: users);
}

class UsersErrorState extends UserState {
  const UsersErrorState(DioError error): super(error: error);
}