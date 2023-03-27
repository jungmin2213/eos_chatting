import 'package:eos_chatting/chatting/chat/chat_bubble.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:eos_chatting/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';


void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.web,
  );
  runApp(
      const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ChatScreen(),
      ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chatting App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginSignUpScreen()
        //TODO: 알맞은 위젯 채우기기
      );
  }
}
