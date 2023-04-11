import 'package:flutter/material.dart';
import '../../domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> message = [
    Message(text: 'Hola Guru', fromWho: FromWho.me),
    Message(text: 'Tendre suerte en el amor?', fromWho: FromWho.me)
  ];
}

Future<void> sendMessage() async {
  //TODO: Implementar metodo
}
