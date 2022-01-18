// ignore_for_file: unused_element, prefer_typing_uninitialized_variables, must_be_immutable, unnecessary_this

import 'package:flutter/material.dart';
import 'package:my_app/Assets/icon.dart';

class RowItem extends StatelessWidget {
  late final dynamic context;
  late final dynamic dataItem;
  late final dynamic rowIndex;
  late final dynamic image;
  late final dynamic name;
  late final dynamic price;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 200,
        margin: const EdgeInsets.all(8),
        alignment: Alignment.center,
        color: Colors.white,
        child: Column(children: [
          SizedBox(
            width: 200,
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
