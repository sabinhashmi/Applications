// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:letsmeet/AppDrawer/AppDrawer.dart';
import 'package:letsmeet/MainBody.dart';

void main() {
  runApp(const SourcePage());
}

class SourcePage extends StatelessWidget {
  const SourcePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Let's Meet!"),
      ),
      body: Body(),
    );
  }
}
