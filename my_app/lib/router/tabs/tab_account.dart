// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class TabAccount extends StatelessWidget {
  const TabAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
        child: Column(
          // center the children
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.airport_shuttle,
              size: 160.0,
              color: Colors.red,
            ),
            const Text(
              "Third Tab",
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
