// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:itenary/constants/page_controller.dart';

import 'package:itenary/pages/homepage/about.dart';
import 'package:itenary/pages/homepage/contact.dart';

import '../search/03_search_panel.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
      controller: pageController,
      pageSnapping: false,
      scrollDirection: Axis.vertical,
      children: const [SearchPanel(), AboutUs(), ContactUs()],
    ));
  }
}
