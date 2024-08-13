// import 'package:devbook/Data/flutter_data.dart';
// import 'package:devbook/config/colors.dart';
// import 'package:devbook/pages/flutterAns.dart';
// import 'package:flutter/material.dart';

// class flutterQue extends StatelessWidget {
//   const flutterQue({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey.shade900,
//       appBar: AppBar(
//         iconTheme: const IconThemeData(color: Colors.white),
//         title: Text(
//           'Flutter Development',
//           style: TextStyle(color: Colors.grey.shade100),
//         ),
//         backgroundColor: Colors.grey.shade800,
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding:
//               const EdgeInsets.only(top: 10, right: 20, left: 20, bottom: 10),
//           child: Column(
//             children: [
//               ClipRRect(
//                   borderRadius: BorderRadius.circular(16),
//                   child: const Image(
//                       image: AssetImage('asset/images/flutterimg.png'))),
//               const SizedBox(height: 20),

//               // LIST START FROM HERE..
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: newUser.length,
//                   itemBuilder: (context, index) {
//                     return GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) =>
//                                 FlutterAns(mihir: newUser[index]),
//                           ),
//                         );
//                       },
//                       child: Container(
//                         decoration: BoxDecoration(
//                           color: const Color.fromARGB(255, 207, 231, 241),
//                           borderRadius: BorderRadius.circular(16),
//                         ),
//                         margin: const EdgeInsets.only(bottom: 10),
//                         child: Padding(
//                           padding: const EdgeInsets.all(10),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Expanded(
//                                 child: Text(
//                                   newUser[index].question,
//                                   style: const TextStyle(
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                   overflow: TextOverflow
//                                       .ellipsis, // Added for text overflow handling
//                                 ),
//                               ),
//                               Container(
//                                   width: 30,
//                                   decoration: const BoxDecoration(
//                                       color: Colors.white,
//                                       borderRadius:
//                                           BorderRadius.all(Radius.circular(8))),
//                                   child:
//                                       const Icon(Icons.arrow_forward_rounded))
//                             ],
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
