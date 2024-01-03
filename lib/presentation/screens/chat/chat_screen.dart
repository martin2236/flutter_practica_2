
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_providers.dart';
import 'package:yes_no_app/presentation/widget/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widget/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widget/chat/shared/message_fiel_box.dart';

class ChatScreen extends StatelessWidget{
  const ChatScreen({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(3.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://newprofilepic.photo-cdn.net//assets/images/article/profile.jpg?90af0c8'),
          ),
        ),
        title: const Text('Pamela'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //importamos el estado global y como tipo tenmos que indicar en cual provider
    //debe estar pendiente en este caso <ChatProvider>
   final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(child: ListView.builder(
              //vinculamos el scrollController con el definido en el provider
              controller: chatProvider.chatScrollController,
              itemCount: chatProvider.messageList.length,
              itemBuilder: (context,index){
                final message = chatProvider.messageList[index];
                return message.fromWho == FromWho.me ? 
                 MyMessageBubble(message: message.text)
                :
                 HerMessageBubble(message: message.text,imageUrl: message.imageUrl!,);
              }),
            ),
            MessageFieldBox(
              //cuando la funcion tiene la misma cantidad de argumentos y estan en la misma
              //posicion podemos usar el atajo
              //?onValue: (String value) { chatProvider.sendMessage(value);}
              onValue: chatProvider.sendMessage,
              ),
           const SizedBox(height: 5)
          ],
        ),
      ),
    );
  }
}