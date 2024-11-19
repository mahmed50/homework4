import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:homework4/chat_page.dart';
import 'login_page.dart'; // Import your login page

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Speeq',
      home: SplashScreen(), // Show splash screen first
      routes: {
        '/splash': (context) => SplashScreen(),
        '/login': (context) => LoginPage(),
        '/chat': (context) => ChatPage(), // Add the chat page route
      },
    );
  }
}

// ignore: use_key_in_widget_constructors
class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red, // Choose your color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Speeq',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
            const SizedBox(height: 20), // Add some spacing
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: const Text('Go to Login'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/chat'); // Navigate to chat
              },
              child: const Text('Go to Chat'), // Change button text to "Go to Chat"
            ),
          ],
        ),
      ),
    );
  }
}


