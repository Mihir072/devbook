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

  // Function to parse bold markdown syntax (**text**) into bold TextSpan
  TextSpan parseMarkdown(String text, {Color? color}) {
    final boldRegex = RegExp(r"\*\*(.*?)\*\*"); // Detects **bold** text
    List<TextSpan> spans = [];
    int lastIndex = 0;

    // Find all occurrences of bold text
    for (final match in boldRegex.allMatches(text)) {
      // Add the text before the bold part
      if (match.start > lastIndex) {
        spans.add(TextSpan(
            text: text.substring(lastIndex, match.start),
            style: TextStyle(color: color)));
      }

      // Add the bold text
      spans.add(TextSpan(
        text: match.group(1),
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: color), // Apply color to bold text
      ));

      // Update lastIndex to continue after the current match
      lastIndex = match.end;
    }

    // Add any remaining text after the last match
    if (lastIndex < text.length) {
      spans.add(TextSpan(
          text: text.substring(lastIndex),
          style: TextStyle(color: color))); // Apply color
    }

    return TextSpan(children: spans);
  }

  // Get data from API and handle the bot response
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
        String botResponse =
            result['candidates'][0]['content']['parts'][0]['text'];

        // Creating the bot message
        ChatMessage m1 = ChatMessage(
          text: botResponse,
          user: bot,
          createdAt: DateTime.now(),
        );

        allMessages.insert(0, m1);
      } else {
        print("error occurred");
      }
    }).catchError((e) {
      print(e);
    });

    typing.remove(bot);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cream,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Let’s ask your Questions',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Hero(
              tag: 'tag',
              child: CircleAvatar(
                backgroundImage: AssetImage('asset/images/woman.png'),
                radius: 18,
              ),
            ),
          ],
        ),
        backgroundColor: bgcolor,
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
            currentUserContainerColor: Colors.grey.shade800,
            currentUserTextColor: Colors.white,
            avatarBuilder: yourAvatarBuilder,
            messageTextBuilder: (ChatMessage message,
                [ChatMessage? previousMessage, ChatMessage? nextMessage]) {
              // Determine text color based on the message sender
              Color textColor = message.user.id == myself.id
                  ? Colors.white
                  : Colors.black; // Black for user, blue for bot

              return RichText(
                text: parseMarkdown(message.text,
                    color: textColor), // Pass the color to parseMarkdown
              );
            },
          ),
          inputOptions: InputOptions(
            alwaysShowSend: true,
            cursorStyle: const CursorStyle(color: Colors.black),
            inputDecoration: InputDecoration(
              hintText: 'Type you want to know..',
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Avatar builder for displaying user and bot avatars
  Widget yourAvatarBuilder(
      ChatUser user, Function? onAvatarTap, Function? onAvatarLongPress) {
    return const CircleAvatar(
      backgroundImage: AssetImage('asset/images/woman.png'),
      radius: 15,
    );
  }
}
