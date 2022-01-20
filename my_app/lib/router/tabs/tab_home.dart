// ignore_for_file: prefer_const_literals_to_create_immutables, import_of_legacy_library_into_null_safe, no_logic_in_create_state, must_be_immutable, avoid_print

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Components/row_item.dart';
import 'package:my_app/Screens/moreService.dart';
import 'package:my_app/models/home.dart';

import 'package:http/http.dart' as http;
import 'package:my_app/Theme/theme.dart';

class TabHome extends StatelessWidget {
  const TabHome({Key? key, required this.home}) : super(key: key);
  final Future<List<Home>> home;
  // @override
  // _HomePageState createState() => _HomePageState(home: home);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _HomePageState(home: home),
    );
  }
}

class _HomePageState extends StatelessWidget {
  dynamic promo;
  dynamic featuredService;
  dynamic branch;
  dynamic topService;
  dynamic item;
  dynamic dataApi;
  final Future<List<Home>> home;

  _HomePageState({Key? key, required this.home}) : super(key: key);

  List<Home> parseProducts(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Home>((json) => Home.fromJson(json)).toList();
  }

  Future<List<Home>> fetchProducts() async {
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

      return compute(parseProducts, response.body);
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
      body: FutureBuilder<List<Home>>(
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
                    controller: PageController(viewportFraction: 1),
                    itemBuilder: (BuildContext context, int itemIndex) {
                      return _buildCarouselItem(context, itemIndex);
                    },
                  ),
                ),
                _headerItem('Dịch vụ nổi bật', const MoreService(), context),
                SizedBox(
                  // Horizontal ListView
                  height: 240,
                  child: ListView.builder(
                    itemCount: featuredService!.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return RowItem(
                          context: context,
                          rowIndex: index,
                          dataItem: featuredService,
                          name: 'item_name',
                          price: 'price',
                          image: 'image');
                    },
                  ),
                ),
                _headerItem('Sản phẩm/ dịch vụ/ Thẻ DV', '', context),
                SizedBox(
                  // Horizontal ListView
                  height: 240,
                  child: ListView.builder(
                    itemCount: item!.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return RowItem(
                          context: context,
                          rowIndex: index,
                          dataItem: item,
                          name: 'name',
                          price: 'price',
                          image: 'image');
                    },
                  ),
                ),
                _headerItem('Dịch vụ yêu thích nhất', '', context),
                SizedBox(
                  // Horizontal ListView
                  height: 240,
                  child: ListView.builder(
                    itemCount: topService!.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return RowItem(
                          context: context,
                          rowIndex: index,
                          dataItem: topService,
                          name: 'item_name',
                          price: 'price',
                          image: 'image');
                    },
                  ),
                ),
                _headerItem('Chi nhánh', '', context),
                SizedBox(
                  // Horizontal ListView
                  height: 240,
                  child: ListView.builder(
                    itemCount: branch!.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return RowItem(
                          context: context,
                          rowIndex: index,
                          dataItem: branch,
                          name: 'branch_name',
                          price: '',
                          image: 'branch_image');
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
      width: (MediaQuery.of(context).size.width),
      height: (MediaQuery.of(context).size.width - 100),
      // child: Image.network(promo![itemIndex]['promo_image'], fit: BoxFit.cover),
    );
  }

  Widget _headerItem(String title, dynamic screen, dynamic context) {
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
                    ? Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => screen),
                      )
                    : print('123');
              },
              child: const Text('Xem thêm'),
            )
          ],
        ));
  }

  // ignore: unused_element

}
