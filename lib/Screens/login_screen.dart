import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';
import 'teacher_screen.dart';
import 'student_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? errorMessage; // To store login errors

  // Asynchronous login handler
  Future<void> handleLogin(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final String email = emailController.text.trim();
    final String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      setState(() {
        errorMessage = "Email and password cannot be empty.";
      });
      return;
    }

    try {
      final String? loginError = userProvider.login(email, password);

      if (loginError == null) {
        // Successful login, navigate to the respective dashboard
        if (userProvider.user!.role == 'teacher') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const TeacherScreen()),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) =>  const StudentScreen()),
          );
        }
      } else {
        // Display error message
        setState(() {
          errorMessage = loginError;
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = "An error occurred: ${e.toString()}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: "Email"),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: "Password"),
              obscureText: true, // Hide password
            ),
            if (errorMessage != null) // Display error message
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  errorMessage!,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => handleLogin(context), // Updated to call async handleLogin
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
