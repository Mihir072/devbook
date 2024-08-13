// // ignore: file_names
// import 'package:devbook/Data/user_model.dart';
// import 'package:devbook/config/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// class FlutterAns extends StatefulWidget {
//   final user mihir;
//   const FlutterAns({super.key, required this.mihir});

//   @override
//   State<FlutterAns> createState() => _FlutterQueState();
// }

// class _FlutterQueState extends State<FlutterAns> {
//   late String videoURL;
//   late YoutubePlayerController _controller;

//   @override
//   void initState() {
//     super.initState();
//     videoURL = widget.mihir.videoPath;
//     final videoID = YoutubePlayer.convertUrlToId(videoURL);

//     _controller = YoutubePlayerController(
//       initialVideoId: videoID!,
//       flags: const YoutubePlayerFlags(
//         autoPlay: false,
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Answer'),
//         centerTitle: true,
//         backgroundColor: barcolor,
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   widget.mihir.question,
//                   style: const TextStyle(
//                       fontSize: 20, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 10),
//                 const Text(
//                   'Answer :-',
//                   style: TextStyle(fontSize: 20, color: Colors.blue),
//                 ),
//                 Text(
//                   widget.mihir.answer,
//                   style: const TextStyle(fontSize: 17),
//                 ),
//                 const SizedBox(height: 25),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text(
//                       "Let's see ",
//                       style: TextStyle(fontSize: 17),
//                     ),
//                     Text(
//                       widget.mihir.question,
//                       style: const TextStyle(fontSize: 17),
//                     ),
//                     const SizedBox(height: 15),
//                   ],
//                 ),
//                 // Ensure the YoutubePlayer is properly constrained
//                 Container(
//                   constraints: const BoxConstraints(
//                     maxHeight: 300, // Adjust height as needed
//                   ),
//                   child: YoutubePlayer(
//                     controller: _controller,
//                     showVideoProgressIndicator: true,
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:devbook/Data/flutter_data.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class FlutterAns extends StatefulWidget {
  const FlutterAns({super.key});

  @override
  State<FlutterAns> createState() => _FlutterAnsState();
}

class _FlutterAnsState extends State<FlutterAns> {
  final PageController _pageController = PageController();
  final List<YoutubePlayerController> _controllers = [];

  @override
  void initState() {
    super.initState();

    // Initialize the YoutubePlayerController list
    for (var user in newUser) {
      final videoID = YoutubePlayer.convertUrlToId(user.videoPath);
      if (videoID != null) {
        _controllers.add(
          YoutubePlayerController(
            initialVideoId: videoID,
            flags: const YoutubePlayerFlags(
              autoPlay: false,
            ),
          ),
        );
      } else {
        _controllers.add(
          YoutubePlayerController(
            initialVideoId: '', // Handle invalid video ID
            flags: const YoutubePlayerFlags(
              autoPlay: false,
            ),
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    // Dispose all YoutubePlayerControllers
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: PageView.builder(
          controller: _pageController,
          scrollDirection: Axis.horizontal,
          itemCount: newUser.length,
          itemBuilder: (context, index) {
            // Create a unique GlobalKey for each FlipCard
            final cardKey = GlobalKey<FlipCardState>();

            return FlipCard(
              key: cardKey,
              flipOnTouch: false,
              front: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: height * 0.6,
                    width: width * 0.9,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade900,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 20, right: 20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amber[400],
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(color: Colors.green),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.only(left: 8, right: 8),
                                  child: Text(
                                    'Practice',
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height * 0.05,
                          ),
                          Text(
                            newUser[index].question, // HERE IS QUESTION
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: height * 0.2,
                          ),
                          Container(
                            height: height * 0.07,
                            width: width * 0.7,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: const Center(
                              child: Text(
                                'I know this Concept :)',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Container(
                            height: height * 0.07,
                            width: width * 0.7,
                            decoration: BoxDecoration(
                              color: Colors.red[400],
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: const Center(
                              child: Text(
                                "I don't know this Concept :(",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  GestureDetector(
                    onTap: () => cardKey.currentState?.toggleCard(),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.shade900,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(20),
                        child: Icon(
                          Icons.flip,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  const Text(
                    'Flip to see solution',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              back: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: height * 0.6,
                    width: width * 0.9,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade900,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 20, right: 20),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'SOLUTION :',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 17),
                            ),
                            Text(
                              newUser[index].answer, //  HERE IS ASNWER
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                              ),
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            const Text(
                              'REFERENCE :',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 17),
                            ),
                            Card(
                              elevation: 5,
                              child: Container(
                                constraints: const BoxConstraints(
                                  maxHeight: 300, // Adjust height as needed
                                ),
                                child: YoutubePlayer(
                                  controller: _controllers[index],
                                  showVideoProgressIndicator: true,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  GestureDetector(
                    onTap: () => cardKey.currentState?.toggleCard(),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.shade900,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(20),
                        child: Icon(
                          Icons.flip,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  const Text(
                    'Flip to see question',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
