import 'package:flutter/material.dart';
import 'chat_window.dart'; // Import your chat window

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    // List of chat genres
    final List<String> chatGenres = ['Games', 'Business', 'Public Health', 'Study', 'Movies'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Message Boards'),
      ),
      body: ListView.builder(
        itemCount: chatGenres.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(chatGenres[index]),
            onTap: () {
              // Navigate to the ChatWindow with the selected genre
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatWindow(
                    boardName: 'General', // You can customize this
                    chatGenre: chatGenres[index],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}