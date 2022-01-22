// ignore_for_file: prefer_const_literals_to_create_immutables, avoid_print, unnecessary_const, must_be_immutable, no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:my_app/Theme/theme.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<DetailScreen> {
  int count = 1;
  void add() {
    setState(() {
      count = count + 1;
    });
  }

  void sub() {
    setState(() {
      count = count - 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as dynamic;
    final title = ModalRoute.of(context)!.settings.name as String;
    // Use the Todo to create the UI.
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          backgroundColor: appBgColor,
        ),
        body: ListView(children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10.0),
            width: (MediaQuery.of(context).size.width),
            height: (MediaQuery.of(context).size.width * 1.1),
            child: Image.network(data['image'], fit: BoxFit.cover),
          ),
          Container(
              height: (MediaQuery.of(context).size.width),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 5.0,
                  ),
                ],
              ),
              transform: Matrix4.translationValues(0.0, -50.0, 0.0),
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Text(data['name'],
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    child: Text(data['price'],
                        style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: appBgColor)),
                  ),
                  Wrap(
                    children: [
                      data['categoryName'] != null
                          ? Type('assets/ic-fl.png', data, 'categoryName')
                          : const SizedBox(),
                      data['duration'] != null
                          ? Type('assets/ic-no.png', data, 'duration')
                          : const SizedBox(),
                      data['totalUsed'] != null
                          ? Type('assets/ic-cut.png', data, 'totalUsed')
                          : const SizedBox()
                    ],
                  ),
                ],
              )),
        ]),
        bottomSheet: Container(
          height: 100,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 5.0,
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(10.0)),
                        color: Colors.grey,
                      ),
                      child: IconButton(
                          color: appBgColor,
                          icon: const Icon(Icons.remove),
                          onPressed: () {
                            sub();
                          }),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text('$count'),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.horizontal(
                            right: Radius.circular(10.0)),
                        color: appBgColor,
                      ),
                      child: IconButton(
                          color: Colors.white,
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            add();
                          }),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              TextButton(
                child: const Text('Thêm vào giỏ hàng'),
                onPressed: () {},
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor: MaterialStateProperty.all<Color>(appBgColor),
                ),
              )
            ],
          ),
        ));
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
