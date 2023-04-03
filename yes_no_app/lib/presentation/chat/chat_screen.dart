import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(10.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://static-s.aa-cdn.net/img/ios/591084379/89f55ae8765482ae5c3e2cd4d1c6971c?v=1'),
          ),
        ),
        title: const Text('Guru'),
      ),
    );
  }
}
