// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class qrscan extends StatefulWidget {
  const qrscan({Key? key}) : super(key: key);

  @override
  State<qrscan> createState() => _qrscanState();
}

class _qrscanState extends State<qrscan> {
  String barcode = "";

  Future scanBarcode() async {
    String result = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666", "Cancel", true, ScanMode.QR);
    setState(() {
      barcode = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () {
          scanBarcode();
        },
      ),
    );
  }
}
