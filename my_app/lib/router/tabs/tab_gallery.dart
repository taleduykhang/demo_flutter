// ignore_for_file: prefer_const_literals_to_create_immutables, import_of_legacy_library_into_null_safe

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_app/models/gallery.dart';

import 'package:http/http.dart' as http;
import 'package:my_app/Theme/theme.dart';

class TabGallery extends StatefulWidget {
  const TabGallery({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<TabGallery> {
  dynamic dataApi;

  // static const Color appBgColor = Color(0XFF377d75);
  Future<Gallery> fetchProducts() async {
    dynamic headers = {
      "X-API-KEY": "",
      "Accept": "application/json",
      "Content-Type": "application/json",
    };
    final response = await http.get(
        'https://demo.myspa.vn/moba/v1/Gallery/get_list',
        headers: headers);
    if (response.statusCode == 200) {
      dataApi = jsonDecode(response.body)!['items'];
      return jsonDecode(response.body);
    } else {
      throw Exception('Unable to fetch products from the REST API');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thư viện'),
        backgroundColor: appBgColor,
      ),
      body: FutureBuilder(
        future: fetchProducts(),
        builder: (context, data) {
          if (data.connectionState == ConnectionState.done) {
            return SizedBox(
              // Vertical ListView
              // height: 150.0,
              child: ListView.builder(
                itemCount: dataApi!.length,
                // controller: PageController(viewportFraction: 0.9),
                itemBuilder: (BuildContext context, int itemIndex) {
                  return _buildCarouselItem(context, itemIndex);
                },
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget _buildCarouselItem(BuildContext context, int itemIndex) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      width: (MediaQuery.of(context).size.width),
      height: (MediaQuery.of(context).size.width - 200),
      child: Image.network(dataApi![itemIndex]['thumbnail'], fit: BoxFit.cover),
    );
  }
}
