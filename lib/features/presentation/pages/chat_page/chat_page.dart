import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mozztask/features/data/models/chat_model.dart';

import '../../../data/models/user_model.dart';

class ChatPage extends HookWidget {
  final User? user;
  ChatPage({Key? key, this.user}) : super(key: key);

  final List<ChatMessage> messages = [
    ChatMessage(
      message: 'Hello!',
      sender: 'me',
      timestamp: DateTime.now(),
        isRead: false
    ),
    ChatMessage(
      message: 'Hi there!',
      sender: 'you',
      timestamp: DateTime.now().add(Duration(minutes: 5)),
        isRead: true
    ),
    ChatMessage(
      message: 'What\'s up?',
      sender: 'me',
      timestamp: DateTime.now().subtract(Duration(days: 2)),
        isRead: true
    ),
    // Add more chat messages as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            _buildAppBar(context),
            SizedBox(
              height: 10,
            ),
            _buildAppBody(context)
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
      child: Row(
        children: [
          _buildBack(context),
          _buildImage(context, "Odilbek", "Rustamov"),
          SizedBox(
            width: 12,
          ),
          _buildInfo(context)
        ],
      ),
    );
  }

  Widget _buildBack(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Icon(Icons.arrow_back_ios_new, color: Color(0xFF2B333E), size: 25),
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

  Widget _buildInfo(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Odilbek Rustamov",
            style: TextStyle(
                color: Color(0xFF000000),
                fontSize: 15,
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.bold),
          ),
          Text(
            "В сети",
            style: TextStyle(
              color: Color(0xFF5E7A90),
              fontSize: 15,
              fontFamily: 'Gilroy',
            ),
            maxLines: 1, // Restrict to 1 line
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }

  Widget _buildAppBody(BuildContext context) {
    return Expanded(
      child: Container(
        child: Column(
          children: [
            Divider(
              color: Color(0xFFEDF2F6),
              thickness: 1,
            ),
            Expanded(
                child: Container(
                  width: double.infinity,
              child: ListView.builder(
                itemCount: messages.length,
                reverse: true,
                itemBuilder: (context, index) {
                  final currentMessage = messages[index];
                  final previousMessage =
                      index > 0 ? messages[index - 1] : null;

                  return Column(
                    children: [
                      if (previousMessage == null ||
                          !isSameDay(currentMessage.timestamp,
                              previousMessage.timestamp))
                        _buildDateSeparator(currentMessage.timestamp),
                      _buildChatItem(currentMessage),
                    ],
                  );
                },
              ),
            )),
            Divider(
              color: Color(0xFFEDF2F6),
              thickness: 1,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Color(0xFFEDF2F6),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Transform.rotate(
                      angle: 45 * (3.1415926535 / 180),
                      child: Icon(
                        Icons.attach_file_outlined,
                        size: 30,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Container(
                      height: 48,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Сообщение',
                          hintStyle: TextStyle(
                            color: Color(0xFF9DB7CB),
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          filled: true,
                          fillColor: Color(0xFFEDF2F6),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Color(0xFFEDF2F6),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.keyboard_voice_outlined,
                      size: 30,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildChatItem(ChatMessage message) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: message.sender == 'me'
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: message.sender == 'me' ? Color(0xFF3CED78) : Color(0xFFEDF2F6),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
                bottomLeft: message.sender == 'me'
                    ? Radius.circular(16.0)
                    : Radius.zero,
                bottomRight: message.sender == 'you'
                    ? Radius.circular(16.0)
                    : Radius.zero,
              ),
            ),
            padding: EdgeInsets.all(12.0),
            // child: Text(
            //   message.message,
            //   style: TextStyle(
            //     color: message.sender == 'me' ? Colors.black : Colors.black,
            //   ),
            // ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  child: Text(
                    message.message,
                    style: TextStyle(
                      color: message.sender == 'me' ? Colors.black : Colors.black,
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                if (message.sender == 'me') // Display read/unread icon for received messages
                  _buildReadUnreadIcon(message.isRead),
              ],
            ),
          ),
          SizedBox(height: 4.0),
          Text(
            _formatTimestamp(message.timestamp),
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateSeparator(DateTime timestamp) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 8, 20, 8),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              thickness: 1.0,
              color: Color(0xFFEDF2F6),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              _formatDate(timestamp),
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF9DB7CB),
              ),
            ),
          ),
          Expanded(
            child: Divider(
              thickness: 1.0,
              color: Color(0xFFEDF2F6),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReadUnreadIcon(bool isRead) {
    return Icon(
      isRead ? Icons.done_all : Icons.done,
      color: Color(0xFF00521C),
      size: 14,
    );
  }

  String _formatTimestamp(DateTime timestamp) {
    return '${timestamp.hour}:${timestamp.minute}';
  }

  String _formatDate(DateTime timestamp) {
    String day = timestamp.day.toString().padLeft(2, '0');
    String month = timestamp.month.toString().padLeft(2, '0');
    String year = timestamp.year.toString().substring(2);

    return '$day.$month.$year';
  }

  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }
}
