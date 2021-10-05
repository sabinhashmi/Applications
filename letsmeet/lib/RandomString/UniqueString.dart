// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:random_string/random_string.dart';

class UniqueString extends StatefulWidget {
  const UniqueString({Key? key}) : super(key: key);

  @override
  State<UniqueString> createState() => _UniqueStringState();
}

class _UniqueStringState extends State<UniqueString> {
  String text = randomNumeric(5);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          QrImage(
            data: text,
            size: 150,
          ),
          Container(
            height: 60,
            width: 300,
            child: Center(
                child: Text(
              text,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            )),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.transparent,
                border: Border.all(color: Colors.blueGrey, width: 4)),
          ),
          Container(
            padding: EdgeInsets.all(30),
          ),
          MaterialButton(
            color: Colors.blue[900],
            onPressed: () {
              setState(() {
                text = randomNumeric(5);
              });
            },
            child: Text(
              'Generate New Codes!',
              style: TextStyle(color: Colors.white),
            ),
          )
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
      ),
    );
  }
}
