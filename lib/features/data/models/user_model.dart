
class User {
  final String firstname;
  final String lastname;
  final String lastonline;
  final int userId;
  final String? lastmessage;
  final bool lastmessageowner;

  User({
    required this.firstname,
    required this.lastname,
    required this.lastonline,
    required this.userId,
    required this.lastmessage,
    required this.lastmessageowner,
  });
}

