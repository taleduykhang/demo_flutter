// ignore_for_file: prefer_const_literals_to_create_immutables, import_of_legacy_library_into_null_safe

import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:my_app/Screens/detail_promo.dart';
import 'package:my_app/Theme/theme.dart';
import 'package:my_app/models/promo.dart';

class TabPromo extends StatefulWidget {
  const TabPromo({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<TabPromo> {
  Promo parseJson(String responseBody) {
    return Promo.fromJson(jsonDecode(responseBody));
  }

  Future<Promo> fetchProducts() async {
    dynamic headers = {
      "X-API-KEY": "",
      "Accept": "application/json",
      "Content-Type": "application/json",
    };
    final response = await http
        .get('https://demo.myspa.vn/moba/v1/Promo/get_list', headers: headers);
    if (response.statusCode == 200) {
      return parseJson(response.body);
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
      body: FutureBuilder<Promo>(
        future: fetchProducts(),
        builder: (context, data) {
          if (data.connectionState == ConnectionState.done) {
            return SizedBox(
              // Vertical ListView
              child: ListView.builder(
                itemCount: data.data!.items!.length,
                itemBuilder: (BuildContext context, int itemIndex) {
                  return _buildCarouselItem(
                      context, itemIndex, data.data!.items);
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

  Widget _buildCarouselItem(BuildContext context, int itemIndex, dynamic data) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        width: (MediaQuery.of(context).size.width),
        height: (MediaQuery.of(context).size.width - 200),
        child: TextButton(
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 5.0,
                  ),
                ],
              ),
              child: Image.network(data[itemIndex].image,
                  fit: BoxFit.cover,
                  width: (MediaQuery.of(context).size.width)),
            ),
            onPressed: () {
              Navigator.of(context, rootNavigator: true).push(
                MaterialPageRoute(
                  builder: (context) => const DetailPromoScreen(),
                  settings: RouteSettings(
                    arguments: data[itemIndex].id,
                    name: 'Chi tiết khuyến mãi',
                  ),
                ),
              );
            }));
  }
}
