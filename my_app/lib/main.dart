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

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // get console => null;
//Applying get request.

  Future<Map<String, dynamic>> fetchProducts() async {
    dynamic headers = {
      "X-API-KEY": "lKK_012LajDh9sf9KKjhasdNHjlcsd23UaNB82Kj",
      "Accept": "application/json",
      "Content-Type": "application/json",
    };
    final response =
        await http.get('https://demo.myspa.vn/moba/v1//home', headers: headers);
    if (response.statusCode == 200) {
      // ignore: dead_code, unused_local_variable
      Map<String, dynamic> map = jsonDecode(response.body);
      // Map<String, dynamic> name = map['data_return'];
      // print(name);
      return map;
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
        builder: (context, data) {
          // ignore: unused_local_variable
          Map<String, dynamic>? name = data.data as Map<String, dynamic>?;
          dynamic abc = name!['data_return'];
          dynamic xyz = abc!['promo'];
          print('abc123 $xyz');
          if (data.connectionState == ConnectionState.done) {
            return ListView.builder(
                padding: const EdgeInsets.all(20),
                itemCount: xyz.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: ListTile(
                        title: Text(
                          xyz[index]['promo_title'],
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        leading: CircleAvatar(
                          child: Image.network(
                            xyz[index]['promo_image'],
                          ),
                        ),
                        trailing: Text("\$ ${xyz[index]['promo_id']}"),
                      ),
                    ),
                  );
                });
          }
          return const Center(
            child: const CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
