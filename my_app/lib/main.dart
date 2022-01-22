// ignore_for_file: import_of_legacy_library_into_null_safe, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:my_app/Assets/icon.dart';
import 'package:my_app/Theme/theme.dart';
import 'package:my_app/router/tabs/tab_account.dart';
import 'package:my_app/router/tabs/tab_gallery.dart';
import 'package:my_app/router/tabs/tab_home.dart';
import 'package:my_app/router/tabs/tab_info.dart';
import 'package:my_app/router/tabs/tab_promo.dart';
import 'Screens/moreService.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const HomePage(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/second': (context) => const MoreService(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();

    // Initialize the Tab Controller
    controller = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    // Dispose of the Tab Controller
    controller.dispose();
    super.dispose();
  }

  // late final Future<List<Home>> home;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: TabBarView(
          // Add tabs as widgets
          children: <Widget>[
            const TabHome(),
            const TabPromo(),
            const TabInfo(),
            const TabGallery(),
            const TabAccount()
          ],
          // set the controller
          controller: controller,
        ),
        bottomNavigationBar: Container(
          // set the color of the bottom navigation bar
          color: Colors.white,
          // set the tab bar as the child of bottom navigation bar
          child: TabBar(
            labelColor: appBgColor,
            labelStyle: const TextStyle(fontSize: 8),
            tabs: <Tab>[
              Tab(
                text: 'Trang chủ',
                iconMargin: const EdgeInsets.only(bottom: 0),
                icon: icHome,
              ),
              Tab(
                text: 'Khuyến mãi',
                iconMargin: const EdgeInsets.only(bottom: 0),
                icon: icGift,
              ),
              Tab(
                  child: SizedBox(
                      child: Column(
                children: [
                  Image.asset(
                    'assets/logo.png',
                    height: 45,
                    fit: BoxFit.fill,
                  )
                ],
              ))),
              Tab(
                text: 'Gallery',
                iconMargin: const EdgeInsets.only(bottom: 0),
                icon: icImage,
              ),
              Tab(
                text: 'Tài khoản',
                iconMargin: const EdgeInsets.only(bottom: 0),
                icon: icUser,
              ),
            ],
            // setup the controller
            controller: controller,
          ),
        ));
  }
}
