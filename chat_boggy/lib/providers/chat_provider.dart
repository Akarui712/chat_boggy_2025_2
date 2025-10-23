import 'package:chat_boggy/domain/entities/message.dart';
import 'package:chat_boggy/infrastructure/datasource/get_yes_no_answer.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier //Notificaciones de los cambios
{
  final ScrollController scrollController = ScrollController();
  final List<Message> messagesList = [];

  Future<void> sendMessage(String message) async
  {
    final newMessage = Message(text: message, fromWho: FromWho.me);
    await setMessageList(newMessage);
    final response = await GetYesNoAnswer().getAnswer();
    await setMessageList(response);
  }

  Future<void> setMessageList(Message message) async
  {
        messagesList.add(message);
        notifyListeners();
        moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async
  {
    await Future.delayed(const Duration(milliseconds: 300));
    scrollController.animateTo
    (
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
    );
  }
}