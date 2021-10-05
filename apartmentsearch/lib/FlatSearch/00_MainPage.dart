import 'package:flutter/material.dart';

import '01_CitySelection.dart';

class FlatSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CityCelection(),
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
