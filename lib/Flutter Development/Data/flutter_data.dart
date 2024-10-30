import '../../user_model.dart';

List<user> flutterUser = [
  user(
    id: 0,
    question: 'What is Flutter?',
    videoPath: 'https://youtu.be/jqxz7QvdWk8?si=53csYwHdd6Cl2CQ7',
    answer:
        'Flutter is an open-source UI software development toolkit created by Google, used for building natively compiled applications for mobile, web, and desktop from a single codebase. It employs the Dart programming language and provides a rich set of pre-designed widgets that facilitate the creation of visually appealing, high-performance apps. Flutter’s hot-reload feature allows developers to see changes in real-time without restarting the app, making the development process more efficient. Its framework is designed to be highly customizable and flexible, enabling the creation of complex user interfaces with ease. ',
  ),
  user(
    id: 1,
    question: 'What is Dart Language?',
    videoPath: 'https://youtu.be/fnpD5NCzIIo?si=JvmxQ950QZCh3LzS',
    answer:
        'Dart is an open-source, object-oriented programming language developed by Google, primarily used for building web, server, and mobile applications. It is the language behind Flutter, which enables developers to create cross-platform applications. Dart is designed to be easy to learn for developers familiar with languages like JavaScript, Java, and C#, offering features like a sound type system, asynchronous programming with async-await, and just-in-time (JIT) as well as ahead-of-time (AOT) compilation for optimized performance. It combines the benefits of modern language design with the ability to produce fast, efficient code. ',
  ),
  user(
    id: 2,
    question: 'How do you install Flutter',
    videoPath: 'https://youtu.be/BqHOtlh3Dd4?si=PdG8RqWMacUB-DHJ',
    answer:
        'To install Flutter, you first need to download the Flutter SDK from the official Flutter website and extract it to a desired location on your system. Then, add the Flutter bin directory to your system’s PATH environment variable to make the flutter command accessible from any terminal. On Windows, you might also need to install additional dependencies like Git. After setting up the PATH, you can verify the installation by running flutter doctor in the terminal, which checks for and guides you through installing any missing dependencies like Android Studio, the Dart SDK, and necessary device emulators. Once everything is set up, you can start building Flutter applications by creating a new project with the flutter create command. ',
  ),
  user(
    id: 3,
    question: 'How do you set up an Android Emulator',
    videoPath: 'https://youtu.be/q-3r85fl-g4?si=47QLExG47XP9Ek23',
    answer:
        'To set up an Android emulator for Flutter development, start by installing Android Studio, which includes the Android Virtual Device (AVD) Manager. Once installed, open Android Studio and go to the "AVD Manager" via the "Configure" or "Tools" menu. Create a new virtual device by selecting a device model and then choosing the desired system image (such as a version of Android). After configuring the settings like device name, orientation, and storage, click "Finish" to create the emulator. To start the emulator, click the green play button next to the device in the AVD Manager. Ensure that the Flutter SDK is correctly installed and that the emulator is running when you execute flutter devices in the terminal to see the emulator listed. Now you can run Flutter apps on the emulator using flutter run. ',
  ),
  user(
    id: 4,
    question: 'How do you create a new Flutter project',
    videoPath: 'https://youtu.be/B3MoTP3veBk?si=I1cT5hr6TDeiVnuC',
    answer:
        'To create a new Flutter project, open a terminal and navigate to the directory where you want the project to be created. Then, run the command flutter create project_name, replacing project_name with your desired project name. This command generates a new Flutter project with a standard directory structure, including folders for Android, iOS, web, and other platforms. After the project is created, navigate into the project directory using cd project_name and you can start developing your app. You can open the project in your preferred code editor, such as Visual Studio Code or Android Studio, and begin writing your app’s code. To run the app, connect a device or start an emulator, and use the flutter run command. ',
  ),
  user(
    id: 5,
    question: 'How do you run a Flutter application',
    videoPath: 'https://youtu.be/nsdW6s3FqUY?si=Bp4Bpv9o2QAp7X3p',
    answer:
        'To run a Flutter application, first, ensure you have Flutter installed and set up on your machine, including the necessary SDK and environment variables. Then, open the project in a code editor like Visual Studio Code or Android Studio. Connect a physical device via USB or start an emulator/simulator for iOS or Android. Navigate to the project’s root directory in the terminal, and run the command flutter run. This command compiles the application and deploys it to the connected device or emulator, launching the app for testing or development. ',
  ),
  user(
    id: 6,
    question: 'What are widgets in Flutter?',
    videoPath: 'https://youtu.be/7rXDaNAAeak?si=161O3vagj-X-6S3f',
    answer:
        'In Flutter, widgets are the fundamental building blocks of the user interface. Everything you see in a Flutter app is a widget, from the simplest text and buttons to complex layouts and animations. Widgets are nested inside one another to create the apps UI, forming a widget tree. They can be either stateful, meaning they can change dynamically in response to user interactions, or stateless, meaning they remain constant once built. By composing widgets, developers can create responsive, visually appealing, and highly customizable UIs in Flutter. ',
  ),
  user(
    id: 7,
    question: 'What is the stateless and stateful widgets?',
    videoPath: 'https://youtu.be/h46lrbg8qUg?si=FiWNadtkGc7WiMus',
    answer:
        'In Flutter, stateless widgets and stateful widgets are two types of widgets used to build the user interface. A stateless widget is immutable, meaning it cannot change once it is built. It simply renders the UI based on the configuration passed to it and does not hold any internal state. Examples include simple text labels or icons. On the other hand, a stateful widget is mutable and can change over time, meaning it has an internal state that can be modified, triggering a rebuild of the widget when the state changes. This makes stateful widgets ideal for dynamic interfaces that respond to user interactions or other events, such as a form field that changes based on user input. ',
  ),
  user(
    id: 8,
    question: 'How do you use common layout widgets',
    videoPath: 'https://youtu.be/-z26yE9g0Hg?si=SaRaS2VVKWw_tmNA',
    answer:
        'To use common layout widgets in Flutter, you combine different layout widgets to structure your apps user interface. The Container widget is often used for styling and positioning, providing padding, margins, and background colors. Row and Column widgets are used to arrange children horizontally and vertically, respectively, while Stack allows for overlapping children. Padding adds space around a widget, and Center aligns its child widget in the middle of the available space. Expanded and Flexible widgets help distribute space within a Row or Column. By nesting these and other layout widgets, you can create complex and responsive UIs in Flutter. ',
  ),
  user(
    id: 9,
    question: 'How do you apply styles to widgets',
    videoPath: 'https://youtu.be/e9YBnPNKEAY?si=rKUO0zrJs2Z3lBrR',
    answer:
        'To apply styles to widgets in Flutter, you use widget-specific properties and wrap widgets with other styling widgets. For example, the Text widget uses the style property to customize font, color, and size through TextStyle. The Container widget allows you to apply background colors, borders, and padding. You can also use widgets like Padding and Align to adjust spacing and positioning. For a consistent look across the app, you can define styles using ThemeData, which applies global themes to widgets like buttons and text. By combining these approaches, you can effectively control the appearance and layout of your Flutter app. ',
  ),
  user(
    id: 10,
    question: 'How do you use TextField and TextFormField for input',
    videoPath: 'https://youtu.be/eWa6iGncZ5Q?si=a82BsiyfypEjAumi',
    answer:
        'In Flutter, TextField and TextFormField are commonly used widgets for accepting user input. TextField is a basic input field that allows users to enter text, with properties to customize its appearance, behavior, and style, such as setting hint text, text alignment, and input decoration. TextFormField extends TextField and is typically used within a Form widget, making it easier to manage form validation, save, and reset functionalities. It offers additional features like validation through validator functions and integration with form states, which is useful in handling multiple input fields in a form. Both widgets are essential for capturing and processing user input in a Flutter app. ',
  ),
  user(
    id: 11,
    question: 'What are controllers?',
    videoPath: 'https://youtu.be/9V7as89MuEE?si=YZK4iQE8xAG6bCCR',
    answer:
        'In Flutter, controllers are used to manage and interact with the state of input widgets like TextField and TextFormField. The most common controller is the TextEditingController, which allows you to retrieve, modify, and listen to changes in the text fields value. By attaching a TextEditingController to a text field, you can programmatically set or clear its content, respond to user input in real-time, and manage form data more effectively. Controllers are essential for tasks like validating input, reacting to user typing, and dynamically updating UI elements based on user input. ',
  ),
];
