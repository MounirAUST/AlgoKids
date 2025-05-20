import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/user_provider.dart';
import 'providers/task_provider.dart';
import 'screens/login_screen.dart';
import 'screens/teacher_screen.dart';
import 'screens/student_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()), // User state
        ChangeNotifierProvider(create: (_) => TaskProvider()), // Task state
      ],
      child: MaterialApp(
        title: 'Learning Platform',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/', // Default route
        routes: {
          '/': (context) => const LoginScreen(), // Login screen as entry point
          '/teacher': (context) => const TeacherScreen(),
          '/student': (context) => const StudentScreen(),
        },
      ),
    );
  }
}
