// ignore_for_file: prefer_const_literals_to_create_immutables, import_of_legacy_library_into_null_safe

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_app/Assets/icon.dart';
import 'package:my_app/models/home.dart';

import 'package:http/http.dart' as http;
import 'package:my_app/Theme/theme.dart';

class TabHome extends StatefulWidget {
  const TabHome({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<TabHome> {
  dynamic promo;
  dynamic featuredService;
  dynamic branch;
  dynamic topService;
  dynamic item;
  dynamic dataApi;
  late TabController controller;

  // static const Color appBgColor = Color(0XFF377d75);
  Future<Home> fetchProducts() async {
    dynamic headers = {
      "X-API-KEY": "lKK_012LajDh9sf9KKjhasdNHjlcsd23UaNB82Kj",
      "Accept": "application/json",
      "Content-Type": "application/json",
    };
    final response =
        await http.get('https://demo.myspa.vn/moba/v1/home', headers: headers);
    if (response.statusCode == 200) {
      dataApi = jsonDecode(response.body)!['data_return'];

      promo = dataApi!['promo'] as dynamic;
      featuredService = dataApi!['featured_service'] as dynamic;
      branch = dataApi!['branch'] as dynamic;
      topService = dataApi!['top_service'] as dynamic;
      item = dataApi!['item'] as dynamic;

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
        title: ClipRRect(
          borderRadius: BorderRadius.circular(25.0),
          child: Image.asset(
            'assets/logo.png',
            height: 50,
            width: 50,
            fit: BoxFit.cover,
          ),
        ),
        backgroundColor: appBgColor,
        // leading: Image.asset(
        //   'assets/LogoApp.png',
        //   height: 50,
        //   width: 50,
        // ),
      ),
      body: FutureBuilder(
        future: fetchProducts(),
        builder: (context, data) {
          if (data.connectionState == ConnectionState.done) {
            return ListView(
              children: <Widget>[
                SizedBox(
                  // Vertical ListView
                  height: 150.0,
                  child: PageView.builder(
                    itemCount: promo!.length,
                    controller: PageController(viewportFraction: 0.9),
                    itemBuilder: (BuildContext context, int itemIndex) {
                      return _buildCarouselItem(context, itemIndex);
                    },
                  ),
                ),
                _headerItem('Dịch vụ nổi bật', '/second'),
                SizedBox(
                  // Horizontal ListView
                  height: 280,
                  child: ListView.builder(
                    itemCount: featuredService!.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return _rowItem(context, index, featuredService,
                          'item_name', 'price', 'image');
                    },
                  ),
                ),
                _headerItem('Sản phẩm/ dịch vụ/ Thẻ DV', '/second'),
                SizedBox(
                  // Horizontal ListView
                  height: 280,
                  child: ListView.builder(
                    itemCount: item!.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return _rowItem(
                          context, index, item, 'name', 'price', 'image');
                    },
                  ),
                ),
                _headerItem('Dịch vụ yêu thích nhất', '/second'),
                SizedBox(
                  // Horizontal ListView
                  height: 280,
                  child: ListView.builder(
                    itemCount: topService!.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return _rowItem(context, index, topService, 'item_name',
                          'price', 'image');
                    },
                  ),
                ),
                _headerItem('Chi nhánh', ''),
                SizedBox(
                  // Horizontal ListView
                  height: 280,
                  child: ListView.builder(
                    itemCount: branch!.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return _rowItem(context, index, branch, 'branch_name', '',
                          'branch_image');
                    },
                  ),
                ),
              ],
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
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Image.network(promo![itemIndex]['promo_image'],
          height: 100, width: 350),
    );
  }

  Widget _headerItem(String title, String screen) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          children: [
            Text(title, style: const TextStyle(fontSize: 20)),
            const Spacer(),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(appBgColor),
              ),
              onPressed: () {
                screen != ''
                    ? Navigator.pushNamed(context, screen)
                    : print('123');
              },
              child: const Text('Xem thêm'),
            )
          ],
        ));
  }

  // ignore: unused_element
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
                          width: 140,
                          child: Text(
                            dataItem[rowIndex][name],
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        price != ''
                            ? SizedBox(
                                width: 140,
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
