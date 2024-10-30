import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:devbook/Flutter%20Development/Data/flutter_data.dart';
import 'package:devbook/config/colors.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
    for (var user in flutterUser) {
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
      backgroundColor: cream,
      body: Center(
        child: PageView.builder(
          controller: _pageController,
          scrollDirection: Axis.horizontal,
          itemCount: flutterUser.length,
          itemBuilder: (context, index) {
            // Create a unique GlobalKey for each FlipCard
            final cardKey = GlobalKey<FlipCardState>();

            return FlipCard(
              key: cardKey,
              flipOnTouch: false,
              front: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 120),
                  child: Column(
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
                          padding: const EdgeInsets.only(
                              top: 10, left: 20, right: 20),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                      padding:
                                          EdgeInsets.only(left: 8, right: 8),
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
                                flutterUser[index].question, // HERE IS QUESTION
                                style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: height * 0.2,
                              ),
                              GestureDetector(
                                onTap: () {
                                  final materialBanner = MaterialBanner(
                                    elevation: 0,
                                    backgroundColor: Colors.transparent,
                                    forceActionsBelow: true,
                                    content: AwesomeSnackbarContent(
                                      title: 'Oh Hey!!',
                                      message:
                                          'This is an example error message that will be shown in the body of materialBanner!',
                                      contentType: ContentType.success,
                                      inMaterialBanner: true,
                                    ),
                                    actions: const [SizedBox.shrink()],
                                  );

                                  ScaffoldMessenger.of(context)
                                    ..hideCurrentMaterialBanner()
                                    ..showMaterialBanner(materialBanner);
                                },
                                child: Container(
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
                              ),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              GestureDetector(
                                onTap: () {
                                  final materialBanner = MaterialBanner(
                                    elevation: 0,
                                    backgroundColor: Colors.transparent,
                                    forceActionsBelow: true,
                                    content: AwesomeSnackbarContent(
                                      title: 'Oh Hey!!',
                                      message:
                                          'This is an example error message that will be shown in the body of materialBanner!',
                                      contentType: ContentType.failure,
                                      inMaterialBanner: true,
                                    ),
                                    actions: const [SizedBox.shrink()],
                                  );

                                  ScaffoldMessenger.of(context)
                                    ..hideCurrentMaterialBanner()
                                    ..showMaterialBanner(materialBanner);
                                },
                                child: Container(
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
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Image.asset(
                        'asset/images/swipe-left.png',
                        height: 50,
                        width: 50,
                      )
                    ],
                  ),
                ),
              ),
              back: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 120),
                  child: Column(
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
                          padding: const EdgeInsets.only(
                              top: 10, left: 20, right: 20),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('SOLUTION :',
                                    style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold))),
                                Text(
                                  flutterUser[index].answer, //  HERE IS ASNWER
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17,
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                Text('REFERENCE :',
                                    style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold))),
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
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
