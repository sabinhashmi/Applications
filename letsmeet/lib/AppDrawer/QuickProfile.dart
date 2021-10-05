// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QuickProfile extends StatefulWidget {
  const QuickProfile({Key? key}) : super(key: key);

  @override
  State<QuickProfile> createState() => _QuickProfileState();
}

class _QuickProfileState extends State<QuickProfile> {
  TextEditingController name = TextEditingController();
  TextEditingController status = TextEditingController();
  TextEditingController contact = TextEditingController();
  TextEditingController instagram = TextEditingController();
  TextEditingController facebook = TextEditingController();
  TextEditingController work = TextEditingController();
  TextEditingController hobbies = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.white,
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: name,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.balcony),
                    labelText: "Name",
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 18)),
              ),
              TextField(
                controller: status,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.star_outline_sharp),
                    labelText: "Status",
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 18)),
              ),
              TextField(
                keyboardType: TextInputType.phone,
                controller: contact,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.call),
                    labelText: "Contact Number",
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 18)),
              ),
              TextField(
                controller: instagram,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.photo_camera),
                    labelText: "Instagram",
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 18)),
              ),
              TextField(
                controller: facebook,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.bookmarks),
                    labelText: "Facebook",
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 18)),
              ),
              TextField(
                controller: work,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.work),
                    labelText: "Work",
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 18)),
              ),
              TextField(
                controller: hobbies,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.link_rounded),
                    labelText: "Hobbies",
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 18)),
              ),
              SizedBox(
                height: 30,
              ),
              MaterialButton(
                padding: EdgeInsets.symmetric(horizontal: 50),
                color: Colors.black,
                onPressed: () {
                  setState(() {});
                },
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                  child: name.text != ""
                      ? Text(
                          'Hey, You are now ' + name.text + ' !',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 28,
                          ),
                        )
                      : null)
            ],
          )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
    );
  }
}
