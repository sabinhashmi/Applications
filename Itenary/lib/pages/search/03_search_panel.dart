// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:itenary/pages/search/04_search_result.dart';

class SearchPanel extends StatelessWidget {
  const SearchPanel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: 150,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.blue, width: 3),
            borderRadius: BorderRadius.circular(50)),
        child: Column(children: [
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.search)),
              TextButton(onPressed: () {}, child: Text('From Where')),
              TextButton(onPressed: () {}, child: Text('Where To')),
              TextButton(onPressed: () {}, child: Text('From When')),
              TextButton(onPressed: () {}, child: Text('Until When'))
            ],
          )),
          Expanded(
            child: Center(
                child: RawMaterialButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchResult()));
              },
              child: Text('Submit'),
            )),
          ),
        ]),
      ),
    );
  }
}
