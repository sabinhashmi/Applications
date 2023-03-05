import 'package:flutter/material.dart';
import 'package:itenary/constants/page_controller.dart';

FloatingActionButton goUpButton = FloatingActionButton(
    child: const Icon(Icons.home_filled),
    onPressed: () {
      pageController.animateToPage(0,
          duration: const Duration(milliseconds: 1000),
          curve: Curves.decelerate);
    });
