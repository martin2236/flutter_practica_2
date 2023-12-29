
import 'package:flutter/material.dart';
import 'package:yes_no_app/presentation/screens/chat/widget/chat/my_message_bubble.dart';

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
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context,index){
                return MyMessageBubble();
              }),
            ),
            Text('Texto 2')
          ],
        ),
      ),
    );
  }
}