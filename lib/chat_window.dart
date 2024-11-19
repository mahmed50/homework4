import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatWindow extends StatefulWidget {
  final String boardName;
  final String chatGenre;

  const ChatWindow({super.key, required this.boardName, required this.chatGenre});

  @override
  // ignore: library_private_types_in_public_api
  _ChatWindowState createState() => _ChatWindowState();
}

class _ChatWindowState extends State<ChatWindow> {
  final TextEditingController _messageController = TextEditingController();
  final CollectionReference _messagesRef = FirebaseFirestore.instance.collection('messages');

  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      _messagesRef.add({
        'username': 'User', // Replace with actual username if available
        'message': _messageController.text,
        'datetime': FieldValue.serverTimestamp(),
        'board': widget.boardName,
        'genre': widget.chatGenre,
      });

      _messageController.clear(); // Clear the input after sending
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.boardName} - ${widget.chatGenre}'),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _messagesRef
                  .where('board', isEqualTo: widget.boardName)
                  .where('genre', isEqualTo: widget.chatGenre)
                  .orderBy('datetime')
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                return ListView(
                  children: snapshot.data!.docs.map((doc) {
                    return ListTile(
                      title: Text(doc['username']),
                      subtitle: Text(doc['message']),
                      trailing: Text(doc['datetime']?.toString() ?? ''),
                    );
                  }).toList(),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: const InputDecoration(
                      hintText: 'Type your message...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}