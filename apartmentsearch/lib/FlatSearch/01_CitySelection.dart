import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '02_CitySpecific.dart';

// ignore: must_be_immutable
class CityCelection extends StatelessWidget {
  CollectionReference cityReference =
      FirebaseFirestore.instance.collection('cities');
  List<Map> cities = [
    {
      'city': 'Chennai',
      'image':
          'https://firebasestorage.googleapis.com/v0/b/finalproject-62a57.appspot.com/o/Cities%2FChennai%20India%20Whimsical%20City%20Skyline%20Fun%20Tall%20Bright%20Series%20by%20Design%20Turnpike.jpg?alt=media&token=a977e0ce-ded8-4bb0-930e-63ccb176f1e4'
    },
    {
      'city': 'Delhi',
      'image':
          'https://firebasestorage.googleapis.com/v0/b/finalproject-62a57.appspot.com/o/Cities%2FDelhi%20India%20City%20Skyline%20Fun%20Tall%20Bright%20Series%20by%20Design%20Turnpike.jpg?alt=media&token=86cd0c11-4540-4fbf-b546-d2934524fc6d'
    },
    {
      'city': 'Mumbai',
      'image':
          'https://firebasestorage.googleapis.com/v0/b/finalproject-62a57.appspot.com/o/Cities%2FMumbai%20India%20Whimsical%20City%20Skyline%20Fun%20Bright%20Tall%20Series%20by%20Design%20Turnpike.jpg?alt=media&token=a962d77a-3dab-440e-bd01-4bbcf7abf044'
    }
  ];

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
                      'https://images.unsplash.com/photo-1504587614488-3259c5c1d9b7?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80'))),
        ),
      ),
      GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 150),
          itemCount: cities.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 8),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return CitySpecific(cities[index]['city']);
                }));
              },
              child: Stack(children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(cities[index]['image'])),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),

                // In case if the image does not have the name in it use this piece of code for
                // creating the named buttons.
                //
                // Center(
                //   child: TextButton(
                //     style: ButtonStyle(
                //         shape: MaterialStateProperty.all(
                //             RoundedRectangleBorder(
                //                 side: BorderSide(width: 2),
                //                 borderRadius: BorderRadius.circular(10))),
                //         backgroundColor:
                //             MaterialStateProperty.all(Colors.black54)),
                //     child: Text(
                //       cities[index]['city'],
                //       style: TextStyle(
                //           color: Colors.white,
                //           fontSize: 18,
                //           fontStyle: FontStyle.italic,
                //           fontWeight: FontWeight.bold),
                //     ),
                //     onPressed: () {
                //       Navigator.push(context,
                //           MaterialPageRoute(builder: (context) {
                //         return CitySpecific(cities[index]['city']);
                //       }));
                //     },
                //   ),
                // )
              ]),
            );
          }),
    ]);
  }
}
