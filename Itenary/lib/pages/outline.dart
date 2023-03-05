import 'package:flutter/material.dart';
import 'package:itenary/constants/floatingbutton_home.dart';
import 'package:itenary/constants/title_bar.dart';
import 'package:itenary/pages/homepage/homepage.dart';

class Outline extends StatelessWidget {
  const Outline({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: titleBar,
      body: const HomePage(),
      floatingActionButton: goUpButton,
    );
  }
}
