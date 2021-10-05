// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:letsmeet/QRScan/qrscan.dart';
import 'package:letsmeet/CheckIn/CheckIn.dart';
import 'package:letsmeet/RandomString/UniqueString.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Container(
          child: const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Welcome to Let's Meet!",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 36),
              )),
          color: Colors.black,
        )),
        Expanded(
            child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CheckIn())),
                      child: const Text("Check-in")),
                  ElevatedButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const UniqueString())),
                      child: const Text('Generate Unique String'))
                ],
              ),
              Align(
                alignment: Alignment.center,
                child: IconButton(
                  iconSize: 40,
                  icon: const Icon(Icons.qr_code_scanner),
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const qrscan())),
                ),
              )
            ],
          ),
          color: Colors.white,
        ))
      ],
    );
  }
}
