// ignore_for_file: import_of_legacy_library_into_null_safe, prefer_const_constructors, unnecessary_new

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/Components/row_item.dart';
import 'package:my_app/Theme/theme.dart';
import 'package:my_app/models/feature_service.dart';
import 'package:my_app/models/home.dart';

class MoreService extends StatefulWidget {
  const MoreService({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<MoreService> {
  FeaturedServices parseJson(String responseBody) {
    return FeaturedServices.fromJson(jsonDecode(responseBody));
  }

  Future<FeaturedServices> fetchProducts() async {
    dynamic headers = {
      "X-API-KEY": "",
      "Accept": "application/json",
      "Content-Type": "application/json",
    };
    final response = await http.get(
        'https://demo.myspa.vn/moba/v1/Service/get_featured_services',
        headers: headers);
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
        // title: Image.asset('assets/LogoApp.png', height: 50, width: 50,),
        title: const Text('Dịch vụ nổi bật'),
        backgroundColor: appBgColor,
      ),
      body: FutureBuilder<FeaturedServices>(
        future: fetchProducts(),
        builder: (context, data) {
          if (data.connectionState == ConnectionState.done) {
            return Scaffold(
              body: new GridView.builder(
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                ),
                itemCount: data.data!.items!.length,
                padding: new EdgeInsets.all(0.0),
                itemBuilder: (BuildContext context, int index) {
                  return RowItem(
                    name: data.data!.items![index].name,
                    price: data.data!.items![index].price,
                    image: data.data!.items![index].image,
                    index: index,
                    dataApi: data.data!.items,
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
