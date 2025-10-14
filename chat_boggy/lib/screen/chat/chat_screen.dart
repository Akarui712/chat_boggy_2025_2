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
          //backgroundImage: NetworkImage('assets/images/boggy.png'),
          backgroundImage: NetworkImage('C:/Users/Usuario/OneDrive/Pictures/Wallpaper'),
        ),
      ),
      body: ChatView(),
    );
  }
}