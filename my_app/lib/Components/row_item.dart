// ignore_for_file: unused_element, prefer_typing_uninitialized_variables, must_be_immutable, unnecessary_this, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:my_app/Assets/icon.dart';
import 'package:my_app/Screens/detail.dart';
import 'package:my_app/Theme/theme.dart';

class RowItem extends StatelessWidget {
  final dynamic image;
  final dynamic name;
  final dynamic price;
  final dynamic context;
  final dynamic dataApi;
  final dynamic index;
  final dynamic duration;
  final dynamic categoryName;
  final dynamic totalUsed;

  RowItem(
      {Key? key,
      this.name,
      this.image,
      this.price,
      this.context,
      this.dataApi,
      this.index,
      this.duration,
      this.categoryName,
      this.totalUsed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 180,
        margin: const EdgeInsets.all(8),
        // padding: const EdgeInsets.all(0),
        // alignment: Alignment.center,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 5.0,
            ),
          ],
        ),
        child: TextButton(
            onPressed: () {
              Navigator.of(context, rootNavigator: true).push(
                MaterialPageRoute(
                  builder: (context) => const DetailScreen(),
                  settings: RouteSettings(
                    arguments: {
                      "name": name,
                      "image": image,
                      "price": price,
                      "duration": duration,
                      "categoryName": categoryName,
                      "totalUsed": totalUsed
                    },
                    name: 'Chi tiết',
                  ),
                ),
              );
            },
            child: Column(children: [
              SizedBox(
                width: 180,
                child: Image.network(image),
              ),
              Container(
                margin: const EdgeInsets.all(5),
                child: Row(
                  children: [
                    SizedBox(
                      child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 95,
                              child: Text(name,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(color: Colors.black)),
                            ),
                            price != null
                                ? SizedBox(
                                    width: 95,
                                    child: Text(price,
                                        style:
                                            const TextStyle(color: appBgColor)))
                                : const SizedBox()
                          ]),
                    ),
                    IconButton(
                      padding: const EdgeInsets.all(0),
                      onPressed: () {
                        // print(dataApi[index]);
                      },
                      icon: icCart,
                    )
                  ],
                ),
              )
            ])));
    // return
  }
}
