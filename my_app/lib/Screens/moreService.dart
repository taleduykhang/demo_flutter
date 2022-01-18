// ignore_for_file: import_of_legacy_library_into_null_safe, prefer_const_constructors, unnecessary_new

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/Assets/icon.dart';
import 'package:my_app/Components/row_item.dart';
import 'package:my_app/Theme/theme.dart';
import 'package:my_app/models/feature_service.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<SecondScreen> {
  dynamic dataApi;

  Future<FeaturedServices> fetchProducts() async {
    dynamic headers = {
      "X-API-KEY": "lKK_012LajDh9sf9KKjhasdNHjlcsd23UaNB82Kj",
      "Accept": "application/json",
      "Content-Type": "application/json",
    };
    final response = await http.get(
        'https://demo.myspa.vn/moba/v1/Service/get_featured_services',
        headers: headers);
    if (response.statusCode == 200) {
      dataApi = jsonDecode(response.body)['items'];

      return jsonDecode(response.body);
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
      body: FutureBuilder(
        future: fetchProducts(),
        builder: (context, data) {
          if (data.connectionState == ConnectionState.done) {
            return Scaffold(
              body: new GridView.builder(
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                ),
                itemCount: dataApi.length,
                padding: new EdgeInsets.all(8.0),
                itemBuilder: (BuildContext context, int index) {
                  // return new RowItem(
                  //     context, index, dataApi, 'name', 'price', 'image');
                  return Text('hâhhahah');
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

  Widget _rowItem(BuildContext context, int rowIndex, dynamic dataItem,
      String name, String? price, String? image) {
    return Container(
        width: 200,
        margin: const EdgeInsets.all(8),
        alignment: Alignment.center,
        color: Colors.white,
        child: Column(children: [
          SizedBox(
            width: 200,
            child: Image.network(dataItem[rowIndex][image]),
          ),
          Container(
            margin: const EdgeInsets.all(5),
            child: Row(
              children: [
                SizedBox(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 105,
                          child: Text(
                            dataItem[rowIndex][name],
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        price != ''
                            ? SizedBox(
                                width: 105,
                                child: Text(dataItem[rowIndex]['price']))
                            : const SizedBox(),
                      ]),
                ),
                IconButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: () {},
                  icon: icCart,
                )
              ],
            ),
          )
        ]));
  }
}
