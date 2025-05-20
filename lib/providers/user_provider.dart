import 'package:flutter/material.dart';
import '../models/user.dart';

class UserProvider with ChangeNotifier {
  User? _user;

  final List<Map<String, String>> _users = [
    {
      "id": "1",
      "name": "Teacher John",
      "role": "teacher",
      "email": "teacher@example.com",
      "password": "teacher123"
    },
    {
      "id": "2",
      "name": "Student Alice",
      "role": "student",
      "email": "student@example.com",
      "password": "student123"
    },
  ];

  User? get user => _user;

  String? login(String email, String password) {
    final matchedUser = _users.firstWhere(
      (user) => user["email"] == email && user["password"] == password,
      orElse: () => {},
    );

    if (matchedUser.isNotEmpty) {
      _user = User(
        id: matchedUser["id"]!,
        name: matchedUser["name"]!,
        role: matchedUser["role"]!,
        email: matchedUser["email"]!,
      );
      notifyListeners();
      return null;
    }
    return "Invalid email or password. Please try again.";
  }

  void logout() {
    _user = null;
    notifyListeners();
  }
}
