// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:my_app/Screens/Tab/tab_product.dart';
import 'package:my_app/Screens/Tab/tab_service.dart';
import 'package:my_app/Theme/theme.dart';

class TabService extends StatelessWidget {
  const TabService({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(50),
                child: Container(
                  color: Colors.white,
                  child: TabBar(
                    indicatorColor: Colors.teal[300],
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(
                          icon: Image.asset(
                        'assets/ic-cut.png',
                        height: 35,
                        fit: BoxFit.fill,
                      )),
                      Tab(
                          icon: Image.asset(
                        'assets/ic-fl.png',
                        height: 35,
                        fit: BoxFit.fill,
                      )),
                      Tab(
                          icon: Image.asset(
                        'assets/ic-no.png',
                        height: 35,
                        fit: BoxFit.fill,
                      )),
                    ],
                  ),
                ),
              ),
              title: const Text('Dịch vụ'),
              backgroundColor: appBgColor),
          body: TabBarView(
            children: [
              const TabServices(),
              TabProduct(),
              const Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}
