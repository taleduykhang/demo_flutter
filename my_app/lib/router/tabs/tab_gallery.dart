// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class TabGallery extends StatelessWidget {
  const TabGallery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Column(
          // center the children
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.adb,
              size: 160.0,
              color: Colors.white,
            ),
            const Text(
              "Second Tab",
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
