// ignore_for_file: import_of_legacy_library_into_null_safe, no_logic_in_create_state, empty_statements, avoid_unnecessary_containers, avoid_print, unnecessary_const

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

//Creating a class user to store the data;
class User {
  final int id;
  final int userId;
  final String title;
  final String body;

  User({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
  });
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // get console => null;
//Applying get request.

  Future<Home> fetchProducts() async {
    dynamic headers = {
      "X-API-KEY": "lKK_012LajDh9sf9KKjhasdNHjlcsd23UaNB82Kj",
      "Accept": "application/json",
      "Content-Type": "application/json",
    };
    final response =
        await http.get('https://demo.myspa.vn/moba/v1//home', headers: headers);
    if (response.statusCode == 200) {
      // ignore: dead_code
      print(jsonDecode(response.body));

      return jsonDecode(response.body);
    } else {
      throw Exception('Unable to fetch products from the REST API');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter REST API'),
      ),
      body: FutureBuilder(
        future: fetchProducts(),
        builder: (context, snapshot) {
          final data = snapshot.data;
          print('abc $snapshot');
          if (snapshot.connectionState == ConnectionState.done) {}
          return const Center(
            child: const CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
