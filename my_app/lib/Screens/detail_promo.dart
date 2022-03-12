// ignore_for_file: prefer_const_literals_to_create_immutables, unnecessary_const, must_be_immutable, no_logic_in_create_state, import_of_legacy_library_into_null_safe

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_app/Theme/theme.dart';
import 'package:my_app/models/detail_promo.dart';
import 'package:http/http.dart' as http;
import 'package:qr_flutter/qr_flutter.dart';

class DetailPromoScreen extends StatefulWidget {
  const DetailPromoScreen({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<DetailPromoScreen> {
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as String;
    final title = ModalRoute.of(context)!.settings.name as String;
    DetailPromo parseJson(String responseBody) {
      return DetailPromo.fromJson(jsonDecode(responseBody));
    }

    Future<DetailPromo> fetchDetail() async {
      dynamic headers = {
        "X-API-KEY": "",
        "Accept": "application/json",
        "Content-Type": "application/json",
      };
      var uri = Uri.parse('https://demo.myspa.vn/moba/v1/Promo/get_detail')
          .replace(query: 'id=$id');
      final response = await http.get(uri, headers: headers);
      if (response.statusCode == 200) {
        return parseJson(response.body);
      } else {
        throw Exception('Unable to fetch products from the REST API');
      }
    }

    // Use the Todo to create the UI.
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          backgroundColor: appBgColor,
        ),
        body: FutureBuilder<DetailPromo>(
          future: fetchDetail(),
          builder: (context, data) {
            if (data.connectionState == ConnectionState.done) {
              return ListView(
                children: <Widget>[
                  Image.network((data.data!.promoData!.image).toString()),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text((data.data!.promoData!.title).toString(),
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              Container(
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.horizontal(
                                        left: Radius.circular(10.0)),
                                    color: appBgColor,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey,
                                        offset: Offset(0.0, 1.0), //(x,y)
                                        blurRadius: 5.0,
                                      ),
                                    ],
                                  ),
                                  height: 35,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Row(
                                    children: [
                                      Text(
                                          (data.data!.promoData!.discountValue)
                                              .toString(),
                                          style: const TextStyle(
                                              color: Colors.white)),
                                      Text(
                                          (data.data!.promoData!.discountUnit)
                                              .toString(),
                                          style: const TextStyle(
                                              color: Colors.white))
                                    ],
                                  )),
                              Container(
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.horizontal(
                                        right: Radius.circular(10.0)),
                                    color: Colors.white,
                                  ),
                                  height: 35,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Center(
                                    child: Text(
                                        (data.data!.promoData!.couponCode)
                                            .toString()),
                                  )),
                            ],
                          ),
                        ),
                        Container(
                            // padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Thời gian',
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: appBgColor,
                                    fontWeight: FontWeight.bold)),
                            Row(
                              children: [
                                Text((data.data!.promoData!.dateStart)
                                    .toString()),
                                const Text('-'),
                                Text(
                                    (data.data!.promoData!.dateEnd).toString()),
                              ],
                            )
                          ],
                        )),
                        Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Sản phẩm áp dụng',
                                    style: const TextStyle(
                                        fontSize: 20,
                                        color: appBgColor,
                                        fontWeight: FontWeight.bold)),
                                Text((data.data!.promoData!.description)
                                    .toString()),
                              ],
                            )),
                        Container(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Nội dung',
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: appBgColor,
                                    fontWeight: FontWeight.bold)),
                            Text((data.data!.promoData!.content).toString()),
                          ],
                        )),
                        Center(
                          child: QrImage(
                            data: (data.data!.promoData!.couponCode).toString(),
                            version: QrVersions.auto,
                            embeddedImage: const AssetImage('assets/ic-fl.png'),
                            embeddedImageStyle: QrEmbeddedImageStyle(
                              size: const Size(30, 30),
                            ),
                            size: 150.0,
                          ),
                        )
                      ],
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
        bottomSheet: Container(
            // height: 100,
            width: (MediaQuery.of(context).size.width),
            // padding: const EdgeInsets.symmetric(horizontal: 20),
            margin: const EdgeInsets.only(bottom: 30, right: 20, left: 20),
            child: TextButton(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Text('Thêm vào giỏ hàng'),
                ),
                onPressed: () {},
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor: MaterialStateProperty.all<Color>(appBgColor),
                ))));
  }

  // ignore: non_constant_identifier_names
  Widget Type(String image, dynamic data, String item) {
    return Container(
      margin: const EdgeInsets.only(right: 10.0),
      decoration: BoxDecoration(
          border: Border.all(
            color: appGray,
          ),
          borderRadius: BorderRadius.circular(20.0),
          color: appGray),
      // color: appGray,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: <Widget>[
            Image.asset(
              image,
              height: 35,
              fit: BoxFit.fill,
            ),
            SizedBox(
                child:
                    Text(data[item], style: const TextStyle(color: appBgColor)))
          ]),
    );
  }
}
