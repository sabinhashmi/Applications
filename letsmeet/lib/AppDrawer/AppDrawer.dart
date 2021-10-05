// ignore_for_file: prefer_const_constructors, must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:letsmeet/AppDrawer/QuickProfile.dart';
import 'package:letsmeet/AppDrawer/History.dart';
import 'package:letsmeet/AppDrawer/About.dart';
import 'package:letsmeet/AppDrawer/Terms.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserAccountsDrawerHeader(
          decoration: BoxDecoration(color: Colors.black),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.amber,
            child: Text(
              'SH',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          accountName: Text("Sabin Hashmi"),
          accountEmail: Text("sabinhashmi@gmail.com"),
        ),
        Expanded(
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                ListTile(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => QuickProfile())),
                    leading: Icon(
                      Icons.face,
                      color: Colors.black,
                    ),
                    title: Text(
                      "Quick Profile",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    )),
                ListTile(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => History())),
                    leading: Icon(
                      Icons.book,
                      color: Colors.red,
                    ),
                    title: Text(
                      "History",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    )),
                ListTile(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AboutUs())),
                    leading: Icon(Icons.group, color: Colors.blue),
                    title: Text(
                      "About Us!",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    )),
                ListTile(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Terms())),
                    leading: Icon(
                      Icons.security,
                      color: Colors.green,
                    ),
                    title: Text(
                      "Terms and Conditions",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          ),
        )
      ],
    );
  }
}
