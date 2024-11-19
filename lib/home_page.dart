import 'package:flutter/material.dart';
import 'chat_window.dart'; // Import the chat window

class HomePage extends StatelessWidget {
  final List<Map<String, String>> messageBoards = [
    {'name': 'General', 'icon': 'assets/general.png'},
    {'name': 'Sports', 'icon': 'assets/sports.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Message Boards')),
      body: ListView.builder(
        itemCount: messageBoards.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset(messageBoards[index]['icon']!), // Ensure the icon exists
            title: Text(messageBoards[index]['name']!),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ChatWindow(boardName: messageBoards[index]['name']!, chatGenre: '',)));
            },
          );
        },
      ),
    );
  }
}