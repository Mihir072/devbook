import 'dart:convert';

import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:devbook/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChatBot extends StatefulWidget {
  const ChatBot({super.key});

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  ChatUser myself = ChatUser(id: '1', firstName: 'Mihir');
  ChatUser bot = ChatUser(id: '2', firstName: 'Gemini');

  List<ChatMessage> allMessages = [];
  List<ChatUser> typing = [];

  final oururl =
      'https://generativelanguage.googleapis.com/v1/models/gemini-pro:generateContent?key=AIzaSyBUwE0gGDgr0HQGiy0pvD-UA-C7p_EINXY';

  final header = {'Content-Type': 'application/json'};

  getdata(ChatMessage m) async {
    typing.add(bot);
    allMessages.insert(0, m);
    setState(() {});

    var data = {
      "contents": [
        {
          "role": "user",
          "parts": [
            {"text": m.text}
          ]
        }
      ]
    };

    await http
        .post(Uri.parse(oururl), headers: header, body: jsonEncode(data))
        .then((value) {
      if (value.statusCode == 200) {
        var result = jsonDecode(value.body);
        print(result['candidates'][0]['content']['parts'][0]['text']);

        ChatMessage m1 = ChatMessage(
            text: result['candidates'][0]['content']['parts'][0]['text'],
            user: bot,
            createdAt: DateTime.now());

        allMessages.insert(0, m1);
      } else {
        print("error occured");
      }
    }).catchError((e) {});
    typing.remove(bot);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Let’s ask your Questions',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.grey.shade800,
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 20, left: 10),
        child: DashChat(
          typingUsers: typing,
          currentUser: myself,
          onSend: (ChatMessage m) {
            getdata(m);
          },
          messages: allMessages,
          messageOptions: MessageOptions(
            currentUserContainerColor: barcolor,
            currentUserTextColor: Colors.black,
            avatarBuilder: yourAvtarBuilder,
          ),
          inputOptions: InputOptions(
              alwaysShowSend: true,
              cursorStyle: const CursorStyle(color: Colors.black),
              inputDecoration: InputDecoration(
                hintText: 'Type you want to know..',
                fillColor: barcolor,
                filled: true,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
              )),
        ),
      ),
    );
  }

  Widget yourAvtarBuilder(
      ChatUser user, Function? onAvtarTap, Function? onAvtarLongPress) {
    return const CircleAvatar(
      backgroundImage: AssetImage('asset/images/woman.png'),
      radius: 15,
    );
  }
}
