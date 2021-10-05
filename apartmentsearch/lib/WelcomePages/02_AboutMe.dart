import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        color: Colors.black,
      ),
      Opacity(
        opacity: 0.4,
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://firebasestorage.googleapis.com/v0/b/finalproject-62a57.appspot.com/o/WelcomePage%2FWelcome2.jpg?alt=media&token=d6c0925e-1693-47b9-bbf0-284965e43e46'))),
        ),
      ),
      Column(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'About Project',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold),
                    )),
              )),
          Expanded(
              flex: 3,
              child: Container(
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.apartment,
                        color: Colors.white,
                      ),
                      title: Text(
                        'We know how difficult is to move to a new city and find a place to stay. \n\nProject helps people to connect each other and find a place to stay for short or long period of time.',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Spacer(),
                    ListTile(
                      leading: Icon(
                        Icons.share,
                        color: Colors.white,
                      ),
                      title: Text(
                        'You can share your place and meet up more people, may be it will be a beginning of a long friendship.',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Spacer(),
                    ListTile(
                      leading: Icon(
                        Icons.face,
                        color: Colors.white,
                      ),
                      title: Text(
                        'You you choose your preferences depends on..  "You!"',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Spacer(),
                    ListTile(
                      leading: Icon(
                        Icons.email,
                        color: Colors.white,
                      ),
                      subtitle: Text('email@project.com',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w500)),
                      title: Text(
                        'Need more help? Write us!',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                    Spacer(),
                    Spacer(
                      flex: 2,
                    )
                  ],
                ),
              ))
        ],
      )
    ]);
  }
}
