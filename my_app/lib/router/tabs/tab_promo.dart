// ignore_for_file: prefer_const_literals_to_create_immutables, import_of_legacy_library_into_null_safe

import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:my_app/Theme/theme.dart';
import 'package:my_app/models/home.dart';

class TabPromo extends StatefulWidget {
  const TabPromo({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<TabPromo> {
  dynamic dataApi;

  Future<Promo> fetchProducts() async {
    dynamic headers = {
      "X-API-KEY": "lKK_012LajDh9sf9KKjhasdNHjlcsd23UaNB82Kj",
      "Accept": "application/json",
      "Content-Type": "application/json",
    };
    final response = await http
        .get('https://demo.myspa.vn/moba/v1/Promo/get_list', headers: headers);
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
        title: const Text('Khuyến mãi'),
        backgroundColor: appBgColor,
      ),
      body: FutureBuilder(
        future: fetchProducts(),
        builder: (context, data) {
          if (data.connectionState == ConnectionState.done) {
            return SizedBox(
              // Vertical ListView
              child: ListView.builder(
                itemCount: dataApi!.length,
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
      child: Image.network(dataApi![itemIndex]['image'], fit: BoxFit.cover),
    );
  }
}
