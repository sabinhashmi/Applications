import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '04_ImageScreen.dart';

// ignore: must_be_immutable
class FlatDetailsPage extends StatelessWidget {
  int index;
  CollectionReference cityReference;
  FlatDetailsPage(this.index, this.cityReference);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
      ),
      body: DetailsPageBody(index, cityReference),
    );
  }
}

// ignore: must_be_immutable
class DetailsPageBody extends StatelessWidget {
  int index;
  CollectionReference cityReference;
  DetailsPageBody(this.index, this.cityReference);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: cityReference.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.data == null) {
            return Text('Loading..');
          } else {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Text(
                  'Flat Details',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              body: Card(
                  color: Colors.teal[150],
                  child: Stack(children: [
                    Container(
                      padding: EdgeInsets.only(top: 180),
                      child: ListView(
                        children: [
                          buildListTile(
                              snapshot,
                              index,
                              'Customer Name',
                              'customerName',
                              Icons.account_circle_sharp,
                              Colors.teal),
                          buildListTile(snapshot, index, 'Gender', 'gender',
                              Icons.face, Colors.blue),
                          buildListTile(snapshot, index, 'Rent', 'monthlyRent',
                              Icons.attach_money, Colors.black),
                          buildListTile(snapshot, index, 'Deposit', 'deposit',
                              Icons.attach_money, Colors.blue),
                          buildListTile(snapshot, index, 'Location', 'location',
                              Icons.add_location, Colors.red),
                          buildListTile(snapshot, index, 'Minimum Duration',
                              'minDuration', Icons.calendar_today, Colors.red),
                          buildListTile(
                              snapshot,
                              index,
                              'Maximum Duration',
                              'maxDuration',
                              Icons.calendar_today,
                              Colors.green),
                          buildListTile(snapshot, index, 'Landmark', 'landmark',
                              Icons.add_location_alt, Colors.green),
                          buildListTile(
                              snapshot,
                              index,
                              'Apartment Type',
                              'apartmentType',
                              Icons.location_city,
                              Colors.brown),
                          buildListTile(snapshot, index, 'Student', 'student',
                              Icons.menu_book, Colors.black),
                          buildListTile(snapshot, index, 'Age', 'age',
                              Icons.emoji_emotions, Colors.blue[900]),
                          buildListTile(
                              snapshot,
                              index,
                              'Contact Number',
                              'contactNumber',
                              Icons.ad_units,
                              Colors.purple[900]),
                          buildListTile(snapshot, index, 'Email', 'emailid',
                              Icons.alternate_email, Colors.black),
                          buildListTile(snapshot, index, 'Special Note',
                              'specialNote', Icons.notes, Colors.green[900]),
                        ],
                      ),
                    ),
                    Container(
                        width: double.infinity,
                        height: 180,
                        child: PageView(children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return ImageScreen(
                                    snapshot.data.docs[index]['photourl_01']);
                              }));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.black, width: 2),
                                  borderRadius: BorderRadius.circular(25),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(snapshot
                                          .data.docs[index]['photourl_01']))),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return ImageScreen(
                                    snapshot.data.docs[index]['photourl_02']);
                              }));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.black, width: 2),
                                  borderRadius: BorderRadius.circular(25),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(snapshot
                                          .data.docs[index]['photourl_02']))),
                            ),
                          ),
                        ])),
                  ])),
            );
          }
        });
  }
}

ListTile buildListTile(AsyncSnapshot<QuerySnapshot> snapshot, int index,
    String text_1, String text_2, IconData iconName, Color color) {
  return ListTile(
    leading: Icon(
      iconName,
      color: color,
    ),
    title: Text(
      text_1 + ' : ' + snapshot.data.docs[index][text_2].toString(),
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
  );
}
