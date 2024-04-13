import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_tez_no_asnwer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {

  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [
    Message(text: 'Hola mor', fromWho: FromWho.me),
    Message(text: 'Ya regresaste el trabajo', fromWho: FromWho.me),
  ];

  Future<void> herReply() async{
    final herMessage = await getYesNoAnswer.getAnswer();
    messageList.add(herMessage);
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> sendMessage( String text ) async {

    if(text.isEmpty) return;

    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);


    if(text.endsWith('?')){
      herReply();
    }

    notifyListeners();
    moveScrollToBottom();

  }

  Future<void> moveScrollToBottom() async{
    chatScrollController.animateTo(chatScrollController.position.maxScrollExtent, duration: const Duration( milliseconds: 300), curve: Curves.easeOut);
  }

}