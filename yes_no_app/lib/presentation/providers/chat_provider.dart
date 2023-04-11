import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import '../../domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [
    Message(text: 'Hola Guru', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(message) async {
    if (message.isEmpty) return;
    final newMessage = Message(text: message, fromWho: FromWho.me);
    messageList.add(newMessage);

    if (message.endsWith('?')) {
      herReply();
    }

    notifyListeners();
    moveScrollToBotton();
  }

  Future<void> herReply() async {
    final herMessage = await getYesNoAnswer.getAnswer();
    messageList.add(herMessage);

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
