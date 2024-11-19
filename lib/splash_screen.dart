import 'package:flutter/material.dart';
// Import the chat page
// Import the login page

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
                Navigator.pushNamed(context, '/login'); // Navigate to LoginPage
              },
              child: const Text('Go to Login'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/chat'); // Navigate to ChatPage
              },
              child: const Text('Go to Chat'),
            ),
          ],
        ),
      ),
    );
  }
}