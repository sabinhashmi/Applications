import 'package:flutter/material.dart';

import '01_WelcomeSelection.dart';
import '02_AboutMe.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(children: [FirstPage(), AboutPage()]);
  }
}
