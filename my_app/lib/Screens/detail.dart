import 'package:flutter/material.dart';
import 'package:my_app/Theme/theme.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

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
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
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
                )
              ],
            )),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Wrap(
              // crossAxisAlignment: CrossAxisAlignment.start,
              // direction: Axis.horizontal,
              children: [
                data['categoryName'] != null
                    ? Container(
                        margin: const EdgeInsets.only(right: 10.0),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: appGray,
                            ),
                            borderRadius: BorderRadius.circular(20.0),
                            color: appGray),
                        // color: appGray,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 2),
                        child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'assets/ic-fl.png',
                                height: 35,
                                fit: BoxFit.fill,
                              ),
                              SizedBox(
                                  child: Text(data['categoryName'],
                                      style:
                                          const TextStyle(color: appBgColor)))
                            ]),
                      )
                    : const SizedBox(),
                data['duration'] != null
                    ? Container(
                        margin: const EdgeInsets.only(right: 10.0),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: appGray,
                            ),
                            borderRadius: BorderRadius.circular(20.0),
                            color: appGray),
                        // color: appGray,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 2),
                        child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'assets/ic-no.png',
                                height: 35,
                                fit: BoxFit.fill,
                              ),
                              SizedBox(
                                  child: Text(data['duration'],
                                      style:
                                          const TextStyle(color: appBgColor)))
                            ]),
                      )
                    : const SizedBox(),
                data['totalUsed'] != null
                    ? Container(
                        margin: const EdgeInsets.only(right: 10.0),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: appGray,
                            ),
                            borderRadius: BorderRadius.circular(20.0),
                            color: appGray),
                        // color: appGray,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 2),
                        child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'assets/ic-cut.png',
                                height: 35,
                                fit: BoxFit.fill,
                              ),
                              SizedBox(
                                  child: Text(data['totalUsed'],
                                      style:
                                          const TextStyle(color: appBgColor)))
                            ]),
                      )
                    : const SizedBox()
              ],
            ))
      ]),
    );
  }
}
