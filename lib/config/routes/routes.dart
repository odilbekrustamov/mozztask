import 'package:flutter/material.dart';
import 'package:mozztask/features/presentation/pages/chat_page/chat_page.dart';
import 'package:mozztask/features/presentation/pages/home_page/home_page.dart';
import 'package:mozztask/features/data/models/user_model.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const HomePage());

      case '/ChatPage':
        return _materialRoute(ChatPage(user: settings.arguments as User));


      default:
        return _materialRoute(const HomePage());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}