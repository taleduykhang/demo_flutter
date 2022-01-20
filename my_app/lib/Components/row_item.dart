// ignore_for_file: unused_element, prefer_typing_uninitialized_variables, must_be_immutable, unnecessary_this, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:my_app/Assets/icon.dart';
import 'package:my_app/Theme/theme.dart';
import 'package:my_app/models/home.dart';

class RowItem extends StatelessWidget {
  final dynamic context;
  final dynamic dataItem;
  final dynamic rowIndex;
  final dynamic image;
  final dynamic name;
  final dynamic price;
  RowItem({
    Key? key,
    this.context,
    this.dataItem,
    this.rowIndex,
    this.image,
    this.name,
    this.price,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 160,
        margin: const EdgeInsets.all(8),
        alignment: Alignment.center,
        color: Colors.white,
        child: Column(children: [
          SizedBox(
            width: 160,
            child: Image.network(this.dataItem[this.rowIndex][this.image]),
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
                          width: 100,
                          child: Text(
                            dataItem[rowIndex][name],
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        price != ''
                            ? SizedBox(
                                width: 100,
                                child: Text(dataItem[rowIndex]['price'],
                                    style: const TextStyle(color: appBgColor)))
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
