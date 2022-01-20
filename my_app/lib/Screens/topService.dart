// ignore_for_file: import_of_legacy_library_into_null_safe, prefer_const_constructors, unnecessary_new

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/Components/row_item.dart';
import 'package:my_app/Theme/theme.dart';
import 'package:my_app/models/home.dart';

class TopServices extends StatefulWidget {
  const TopServices({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<TopServices> {
  Home parseJson(String responseBody) {
    return Home.fromJson(jsonDecode(responseBody));
  }

  Future<Home> fetchHome() async {
    dynamic headers = {
      "X-API-KEY": "lKK_012LajDh9sf9KKjhasdNHjlcsd23UaNB82Kj",
      "Accept": "application/json",
      "Content-Type": "application/json",
    };
    final response =
        await http.get('https://demo.myspa.vn/moba/v1/home', headers: headers);
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
        title: const Text('Dịch vụ nổi bật'),
        backgroundColor: appBgColor,
      ),
      body: FutureBuilder<Home>(
        future: fetchHome(),
        builder: (context, data) {
          if (data.connectionState == ConnectionState.done) {
            return Scaffold(
              body: new GridView.builder(
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                ),
                itemCount: data.data!.dataReturn!.topService!.length,
                padding: new EdgeInsets.all(8.0),
                itemBuilder: (BuildContext context, int index) {
                  return RowItem(
                    name: data.data!.dataReturn!.topService![index].itemName,
                    price: data.data!.dataReturn!.topService![index].price,
                    image: data.data!.dataReturn!.topService![index].image,
                  );
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
}
