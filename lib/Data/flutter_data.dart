import 'user_model.dart';

List<user> newUser = [
  user(
    id: 0,
    question: 'What is Flutter?',
    videoPath: 'https://youtu.be/uvSrRBHtio8?si=SkgvzoixS4xcST7E',
    answer:
        'Flutter is an open-source UI software development kit (SDK) created by Google. It allows developers to build high-performance, natively compiled applications for mobile (iOS and Android), web, desktop (Windows, macOS, Linux), and embedded devices from a single codebase. Flutter uses the Dart programming language, which is optimized for fast apps on any platform. One of Flutter’s standout features is its rich set of customizable widgets, which enable developers to create expressive and flexible user interfaces. The framework also supports Hot Reload, allowing developers to see changes in real-time without restarting the app, significantly speeding up the development process.\n\nFlutter’s architecture consists of three main layers: the framework, the engine, and the embedder. The framework provides a comprehensive set of libraries for building UIs, the engine renders the UI, and the embedder integrates the Flutter app with the underlying platform. This architecture ensures high performance and smooth animations. Additionally, Flutter has a strong community and ecosystem, with a vast array of packages and plugins that extend its functionality. This makes Flutter an excellent choice for developers looking to create modern, high-performance applications across multiple platforms. ',
  ),
  user(
    id: 1,
    question: 'What is Dart?',
    videoPath: 'https://youtu.be/fnpD5NCzIIo?si=vXp96YlxHesS8S19',
    answer:
        'Dart is an open-source, general-purpose programming language developed by Google. It is designed for building fast, scalable, and high-performance applications across various platforms, including web, mobile, and desktop. Dart is an object-oriented, class-based language with a syntax similar to C, making it easy to learn for developers familiar with languages like Java or JavaScript. One of Dart’s standout features is its ability to compile to native machine code, JavaScript, or WebAssembly, ensuring optimal performance on any platform. \nDart is particularly well-known for its integration with the Flutter framework, which is used to build beautiful, natively compiled applications for mobile, web, and desktop from a single codebase. This integration allows developers to create expressive and flexible UIs with a rich set of customizable widgets. ',
  ),
];
