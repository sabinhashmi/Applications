import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '02b_StreamBuilder.dart';

// ignore: must_be_immutable
class CitySpecific extends StatelessWidget {
  String cityName;
  CitySpecific(this.cityName);

  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          child: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        body: CityOutline(cityName));
  }
}

// ignore: must_be_immutable
class CityOutline extends StatelessWidget {
  String cityName;
  CityOutline(this.cityName);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        color: Colors.black,
      ),
      Opacity(
        opacity: 0.6,
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://images.unsplash.com/photo-1487147264018-f937fba0c817?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=934&q=80'))),
        ),
      ),
      CityListView(cityName),
      Container(
        width: double.infinity,
        height: 100,
        child: Center(
            child: Text(cityName,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 28))),
        decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(35),
            color: Colors.white24),
      ),
    ]);
  }
}

// ignore: must_be_immutable
class CityListView extends StatelessWidget {
  String cityName;
  CityListView(this.cityName);

  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    if (cityName == 'Chennai') {
      CollectionReference cityReference =
          FirebaseFirestore.instance.collection('chennai_customers');
      return FlatListGrid(cityReference: cityReference);
    } else if (cityName == 'Delhi') {
      CollectionReference cityReference =
          FirebaseFirestore.instance.collection('delhi_customers');
      return FlatListGrid(cityReference: cityReference);
    } else if (cityName == 'Mumbai') {
      CollectionReference cityReference =
          FirebaseFirestore.instance.collection('mumbai_customers');
      return FlatListGrid(cityReference: cityReference);
    }
  }
}
