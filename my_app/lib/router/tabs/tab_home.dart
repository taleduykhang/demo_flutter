// ignore_for_file: prefer_const_literals_to_create_immutables, import_of_legacy_library_into_null_safe, no_logic_in_create_state, must_be_immutable, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_app/Components/row_item.dart';
import 'package:my_app/Screens/moreService.dart';
import 'package:my_app/Screens/tab_service.dart';
import 'package:my_app/Screens/topService.dart';
import 'package:my_app/models/home.dart';

import 'package:http/http.dart' as http;
import 'package:my_app/Theme/theme.dart';

class TabHome extends StatelessWidget {
  const TabHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _HomePageState(),
    );
  }
}

class _HomePageState extends StatelessWidget {
  final Future<Home>? home;

  const _HomePageState({Key? key, this.home}) : super(key: key);

  Home parseJson(String responseBody) {
    return Home.fromJson(jsonDecode(responseBody));
  }

  Future<Home> fetchHome() async {
    dynamic headers = {
      "X-API-KEY": "",
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
        actions: [
          IconButton(
            icon: Image.asset(
              'assets/ic-fl.png',
              height: 35,
              fit: BoxFit.fill,
            ),
            tooltip: 'Show Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is a screen qr code')));
            },
          ),
          IconButton(
            icon: Image.asset(
              'assets/ic-cut.png',
              height: 35,
              fit: BoxFit.fill,
            ),
            tooltip: 'Show Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is a screen cart')));
            },
          ),
        ],

        centerTitle: true,
      ),
      body: FutureBuilder<Home>(
        future: fetchHome(),
        builder: (context, data) {
          if (data.connectionState == ConnectionState.done) {
            return ListView(
              children: <Widget>[
                SizedBox(
                  // Vertical ListView
                  height: 150.0,
                  child: PageView.builder(
                    itemCount: data.data!.dataReturn!.promo!.length,
                    controller: PageController(viewportFraction: 1),
                    itemBuilder: (BuildContext context, int itemIndex) {
                      return _buildCarouselItem(
                          context, itemIndex, data.data?.dataReturn?.promo);
                    },
                  ),
                ),
                _headerItem('Dịch vụ nổi bật', const MoreService(), context),
                SizedBox(
                  // Horizontal ListView
                  height: 260,
                  child: ListView.builder(
                    itemCount: data.data!.dataReturn!.featuredService!.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return RowItem(
                        name: data
                            .data!.dataReturn!.featuredService![index].itemName,
                        price: data
                            .data!.dataReturn!.featuredService![index].price,
                        image: data
                            .data!.dataReturn!.featuredService![index].image,
                        index: index,
                        dataApi: data.data!.dataReturn!.featuredService,
                        duration: data
                            .data!.dataReturn!.featuredService![index].duration,
                        categoryName: data.data!.dataReturn!
                            .featuredService![index].categoryName,
                      );
                    },
                  ),
                ),
                _headerItem(
                    'Sản phẩm/ dịch vụ/ Thẻ DV', const TabService(), context),
                SizedBox(
                  // Horizontal ListView
                  height: 260,
                  child: ListView.builder(
                    itemCount: data.data!.dataReturn!.item!.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return RowItem(
                        name: data.data!.dataReturn!.item![index].name,
                        price: data.data!.dataReturn!.item![index].price,
                        image: data.data!.dataReturn!.item![index].image,
                      );
                    },
                  ),
                ),
                _headerItem(
                    'Dịch vụ yêu thích nhất', const TopServices(), context),
                SizedBox(
                  // Horizontal ListView
                  height: 260,
                  child: ListView.builder(
                    itemCount: data.data!.dataReturn!.topService!.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return RowItem(
                        name:
                            data.data!.dataReturn!.topService![index].itemName,
                        price: data.data!.dataReturn!.topService![index].price,
                        image: data.data!.dataReturn!.topService![index].image,
                        index: index,
                        dataApi: data.data!.dataReturn!.topService,
                        duration:
                            data.data!.dataReturn!.topService![index].duration,
                        categoryName: data
                            .data!.dataReturn!.topService![index].categoryName,
                        totalUsed:
                            data.data!.dataReturn!.topService![index].totalUsed,
                      );
                    },
                  ),
                ),
                _headerItem('Chi nhánh', '', context),
                SizedBox(
                  // Horizontal ListView
                  height: 260,
                  child: ListView.builder(
                    itemCount: data.data!.dataReturn!.branch!.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return RowItem(
                          name:
                              data.data!.dataReturn!.branch![index].branchName,
                          image: data
                              .data!.dataReturn!.branch![index].branchImage);
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

  Widget _buildCarouselItem(
      BuildContext context, int itemIndex, dynamic promo) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      width: (MediaQuery.of(context).size.width),
      height: (MediaQuery.of(context).size.width - 100),
      child: Image.network(promo![itemIndex].promoImage, fit: BoxFit.cover),
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
                screen != null
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
