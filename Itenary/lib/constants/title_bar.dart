import 'package:flutter/material.dart';
import 'package:itenary/constants/page_controller.dart';

AppBar titleBar = AppBar(
  title: const Text('Welcome to The Itenary!',
      style: TextStyle(color: Colors.black)),
  actions: [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton.icon(
            onPressed: () {
              pageController.animateToPage(0,
                  duration: const Duration(milliseconds: 1000),
                  curve: Curves.decelerate);
            },
            icon: const Icon(
              Icons.home,
              color: Colors.black,
            ),
            label: const Text('Home')),
        TextButton.icon(
            onPressed: () {
              pageController.animateToPage(1,
                  duration: const Duration(milliseconds: 1000),
                  curve: Curves.decelerate);
            },
            icon: const Icon(
              Icons.description,
              color: Colors.black,
            ),
            label: const Text('About Us')),
        TextButton.icon(
            onPressed: () {
              pageController.animateToPage(2,
                  duration: const Duration(milliseconds: 1000),
                  curve: Curves.decelerate);
            },
            icon: const Icon(
              Icons.call,
              color: Colors.black,
            ),
            label: const Text('Contact')),
        TextButton.icon(
            onPressed: () {},
            icon: const Icon(
              Icons.hub,
              color: Colors.black,
            ),
            label: const Text("Traveler's Hub!")),
      ],
    )
  ],
  leading: const Icon(
    Icons.ac_unit,
    color: Colors.black,
  ),
  elevation: 0,
  backgroundColor: Colors.white,
);
