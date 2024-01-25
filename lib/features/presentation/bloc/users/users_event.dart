import 'package:firebase_auth/firebase_auth.dart';

abstract class UserEvent {
  const UserEvent();
}

class FetchUsersEvent extends UserEvent {
  const FetchUsersEvent();
}