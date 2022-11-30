import 'package:flutter/material.dart';
import 'package:shiv_sakti/Screens/HomeScreens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Map<int, Color> color = {
      50: Color.fromRGBO(28, 46, 70, .1),
      100: Color.fromRGBO(28, 46, 70, .2),
      200: Color.fromRGBO(28, 46, 70, .3),
      300: Color.fromRGBO(28, 46, 70, .4),
      400: Color.fromRGBO(28, 46, 70, .5),
      500: Color.fromRGBO(28, 46, 70, .6),
      600: Color.fromRGBO(28, 46, 70, .7),
      700: Color.fromRGBO(28, 46, 70, .8),
      800: Color.fromRGBO(28, 46, 70, .9),
      900: Color.fromRGBO(28, 46, 70, 1),
    };
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch:
              MaterialColor(0xff1C2E46, color)), //Color(0xff1C2E46)),
      home: HomeScreen(),
    );
  }
}
