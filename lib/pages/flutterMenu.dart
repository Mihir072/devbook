import 'package:devbook/Data/flutter_data.dart';
import 'package:devbook/config/colors.dart';
import 'package:devbook/pages/FlutterQue.dart';
import 'package:flutter/material.dart';

class FlutterMenu extends StatelessWidget {
  const FlutterMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Development'),
        centerTitle: true,
        backgroundColor: barcolor,
      ),
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 10, right: 20, left: 20, bottom: 10),
          child: Column(
            children: [
              const Image(image: AssetImage('asset/images/flutterimg.png')),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: newUser.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                FlutterQue(mihir: newUser[index]),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 207, 231, 241),
                          borderRadius: BorderRadius.circular(
                              16), // Adjusted the radius to a more typical value
                        ),
                        margin: const EdgeInsets.only(
                            bottom:
                                10), // Added margin for spacing between items
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  newUser[index].question,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  overflow: TextOverflow
                                      .ellipsis, // Added for text overflow handling
                                ),
                              ),
                              const Icon(Icons.arrow_forward_rounded)
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
