import 'package:flutter/material.dart';

class ImageScreen extends StatelessWidget {
  final String url;
  ImageScreen(this.url);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2),
              borderRadius: BorderRadius.circular(25),
              image: DecorationImage(
                  fit: BoxFit.contain, image: NetworkImage(url))),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(
          Icons.arrow_back,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
