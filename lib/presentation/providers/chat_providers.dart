import 'package:flutter/material.dart';
import 'package:yes_no_app/config/themes/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier{

 final ScrollController chatScrollController = ScrollController();
 final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [];

  Future <void> sendMessage(String text) async{
    if(text.isEmpty) return;
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);

    if(text.endsWith('?')){
       herReply();
    }
    // similar al setState de los stateful widgets hay que notificar que
    // hubo un cambio para que todos los widgets que dependan de estado 
    // se re dibujen
    notifyListeners();
    moveScrollToBottom();
  }

  Future <void> herReply () async {
    final herMessage = await getYesNoAnswer.getAnswer();
    messageList.add(herMessage);
    notifyListeners();
    moveScrollToBottom();
  }

 Future <void> moveScrollToBottom () async {
    await Future.delayed(const Duration(milliseconds: 100));
      chatScrollController.animateTo(
        //obtiene cual es el tamaño del scroll para definir cual es el final
        chatScrollController.position.maxScrollExtent, 
        duration: const Duration(milliseconds: 300), 
        curve: Curves.easeOut
        );
  }

}