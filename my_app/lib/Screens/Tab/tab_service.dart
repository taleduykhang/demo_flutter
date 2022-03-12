// ignore_for_file: avoid_print, prefer_is_empty, unnecessary_new, unnecessary_const, import_of_legacy_library_into_null_safe, prefer_final_fields, non_constant_identifier_names

import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class TabServices extends StatelessWidget {
  const TabServices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        // Remove the debug banner
        debugShowCheckedModeBanner: false,
        home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // We will fetch data from this Rest api
  final _baseUrl = 'https://demo.myspa.vn/moba/v2/Service/get_list';
  dynamic headers = {
    "X-API-KEY": "",
    "Accept": "application/json",
    "Content-Type": "application/json",
  };
  // At the beginning, we fetch the first 20 posts
  int _page = 1;
  int _limit = 10;

  // There is next page or not
  bool _hasNextPage = true;

  // Used to display loading indicators when _firstLoad function is running
  bool _isFirstLoadRunning = false;

  // Used to display loading indicators when _loadMore function is running
  bool _isLoadMoreRunning = false;

  // This holds the posts fetched from the server
  dynamic _posts;

  // This function will be called when the app launches (see the initState function)
  void _firstLoad() async {
    setState(() {
      _isFirstLoadRunning = true;
    });
    try {
      final res = await http.get("$_baseUrl?page=$_page&limit=$_limit",
          headers: headers);
      if (res.statusCode == 200) {
        setState(() {
          _posts = jsonDecode(res.body)['items'];
        });
      }
    } catch (err) {
      print('Something went wrong');
    }

    setState(() {
      _isFirstLoadRunning = false;
    });
  }

  // This function will be triggered whenver the user scroll
  // to near the bottom of the list view
  void _loadMore() async {
    if (_hasNextPage == true &&
        _isFirstLoadRunning == false &&
        _isLoadMoreRunning == false &&
        _controller.position.extentAfter < 300) {
      setState(() {
        _isLoadMoreRunning = true; // Display a progress indicator at the bottom
      });
      _page += 1; // Increase _page by 1
      try {
        final res = await http.get(
            Uri.parse("$_baseUrl?page=$_page&limit=$_limit"),
            headers: headers);

        final dynamic fetchedPosts = jsonDecode(res.body)['items'];

        if (fetchedPosts.length > 0) {
          setState(() {
            _posts.addAll(fetchedPosts);
          });
        } else {
          // This means there is no more data
          // and therefore, we will not send another GET request
          setState(() {
            _hasNextPage = false;
          });
        }
      } catch (err) {
        print('Something went wrong!');
      }

      setState(() {
        _isLoadMoreRunning = false;
      });
    }
  }

  // The controller for the ListView
  late ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _firstLoad();
    _controller = new ScrollController()..addListener(_loadMore);
  }

  @override
  void dispose() {
    _controller.removeListener(_loadMore);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _isFirstLoadRunning
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Expanded(
                    child: ListView.builder(
                  controller: _controller,
                  itemCount: _posts.length,
                  itemBuilder: (_, index) =>
                      // Column(children: [AccordionState(_, index)]),
                      SizedBox(
                          child: Accordion(
                              maxOpenSections: 3,
                              headerPadding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              disableScrolling: true,
                              children: [
                        AccordionSection(
                          isOpen: false,
                          header: AccordionState(_, _posts![index]['name']),
                          content: Content(_, _posts![index]['items']),
                          contentHorizontalPadding: 20,
                          contentBorderWidth: 1,
                        ),
                      ])),
                )),

                // when the _loadMore function is running
                if (_isLoadMoreRunning == true)
                  const Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 40),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),

                // When nothing else to load
                if (_hasNextPage == false)
                  Container(
                    color: Colors.amber,
                    child: const Center(
                      child: const Text('Hết data',
                          style: const TextStyle(fontSize: 15)),
                    ),
                  ),
              ],
            ),
    );
  }

  Widget AccordionState(BuildContext context, dynamic title) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Flexible(
          child: Text(title,
              style: const TextStyle(color: Colors.white, fontSize: 18)),
        ));
  }

  Widget Content(BuildContext context, dynamic items) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child:
            // ListView.builder(
            //     itemCount: items.length,
            //     itemBuilder: (_, index) => Text((items[index]['id']).toString()))
            Text(items.toString(), style: const TextStyle(fontSize: 10)));
  }
}
