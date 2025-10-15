import 'package:chat_boggy/views/chat_view.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget
{
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      appBar: AppBar
      (
        title: const Text('Boggy Chat'),
        centerTitle: false,
        leading: CircleAvatar
        (
          backgroundImage: NetworkImage('https://i.pinimg.com/736x/d0/c2/45/d0c245336bdde7dba0c3c4fe05c59936.jpg'),
        ),
      ),
      body: ChatView(),
    );
  }
}