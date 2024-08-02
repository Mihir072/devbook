import 'package:devbook/Data/user_model.dart';
import 'package:devbook/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class FlutterQue extends StatefulWidget {
  final user mihir;
  const FlutterQue({super.key, required this.mihir});

  @override
  State<FlutterQue> createState() => _FlutterQueState();
}

class _FlutterQueState extends State<FlutterQue> {
  late String videoURL;
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    videoURL = widget.mihir.videoPath;
    final videoID = YoutubePlayer.convertUrlToId(videoURL);

    _controller = YoutubePlayerController(
      initialVideoId: videoID!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Answer'),
        centerTitle: true,
        backgroundColor: barcolor,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.mihir.question,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Answer :-',
                  style: TextStyle(fontSize: 20, color: Colors.blue),
                ),
                Text(
                  widget.mihir.answer,
                  style: const TextStyle(fontSize: 17),
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Let's see ",
                      style: TextStyle(fontSize: 17),
                    ),
                    Text(
                      widget.mihir.question,
                      style: const TextStyle(fontSize: 17),
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
                // Ensure the YoutubePlayer is properly constrained
                Container(
                  constraints: BoxConstraints(
                    maxHeight: 300, // Adjust height as needed
                  ),
                  child: YoutubePlayer(
                    controller: _controller,
                    showVideoProgressIndicator: true,
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
