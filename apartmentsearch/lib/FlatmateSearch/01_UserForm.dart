import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '01b_TextField.dart';

class ForFlatMate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          }),
      body: ForFlatMateBody(),
    );
  }
}

// ignore: must_be_immutable
class ForFlatMateBody extends StatefulWidget {
  @override
  _ForFlatMateBodyState createState() => _ForFlatMateBodyState();
}

class _ForFlatMateBodyState extends State<ForFlatMateBody> {
  TextEditingController controlName = TextEditingController();

  TextEditingController controlRent = TextEditingController();

  TextEditingController controlDeposit = TextEditingController();
  TextEditingController controlMinDuration = TextEditingController();
  TextEditingController controlMaxDuration = TextEditingController();

  TextEditingController controlLandmark = TextEditingController();

  TextEditingController controlAge = TextEditingController();

  TextEditingController controlNumber = TextEditingController();

  TextEditingController controlEmail = TextEditingController();

  TextEditingController controlSpecialNote = TextEditingController();

  CollectionReference chennaiCustomers =
      FirebaseFirestore.instance.collection('chennai_customers');
  CollectionReference delhiCustomers =
      FirebaseFirestore.instance.collection('delhi_customers');
  CollectionReference mumbaiCustomers =
      FirebaseFirestore.instance.collection('mumbai_customers');

  var imageUrl_01;
  File image_01;

  Future imageUpload_01(String dirpath) async {
    final instance = FirebaseStorage.instance;

    final pickedImage =
        await ImagePicker().getImage(source: ImageSource.gallery);
    image_01 = File(pickedImage.path);

    if (image_01 != null) {
      // ignore: unused_local_variable
      var imagePut_01 = await instance.ref().child(dirpath).putFile(image_01);

      final downloadUrl_01 =
          await instance.ref().child(dirpath).getDownloadURL();

      if (mounted) {
        setState(() {
          imageUrl_01 = downloadUrl_01;
        });
      }
    }
  }

  var imageUrl_02;
  File image_02;

  Future imageUpload_02(String dirpath) async {
    final instance = FirebaseStorage.instance;

    final pickedImage =
        await ImagePicker().getImage(source: ImageSource.gallery);
    image_02 = File(pickedImage.path);

    if (image_02 != null) {
      // ignore: unused_local_variable
      var imagePut_02 = await instance.ref().child(dirpath).putFile(image_02);

      final downloadUrl_02 =
          await instance.ref().child(dirpath).getDownloadURL();

      if (mounted) {
        setState(() {
          imageUrl_02 = downloadUrl_02;
        });
      }
    }
  }

  String city;

  String apartment;

  String student;

  String gender;

  final snackBar = SnackBar(content: Text('Yay!! Your apartment is enlisted!'));

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
                      'https://firebasestorage.googleapis.com/v0/b/finalproject-62a57.appspot.com/o/WelcomePage%2FQuestionsPage.jpg?alt=media&token=3707917b-1db6-43a7-965f-52bd1fabce19'))),
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(vertical: 100, horizontal: 20),
        child: PageView(
          // physics: NeverScrollableScrollPhysics(),
          onPageChanged: (index) {
            setState(() {
              pageChanged = index;
            });
          },
          controller: pageController,
          children: [
            Center(
              child:
                  buildTextField(controlName, 'Your Name?', TextInputType.name),
            ),

            //
            //
            //
            //
            //

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    'Apartment for ...',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Column(
                  children: [
                    ListTile(
                      title: Text(
                        'Men',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      leading: Radio(
                          fillColor: MaterialStateProperty.all(Colors.white),
                          value: 'Men',
                          groupValue: gender,
                          onChanged: (value) {
                            setState(() {
                              gender = value;
                            });
                            pageController.animateToPage(pageChanged + 1,
                                duration: Duration(seconds: 1),
                                curve: Curves.elasticIn);
                          }),
                    ),
                    ListTile(
                      title: Text(
                        'Women',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      leading: Radio(
                          fillColor: MaterialStateProperty.all(Colors.white),
                          value: 'Women',
                          groupValue: gender,
                          onChanged: (value) {
                            setState(() {
                              gender = value;
                            });
                            pageController.animateToPage(pageChanged + 1,
                                duration: Duration(seconds: 1),
                                curve: Curves.elasticIn);
                          }),
                    ),
                    ListTile(
                      title: Text(
                        'Anybody',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      leading: Radio(
                          fillColor: MaterialStateProperty.all(Colors.white),
                          value: 'Anybody',
                          groupValue: gender,
                          onChanged: (value) {
                            setState(() {
                              gender = value;
                            });
                            pageController.animateToPage(pageChanged + 1,
                                duration: Duration(seconds: 1),
                                curve: Curves.elasticIn);
                          }),
                    ),
                  ],
                ),
              ],
            ),
            //
            //
            //
            //
            Center(
                child: buildTextField(
                    controlRent,
                    'Rent?',
                    TextInputType.numberWithOptions(
                        signed: true, decimal: true))),
            Center(
                child: buildTextField(
                    controlDeposit,
                    'Deposit?',
                    TextInputType.numberWithOptions(
                        signed: true, decimal: true))),

            //
            //
            //
            //
            Center(
                child: buildTextField(
                    controlMinDuration,
                    'Minimum Available Days? ',
                    TextInputType.numberWithOptions(
                        signed: true, decimal: true))),
            Center(
                child: buildTextField(
                    controlMaxDuration,
                    'Maximum available days?',
                    TextInputType.numberWithOptions(
                        signed: true, decimal: true))),

            //
            //

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    'What is your Location?',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Column(
                  children: [
                    ListTile(
                      title: Text(
                        'Chennai',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      leading: Radio(
                          fillColor: MaterialStateProperty.all(Colors.white),
                          value: 'Chennai',
                          groupValue: city,
                          onChanged: (value) {
                            setState(() {
                              city = value;
                            });
                            pageController.animateToPage(pageChanged + 1,
                                duration: Duration(seconds: 1),
                                curve: Curves.elasticIn);
                          }),
                    ),
                    ListTile(
                      title: Text(
                        'Delhi',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      leading: Radio(
                          fillColor: MaterialStateProperty.all(Colors.white),
                          value: 'Delhi',
                          groupValue: city,
                          onChanged: (value) {
                            setState(() {
                              city = value;
                            });
                            pageController.animateToPage(pageChanged + 1,
                                duration: Duration(seconds: 1),
                                curve: Curves.elasticIn);
                          }),
                    ),
                    ListTile(
                      title: Text(
                        'Mumbai',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      leading: Radio(
                          fillColor: MaterialStateProperty.all(Colors.white),
                          value: 'Mumbai',
                          groupValue: city,
                          onChanged: (value) {
                            setState(() {
                              city = value;
                            });
                            pageController.animateToPage(pageChanged + 1,
                                duration: Duration(seconds: 1),
                                curve: Curves.elasticIn);
                          }),
                    )
                  ],
                ),
              ],
            ),
            //
            //
            //
            //
            Center(
                child: buildTextField(controlLandmark, 'Any Landmark?',
                    TextInputType.streetAddress)),
            //
            //
            //
            //
            //
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    'Apartment Type ?',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Column(
                  children: [
                    ListTile(
                      title: Text(
                        '1Bhk,Private Space',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      leading: Radio(
                          fillColor: MaterialStateProperty.all(Colors.white),
                          value: '1Bhk,Private Space',
                          groupValue: apartment,
                          onChanged: (value) {
                            setState(() {
                              apartment = value;
                            });
                            pageController.animateToPage(pageChanged + 1,
                                duration: Duration(seconds: 1),
                                curve: Curves.elasticIn);
                          }),
                    ),
                    ListTile(
                      title: Text(
                        '1Bhk,Shared Space',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      leading: Radio(
                          fillColor: MaterialStateProperty.all(Colors.white),
                          value: '1Bhk,Shared Space',
                          groupValue: apartment,
                          onChanged: (value) {
                            setState(() {
                              apartment = value;
                            });
                            pageController.animateToPage(pageChanged + 1,
                                duration: Duration(seconds: 1),
                                curve: Curves.elasticIn);
                          }),
                    ),
                    ListTile(
                      title: Text(
                        '2Bhk,Private Space',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      leading: Radio(
                          fillColor: MaterialStateProperty.all(Colors.white),
                          value: '2Bhk,Private Space',
                          groupValue: apartment,
                          onChanged: (value) {
                            setState(() {
                              apartment = value;
                            });
                            pageController.animateToPage(pageChanged + 1,
                                duration: Duration(seconds: 1),
                                curve: Curves.elasticIn);
                          }),
                    ),
                    ListTile(
                      title: Text(
                        '2Bhk,Shared Space',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      leading: Radio(
                          fillColor: MaterialStateProperty.all(Colors.white),
                          value: '2Bhk,Shared Space',
                          groupValue: apartment,
                          onChanged: (value) {
                            setState(() {
                              apartment = value;
                            });
                            pageController.animateToPage(pageChanged + 1,
                                duration: Duration(seconds: 1),
                                curve: Curves.elasticIn);
                          }),
                    ),
                    ListTile(
                      title: Text(
                        '3Bhk,Private Space',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      leading: Radio(
                          fillColor: MaterialStateProperty.all(Colors.white),
                          value: '3Bhk,Private Space',
                          groupValue: apartment,
                          onChanged: (value) {
                            setState(() {
                              apartment = value;
                            });
                            pageController.animateToPage(pageChanged + 1,
                                duration: Duration(seconds: 1),
                                curve: Curves.elasticIn);
                          }),
                    ),
                    ListTile(
                      title: Text(
                        '3Bhk,Shared Space',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      leading: Radio(
                          fillColor: MaterialStateProperty.all(Colors.white),
                          value: '3Bhk,Shared Space',
                          groupValue: apartment,
                          onChanged: (value) {
                            setState(() {
                              apartment = value;
                            });
                            pageController.animateToPage(pageChanged + 1,
                                duration: Duration(seconds: 1),
                                curve: Curves.elasticIn);
                          }),
                    ),
                    ListTile(
                      title: Text(
                        'Other',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      leading: Radio(
                          fillColor: MaterialStateProperty.all(Colors.white),
                          value: 'Other',
                          groupValue: apartment,
                          onChanged: (value) {
                            setState(() {
                              apartment = value;
                            });
                            pageController.animateToPage(pageChanged + 1,
                                duration: Duration(seconds: 1),
                                curve: Curves.elasticIn);
                          }),
                    ),
                  ],
                ),
              ],
            ),

            //
            //
            //
            //
            //

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    'Student or Working?',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Column(
                  children: [
                    ListTile(
                      title: Text(
                        'Student',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      leading: Radio(
                          fillColor: MaterialStateProperty.all(Colors.white),
                          value: 'Student',
                          groupValue: student,
                          onChanged: (value) {
                            setState(() {
                              student = value;
                            });
                            pageController.animateToPage(pageChanged + 1,
                                duration: Duration(seconds: 1),
                                curve: Curves.elasticIn);
                          }),
                    ),
                    ListTile(
                      title: Text(
                        'Working',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      leading: Radio(
                          fillColor: MaterialStateProperty.all(Colors.white),
                          value: 'Working',
                          groupValue: student,
                          onChanged: (value) {
                            setState(() {
                              student = value;
                            });
                            pageController.animateToPage(pageChanged + 1,
                                duration: Duration(seconds: 1),
                                curve: Curves.elasticIn);
                          }),
                    ),
                  ],
                ),
              ],
            ),

            //
            //
            //
            //
            //

            Center(
              child: buildTextField(controlAge, 'Your Age?',
                  TextInputType.numberWithOptions(signed: true, decimal: true)),
            ),
            Center(
              child: buildTextField(controlNumber, 'Contact Number ?',
                  TextInputType.numberWithOptions(signed: true, decimal: true)),
            ),
            Center(
              child: buildTextField(
                  controlEmail, 'E-Mail?', TextInputType.emailAddress),
            ),
            //
            //
            //
            Center(
                child: buildTextField(
                    controlSpecialNote, 'Special Note?', TextInputType.text)),
            //
            //

            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Expanded(
                  child: Container(
                child: Center(
                  child: Text(
                    'Upload your Image 1/2',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              )),
              if (city.toString() == 'Chennai')
                Expanded(
                    child: Container(
                        child: IconButton(
                  onPressed: () {
                    imageUpload_01('CustomerData/Chennai/' +
                            controlName.text +
                            '&' +
                            controlEmail.text +
                            '&' +
                            DateTime.now().toString())
                        .then((value) => pageController.animateToPage(
                            pageChanged + 1,
                            duration: Duration(seconds: 1),
                            curve: Curves.elasticIn));
                  },
                  iconSize: 60,
                  icon: Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                  ),
                )))
              else if (city.toString() == 'Delhi')
                Expanded(
                    child: Container(
                        child: IconButton(
                  onPressed: () {
                    imageUpload_01('CustomerData/Delhi/' +
                            controlName.text +
                            '&' +
                            controlEmail.text +
                            DateTime.now().toString())
                        .then((value) => pageController.animateToPage(
                            pageChanged + 1,
                            duration: Duration(seconds: 1),
                            curve: Curves.elasticIn));
                  },
                  iconSize: 60,
                  icon: Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                  ),
                )))
              else if (city.toString() == 'Mumbai')
                Expanded(
                    child: Container(
                        child: IconButton(
                  onPressed: () {
                    imageUpload_01('CustomerData/Mumbai/' +
                            controlName.text +
                            '&' +
                            controlEmail.text +
                            DateTime.now().toString())
                        .then((value) => pageController.animateToPage(
                            pageChanged + 1,
                            duration: Duration(seconds: 1),
                            curve: Curves.elasticIn));
                  },
                  iconSize: 60,
                  icon: Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                  ),
                )))
            ]),

            //
            //
            //
            //
            //
            //Second Image
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Expanded(
                  child: Container(
                child: Center(
                  child: Text(
                    'Upload your Image 2/2',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              )),
              if (city.toString() == 'Chennai')
                Expanded(
                    child: Container(
                        child: IconButton(
                  onPressed: () {
                    imageUpload_02('CustomerData/Chennai/' +
                            controlName.text +
                            '&' +
                            controlEmail.text +
                            '&' +
                            DateTime.now().toString() +
                            '& Image : 2')
                        .then((value) => pageController.animateToPage(
                            pageChanged + 1,
                            duration: Duration(seconds: 1),
                            curve: Curves.elasticIn));
                  },
                  iconSize: 60,
                  icon: Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                  ),
                )))
              else if (city.toString() == 'Delhi')
                Expanded(
                    child: Container(
                        child: IconButton(
                  onPressed: () {
                    imageUpload_02('CustomerData/Delhi/' +
                            controlName.text +
                            '&' +
                            controlEmail.text +
                            DateTime.now().toString() +
                            '& Image : 2')
                        .then((value) => pageController.animateToPage(
                            pageChanged + 1,
                            duration: Duration(seconds: 1),
                            curve: Curves.elasticIn));
                  },
                  iconSize: 60,
                  icon: Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                  ),
                )))
              else if (city.toString() == 'Mumbai')
                Expanded(
                    child: Container(
                        child: IconButton(
                  onPressed: () {
                    imageUpload_02('CustomerData/Mumbai/' +
                            controlName.text +
                            '&' +
                            controlEmail.text +
                            DateTime.now().toString() +
                            '& Image : 2')
                        .then((value) => pageController.animateToPage(
                            pageChanged + 1,
                            duration: Duration(seconds: 1),
                            curve: Curves.elasticIn));
                  },
                  iconSize: 60,
                  icon: Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                  ),
                )))
            ]),

            Column(children: [
              Expanded(
                  child: ListView(
                children: [
                  buildListTile('You are ', controlName.text,
                      Icons.account_circle_sharp, Colors.teal),
                  buildListTile('Age : ', controlAge.text, Icons.emoji_emotions,
                      Colors.blue[900]),
                  buildListTile('Apartment available for : ', gender.toString(),
                      Icons.face, Colors.blue),
                  buildListTile('Rent : ', controlRent.text, Icons.attach_money,
                      Colors.black),
                  buildListTile('Deposit : ', controlDeposit.text,
                      Icons.attach_money, Colors.blue),
                  buildListTile('Minimum Duration : ', controlMinDuration.text,
                      Icons.calendar_today, Colors.red),
                  buildListTile('Maximum Duration : ', controlMaxDuration.text,
                      Icons.calendar_today, Colors.green),
                  buildListTile('E-Mail Address : ', controlEmail.text,
                      Icons.alternate_email, Colors.black),
                  buildListTile('City : ', city.toString(), Icons.add_location,
                      Colors.red),
                  buildListTile('Landmark : ', controlLandmark.text,
                      Icons.add_location_alt, Colors.green),
                  buildListTile('Apartment for : ', apartment.toString(),
                      Icons.location_city, Colors.brown),
                  buildListTile('Student or Working : ', student.toString(),
                      Icons.menu_book, Colors.black),
                  buildListTile('Contact Details : ', controlNumber.text,
                      Icons.ad_units, Colors.purple[900]),
                  buildListTile('E-Mail Address : ', controlEmail.text,
                      Icons.alternate_email, Colors.black),
                  buildListTile('Special Note : ', controlSpecialNote.text,
                      Icons.notes, Colors.green[900]),
                ],
              )),
              TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white)),
                child: Text(
                  'Submit',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);

                  if (city.toString() == 'Chennai' &&
                      imageUrl_01 != null &&
                      imageUrl_02 != null) {
                    chennaiCustomers.add({
                      'customerName': controlName.text,
                      'gender': gender.toString(),
                      'monthlyRent': controlRent.text,
                      'deposit': controlDeposit.text,
                      'minDuration': controlMinDuration.text,
                      'maxDuration': controlMaxDuration.text,
                      'location': city.toString(),
                      'landmark': controlLandmark.text,
                      'apartmentType': apartment.toString(),
                      'student': student.toString(),
                      'age': controlAge.text,
                      'contactNumber': controlNumber.text,
                      'emailid': controlEmail.text,
                      'specialNote': controlSpecialNote.text,
                      'photourl_01': imageUrl_01,
                      'photourl_02': imageUrl_02,
                    });
                  } else if (city.toString() == 'Delhi' &&
                      imageUrl_01 != null &&
                      imageUrl_02 != null) {
                    delhiCustomers.add({
                      'customerName': controlName.text,
                      'gender': gender.toString(),
                      'monthlyRent': controlRent.text,
                      'deposit': controlDeposit.text,
                      'minDuration': controlMinDuration.text,
                      'maxDuration': controlMaxDuration.text,
                      'location': city.toString(),
                      'landmark': controlLandmark.text,
                      'apartmentType': apartment.toString(),
                      'student': student.toString(),
                      'age': controlAge.text,
                      'contactNumber': controlNumber.text,
                      'emailid': controlEmail.text,
                      'specialNote': controlSpecialNote.text,
                      'photourl_01': imageUrl_01,
                      'photourl_02': imageUrl_02,
                    });
                  } else if (city.toString() == 'Mumbai' &&
                      imageUrl_01 != null &&
                      imageUrl_02 != null) {
                    mumbaiCustomers.add({
                      'customerName': controlName.text,
                      'gender': gender.toString(),
                      'monthlyRent': controlRent.text,
                      'deposit': controlDeposit.text,
                      'minDuration': controlMinDuration.text,
                      'maxDuration': controlMaxDuration.text,
                      'location': city.toString(),
                      'landmark': controlLandmark.text,
                      'apartmentType': apartment.toString(),
                      'student': student.toString(),
                      'age': controlAge.text,
                      'contactNumber': controlNumber.text,
                      'emailid': controlEmail.text,
                      'specialNote': controlSpecialNote.text,
                      'photourl_01': imageUrl_01,
                      'photourl_02': imageUrl_02,
                    });
                  }
                },
              ),
            ])
          ],
        ),
      ),
    ]);
  }
}

buildListTile(String text_1, String text_2, IconData iconName, Color color) {
  return Container(
    decoration: BoxDecoration(
        border: Border.all(width: 5),
        color: Colors.white,
        borderRadius: BorderRadius.circular(35)),
    child: ListTile(
      leading: Icon(
        iconName,
        color: color,
      ),
      title: Text(
        text_1 + text_2,
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      ),
    ),
  );
}
