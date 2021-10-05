import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '03_FlatDetails.dart';

class FlatListGrid extends StatelessWidget {
  const FlatListGrid({
    Key key,
    @required this.cityReference,
  }) : super(key: key);

  final CollectionReference cityReference;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: cityReference.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Text('Loading..');
          } else {
            return GridView.builder(
                itemCount: snapshot.data.docs.length,
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 150),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10),
                itemBuilder: (context, index) {
                  {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return FlatDetailsPage(index, cityReference);
                        }));
                      },
                      child: Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(children: [
                          Expanded(
                            flex: 5,
                            child: Container(
                                margin: EdgeInsets.all(13),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(snapshot
                                          .data.docs[index]['photourl_01'])),
                                )),
                          ),
                          // Align(
                          //   alignment: Alignment.bottomCenter,
                          //   child: Text(
                          //       'Rent:' +
                          //           snapshot.data.docs[index]['monthlyRent']
                          //               .toString(),
                          //       style: TextStyle(
                          //           backgroundColor: Colors.white,
                          //           fontSize: 17,
                          //           fontWeight: FontWeight.bold)),
                          // ),
                          Expanded(
                            child: Container(
                              color: Colors.black54,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Rent : ' +
                                        snapshot.data.docs[index]
                                            ['monthlyRent'],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                      'Deposit : ' +
                                          snapshot.data.docs[index]['deposit'],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                  Text(
                                      'Available for ' +
                                          snapshot.data.docs[index]['gender'],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold))
                                ],
                              ),
                            ),
                          )
                        ]),
                      ),
                    );
                  }
                });
          }
        });
  }
}
