import 'package:flutter/material.dart';
import 'package:project_final/FlatSearch/00_MainPage.dart';
import 'package:project_final/FlatmateSearch/01_UserForm.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({
    Key key,
  }) : super(key: key);

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
                      'https://firebasestorage.googleapis.com/v0/b/finalproject-62a57.appspot.com/o/WelcomePage%2FWelcome1.jpg?alt=media&token=e80a494f-3c7a-487c-8ed4-02ae5591ac2c'))),
        ),
      ),
      Column(
        children: [
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Hey Mate!',
                style: TextStyle(
                    wordSpacing: 10,
                    letterSpacing: 5,
                    fontSize: 32,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(left: 15, right: 25),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('What are you looking for?',
                          style: TextStyle(
                              wordSpacing: 10,
                              letterSpacing: 5,
                              fontSize: 21,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    TextButton(
                      style: ButtonStyle(
                          padding:
                              MaterialStateProperty.all(EdgeInsets.all(15)),
                          shape:
                              MaterialStateProperty.all(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(
                                    width: 3,
                                    color: Colors.red[300],
                                  )))),
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FlatSearch())),
                      child: Text("I'm looking for a Place to Stay",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              wordSpacing: 10,
                              letterSpacing: 5,
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                    Spacer(),
                    TextButton(
                      style: ButtonStyle(
                          padding:
                              MaterialStateProperty.all(EdgeInsets.all(15)),
                          shape:
                              MaterialStateProperty.all(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(
                                    width: 3,
                                    color: Colors.blue[300],
                                  )))),
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForFlatMate())),
                      child: Text("I'm looking for a Flatmate",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              wordSpacing: 10,
                              letterSpacing: 5,
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                    Spacer(
                      flex: 3,
                    ),
                  ],
                ),
              )),
          Padding(
            padding: const EdgeInsets.only(right: 15, bottom: 20),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.swipe,
                    color: Colors.white,
                  ),
                  Text('Know More!',
                      style: TextStyle(
                          wordSpacing: 10,
                          letterSpacing: 5,
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold))
                ],
              ),
            ),
          )
        ],
      )
    ]);
  }
}
