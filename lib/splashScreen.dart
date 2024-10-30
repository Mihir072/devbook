import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:devbook/home.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: FlutterSplashScreen.fadeIn(
          backgroundColor: Colors.white,
          onInit: () {
            debugPrint("On Init");
          },
          onEnd: () {
            debugPrint("On End");
          },
          childWidget: SizedBox(
            height: 200,
            width: 200,
            child: Image.asset("asset/images/audio-book.png"),
          ),
          onAnimationEnd: () => debugPrint("On Fade In End"),
          nextScreen: const Homepage(),
        ),
      ),
    );
  }
}
