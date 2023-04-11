import 'package:flutter/material.dart';
import '../../domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();

  List<Message> messageList = [
    Message(text: 'Hola Guru', fromWho: FromWho.me),
    Message(text: 'Tendre suerte en el amor?', fromWho: FromWho.me)
  ];

  Future<void> sendMessage(message) async {
    if (message.isEmpty) return;
    final newMessage = Message(text: message, fromWho: FromWho.me);
    messageList.add(newMessage);

    notifyListeners();
    moveScrollToBotton();
  }

  Future<void> moveScrollToBotton() async {
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut);
  }
}
