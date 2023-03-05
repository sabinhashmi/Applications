// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:itenary/pages/search/tabs/about_city.dart';

import 'package:itenary/pages/search/tabs/people.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: const [
              Tab(
                  text: 'Itenary',
                  icon: Icon(
                    Icons.book,
                    color: Colors.black,
                  )),
              Tab(
                  text: 'People',
                  icon: Icon(
                    Icons.people,
                    color: Colors.black,
                  )),
              Tab(
                  text: 'About City',
                  icon: Icon(
                    Icons.location_city,
                    color: Colors.black,
                  )),
            ],
          ),
        ),
        body: TabBarView(children: [
          Padding(
              padding: EdgeInsets.all(50),
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black,
                      image: DecorationImage(
                          opacity: 0.4,
                          fit: BoxFit.fill,
                          image: AssetImage('backgrounds/homepage.jpg'))))),
          PeoplePage(),
          AboutCity()
        ]),
      ),
    );
  }
}
