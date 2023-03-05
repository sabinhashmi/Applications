// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:itenary/pages/outline.dart';

void main() {
  // ignore: prefer_const_constructors
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "The Itenary!",
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          textTheme:
              GoogleFonts.muliTextTheme(Theme.of(context).textTheme).apply(
            bodyColor: Colors.black,
          ),
          primaryColor: Colors.blue),
      home: const Outline(),
      debugShowCheckedModeBanner: false,
    );
  }
}
