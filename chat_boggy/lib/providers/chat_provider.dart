import 'package:chat_boggy/domain/entities/message.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier //Notificaciones de los cambios
{
  final List<Message> messagesList = 
  [
    Message(text: "", imageUrl: 'https://i.pinimg.com/736x/d0/c2/45/d0c245336bdde7dba0c3c4fe05c59936.jpg', fromWho: FromWho.hers),
    Message(text: "Hola corazón", fromWho: FromWho.me),
    Message(text: "", imageUrl: 'https://i.pinimg.com/736x/d0/c2/45/d0c245336bdde7dba0c3c4fe05c59936.jpg', fromWho: FromWho.hers),
    Message(text: "Que hermoso", fromWho: FromWho.me),
    Message(text: "Te quiero", fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String message) async
  {
    final newMessage = Message(text: message, fromWho: FromWho.me);
    messagesList.add(newMessage);
    notifyListeners();
  }
}