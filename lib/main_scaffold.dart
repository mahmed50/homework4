import 'package:flutter/material.dart';
import 'home_page.dart'; // Import your home page

// ignore: use_key_in_widget_constructors
class MainScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your App')),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(title: const Text('Message Boards'), onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
            }),
            ListTile(title: const Text('Profile'), onTap: () {
              // Navigate to profile page
            }),
            ListTile(title: const Text('Settings'), onTap: () {
              // Navigate to settings page
            }),
          ],
        ),
      ),
      body: const Center(child: Text('Welcome to Your App!')),
    );
  }
}