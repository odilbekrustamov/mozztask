import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mozztask/features/data/models/user_model.dart';

class UserView extends StatelessWidget {
  final User ? user;
  final void Function(User user) ? onUserPressed;

  const UserView({super.key, this.user, this.onUserPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: Column(
          children: [
            Row(
              children: [
                _buildImage(context, user!.firstname, user!.lastname),
                SizedBox(
                  width: 12,
                ),
                _buildTitle(context),
                SizedBox(
                  width: 12,
                ),
                _buildTime(context, user!.lastonline)
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              color: Color(0xFFEDF2F6),
              thickness: 1, // You can adjust the thickness as needed
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(BuildContext context, String name, String surname) {
    String initials = (name.isNotEmpty ? name[0] : '') +
        (surname.isNotEmpty ? surname[0] : '');

    List<Color> predefinedColors = [
      Colors.yellow,
      Colors.green,
      Colors.red,
      Colors.black,
      Colors.blue,
      Colors.purple,
    ];

    int randomIndex = Random().nextInt(predefinedColors.length);
    Color randomColor = predefinedColors[randomIndex];

    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: randomColor,
      ),
      child: Center(
        child: Text(
          initials,
          style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${user!.firstname} ${user!.lastname}",
            style: TextStyle(
                color: Color(0xFF000000),
                fontSize: 19,
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              user?.lastmessage != "null" && user!.lastmessageowner ?
              Text(
                "Вы:  ",
                style: TextStyle(
                    color: Color(0xFF2B333E), fontSize: 12, fontFamily: 'Gilroy'),
              ) : SizedBox(),
              user?.lastmessage != "null"
              ?Text(
                user!.lastmessage!,
                style: TextStyle(
                  color: Color(0xFF5E7A90),
                  fontSize: 12,
                  fontFamily: 'Gilroy',
                ),
                maxLines: 1, // Restrict to 1 line
                overflow: TextOverflow.ellipsis,
              )
                  :SizedBox()
            ],
          )

        ],
      ),
    );
  }

  Widget _buildTime(BuildContext context, String date) {
    DateTime dateTime = DateTime.parse(date);

    Duration difference = DateTime.now().difference(dateTime);
    String past_time = "";

    // Check if the time is less than 60 minutes
    if (difference.inMinutes < 60) {
      past_time = '${difference.inMinutes} min ago';
    } else if (difference.inHours < 24) {
      // Check if the time difference is less than 24 hours
      past_time = '${difference.inHours} hours ago';
    } else if (difference.inDays == 1 &&
        dateTime.day == DateTime.now().subtract(Duration(days: 1)).day) {
      // Check if the time difference is exactly 1 day and the date is yesterday
      past_time = 'Yesterday';
    } else {
      // Display the date in "dd:MM:yy" format
      String formattedDate =
          '${dateTime.day}:${dateTime.month}:${dateTime.year}';
      past_time = formattedDate;
    }

    return Container(
      child: Text(
        past_time,
        style: TextStyle(
            color: Color(0xFF5E7A90), fontSize: 12, fontFamily: 'Gilroy'),
      ),
    );
  }

  void _onTap() {
    if (onUserPressed != null) {
      onUserPressed!(user!);
    }
  }
}
