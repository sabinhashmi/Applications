import 'package:flutter/material.dart';

PageController pageController = PageController(
  initialPage: 0,
);
int pageChanged = 0;

TextField buildTextField(
    TextEditingController textEdit, String labelText, TextInputType type) {
  return TextField(
    keyboardType: type,
    style: TextStyle(
        backgroundColor: Colors.black38,
        fontWeight: FontWeight.bold,
        color: Colors.white),
    autocorrect: false,
    onSubmitted: (value) {
      pageController.animateToPage(pageChanged + 1,
          duration: Duration(seconds: 1), curve: Curves.elasticIn);
    },
    controller: textEdit,
    decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(width: 2, color: Colors.white)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(width: 2, color: Colors.white)),
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.white)),
  );
}
