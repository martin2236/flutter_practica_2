import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/config/themes/app_theme.dart';
import 'package:yes_no_app/presentation/providers/chat_providers.dart';
import 'package:yes_no_app/presentation/screens/chat/chat_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MultiProvider(
      //esto es el contexto de la app, para crearlo nececitamos pasar un contexto, pero
      //como en este caso el provider se encuentra en el punto mas alto de nuesta app
      // basta con enviar un _
      providers: [
        ChangeNotifierProvider(create: (_)=> ChatProvider())
        ],
      child: MaterialApp(
        title: 'Yes No App',
        theme: AppTheme(selectedColor: 3).theme(),
        debugShowCheckedModeBanner: false,
        home: const Scaffold(
          body: ChatScreen(),
        ),
      ),
    );
  }
}

